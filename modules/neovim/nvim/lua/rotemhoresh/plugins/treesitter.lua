return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c",
        "cpp",
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "typescript",
        "html",
        "css",
        "sql",
        "go",
        "gomod",
        "gosum",
        "templ",
        "make",
        "json",
        "yaml",
        "bash",
      },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
      },
      indent = { enable = true },
    })
  end
}
