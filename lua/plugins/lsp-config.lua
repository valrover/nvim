return {
    {
        "williamboman/mason.nvim",
        --lazy = false,
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim"
        },
        config = function()
            local mason = require("mason")

            local mason_tool_installer = require("mason-tool-installer")

            mason.setup()

            mason_tool_installer.setup({
                ensure_installed = {
                    "clang-format",
                    "stylua",
                    "yapf",
                    "yamlfix"

                }
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        --lazy = false,
        opts = {
            auto_install = true,
        },
        config = function ()
            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup({
                ensure_installed = {
                    "clangd",
                    "lua_ls",
                    "pyright",
                },
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        --lazy = false,
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
            { "folke/neodev.nvim", opts = {} },
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup({
                capabilities = capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
