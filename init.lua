-- Lazy config
require("config.lazy")

-- ROS config
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.launch",
    callback = function()
        vim.bo.filetype = "xml"
    end,
})
