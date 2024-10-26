return {
  "folke/trouble.nvim",
  config = function()
    require("trouble").setup()

    vim.keymap.set("n", "<leader>td", function()
        require("trouble").toggle({ mode = "diagnostics", buf = 0 })
      end,
      { desc = "Toggle Diagnostics List (Trouble)" })
  end
}
