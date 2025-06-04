return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            "windwp/nvim-ts-autotag"
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "cpp",
                    "python",
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "yaml",
                    "xml",
                    "markdown",
                    "markdown_inline",
                    "json",
                    "matlab",
                    "bibtex",
                    "bash",
                },
                sync_install = false,
                auto_install = true,
                ignore_install = {"javascript"},
                highlight = { enable = true },
                indent = { enable = true },
                autotag = { enable = true },
                modules = {},
            })
        end,
    },
}
