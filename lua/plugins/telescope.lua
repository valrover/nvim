return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-f>", builtin.find_files, {})
      vim.keymap.set("n", "<C-g>", builtin.live_grep, {})
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
      vim.keymap.set("n", "<C-w>", builtin.diagnostics, {})
      vim.keymap.set("n", "C-i", builtin.lsp_implementations, {})
      vim.keymap.set("n", "C-d", builtin.lsp_definitions, {})

      require("telescope").load_extension("ui-select")
    end,
  },
}
