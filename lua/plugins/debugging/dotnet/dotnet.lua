local dap = require "dap"
local rpc = require "dap.rpc"
local merge = require("helpers").merge

local cache = {
    vsda = nil,
    vsdbg = nil,
    code = nil,
}

local function get_required_paths()
    if cache.code and cache.vsda and cache.vsdbg then
        return cache
    end

    local code = vim.fn.exepath "code"
    code = code:match "(.+/)bin/code" or code:match "(.-\\)bin\\code"
    if not code then
        vim.notify("VSCode not found in PATH", vim.log.levels.ERROR)
        error "VSCode not found in PATH"
    end

    local vsda = code .. "/resources/app/node_modules.asar.unpacked/vsda/build/Release/vsda.node"

    if vim.fn.filereadable(vsda) == 0 then
        vim.notify("vsda.node not found" .. vsda, vim.log.levels.ERROR)
        error "vsda.node not found"
    end

    local extensions = vim.fn.expand "$HOME" .. "/.vscode/extensions/"
    -- TODO: Add support for Linux; idk what the path is, probably only "vsdbg" ?
    local vsdbg = vim.fn.glob(extensions .. "ms-dotnettools.csharp-*/.debugger/*/vsdbg-ui.exe", false, true)[1]

    if vim.fn.filereadable(vsdbg) == 0 then
        vim.notify("vsdbg-ui.exe not found", vim.log.levels.ERROR)
        error "vsdbg-ui.exe not found"
    end

    cache.vsda = vsda
    cache.vsdbg = vsdbg
    cache.code = code

    return cache
end

local function sign_args(vsda_path, args)
    local sign = [[
        const vsda_location = process.argv[2];
        const args_to_sign = process.argv.slice(3);

        const a = require(vsda_location);
        const signer = new a.signer();

        args_to_sign.forEach(arg => {
            console.log(signer.sign(arg));
        });
    ]]

    local tmp = os.tmpname() .. ".js"

    local success, result = xpcall(function()
        local fd = assert(io.open(tmp, "w"), "Failed to create temporary file")
        fd:write(sign)
        fd:close()

        local cmd = string.format('node "%s" "%s" %s', tmp, vsda_path, args)
        local res = assert(io.popen(cmd), "Failed to execute Node.js command")
        local output = res:read "*a"

        if not output or output == "" then
            error "Signing returned an empty result"
        end

        return string.gsub(output, "\n", "")
    end, debug.traceback)

    os.remove(tmp)

    if not success then
        error(result)
    end

    return result
end

local function handshake(self, request_payload)
    local success, signature = pcall(function()
        return sign_args(get_required_paths().vsda, request_payload.arguments.value)
    end)

    if not success then
        vim.notify("Error during handshake: " .. signature, vim.log.levels.ERROR)
        return
    end

    local response = {
        type = "response",
        seq = 0,
        command = "handshake",
        request_seq = request_payload.seq,
        success = true,
        body = {
            signature = signature,
        },
    }

    local msg = rpc.msg_with_content_length(vim.json.encode(response))
    self.client.write(msg)
end

dap.adapters.coreclr = {
    id = "coreclr",
    type = "executable",
    -- This will search for the paths as soon as neovim starts, which is not ideal
    command = get_required_paths().vsdbg,
    args = { "--interpreter=vscode" },
    reverse_request_handlers = {
        handshake = handshake,
    },
}

local base = {
    stopAtEntry = false,
    clientID = "vscode",
    clientName = "Visual Studio Code",
    columnsStartAt1 = true,
    linesStartAt1 = true,
    locale = "en",
    pathFormat = "path",
    externalConsole = false,
    console = "integratedTerminal",
}

local configurations = {
    {
        name = "Attach to .NET",
        type = "coreclr",
        request = "attach",
        processId = "${command:pickProcess}",
    },
}

for _, config in ipairs(configurations) do
    merge(base, config)
end

dap.configurations.cs = configurations
