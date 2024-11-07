return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    {
      "<leader>pv",
      function()
        local oil = require("oil");
        oil.open(oil.get_current_dir(vim.api.nvim_get_current_buf()));
      end,
      { desc = "Open parent directory of current buffer" }
    }
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
