-- Updated LSP configuration using `vim.lsp.enable`
return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim"
        },
        config = function()
            require("mason").setup()
            require("mason-tool-installer").setup({
                ensure_installed = { "clang-format", "stylua", "ruff" }
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            auto_install = true,
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "clangd", "lua_ls", "pylsp" },
                automatic_enable = { exclude = { "clangd", "lua_ls", "pylsp" } },
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
            { "folke/neodev.nvim", opts = {} },
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.offsetEncoding = "utf-8"

            -- Use vim.lsp.enable instead of require('lspconfig').<server>.setup
            vim.lsp.enable("clangd", {
                capabilities = capabilities,
                cmd = { "clangd", "--completion-style=bundled", "--header-insertion=never" },
            })

            vim.lsp.enable("lua_ls", {
                capabilities = capabilities,
            })

            vim.lsp.enable("pylsp", {
                capabilities = capabilities,
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = { ignore = { "E501", "W503" } },
                        },
                        signature = {
                            formatter = "ruff",
                            ignore = { "E501", "W503" },
                        },
                    },
                },
            })

            -- Key mappings and diagnostic configurations
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>fc", vim.lsp.buf.format, {})
            vim.diagnostic.config({ virtual_text = false })
            vim.o.updatetime = 250
            vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
        end,
    },
}
