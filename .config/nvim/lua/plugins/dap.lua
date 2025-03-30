local dap = require('dap');

dap.adapters.gdb = {
        id = 'gdb',
        type = 'executable',
        command = 'gdb',
        args = { "--interpreter=dap", "--quiet"}
}

dap.configurations.c = {
        {
                name = "Run executable (GDB)",
                type = "gdb",
                request = "launch",
                program = function()
                        local path = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                        return (path and path ~= '') and path or dap.ABORT
                end,
        },
        {
                name = 'Run executable with arguments (GDB)',
                type = 'gdb',
                request = 'launch',
                -- This requires special handling of 'run_last', see
                -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
                program = function()
                        local path = vim.fn.input({
                                prompt = 'Path to executable: ',
                                default = vim.fn.getcwd() .. '/',
                                completion = 'file',
                        })

                        return (path and path ~= '') and path or dap.ABORT
                end,
                args = function()
                        local args_str = vim.fn.input({
                                prompt = 'Arguments: ',
                        })
                        return vim.split(args_str, ' +')
                end,
        },
        {
                name = 'Attach to process (GDB)',
                type = 'gdb',
                request = 'attach',
                processId = require('dap.utils').pick_process,
        }
}

dap.adapters.php = {
        type = 'executable',
        command = 'node',
        args = { '/Users/c/Developer/tools/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
        {
                type = 'php',
                request = 'launch',
                name = 'Listen for Xdebug',
                port = 9003,
        }
}

dap.adapters.chrome = {
        type = "executable",
        command = "node",
        args = { os.getenv("HOME") .. "/path/to/vscode-chrome-debug/out/src/chromeDebug.js" } -- TODO adjust
}

dap.configurations.javascriptreact = { -- change this to javascript if needed
        {
                type = "chrome",
                request = "attach",
                program = "${file}",
                cwd = vim.fn.getcwd(),
                sourceMaps = true,
                protocol = "inspector",
                port = 9222,
                webRoot = "${workspaceFolder}"
        }
}

dap.configurations.typescript = { -- change to typescript if needed
        {
                type = "chrome",
                request = "attach",
                program = "${file}",
                cwd = vim.fn.getcwd(),
                sourceMaps = true,
                protocol = "inspector",
                port = 9222,
                webRoot = "${workspaceFolder}"
        }
}

require("nvim-dap-virtual-text").setup()

require("mason-nvim-dap").setup()

require("dapui").setup({
        library = { "nvim-dap-ui" },
})
