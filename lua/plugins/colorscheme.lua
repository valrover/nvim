return {
    -- the colorscheme should be available when starting Neovim
    {
        "nyoom-engineering/oxocarbon.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.opt.background = "dark" -- set this to dark or light
            vim.cmd.colorscheme("oxocarbon")
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
    },
}
