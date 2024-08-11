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
                    "julia",
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "yaml",
                    "xml",
                    "markdown",
                    "json",
                    "matlab",
                    "bibtex",
                    "bash",
                },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                autotag = { enable = true },
            })
        end,
    },
}
