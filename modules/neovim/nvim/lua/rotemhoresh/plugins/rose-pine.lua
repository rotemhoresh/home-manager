return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      variant = "moon",

      styles = {
        italic = false
      },

      highlight_groups = {
        TelescopeBorder = { bg = "none", fg = "highlight_high" },
        FloatBorder = { bg = "none", fg = "highlight_high" }
      }
    })

    vim.cmd.colorscheme("rose-pine-moon")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "WinBar", { bg = "none" })
    vim.api.nvim_set_hl(0, "WinBarNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
  end
}
