return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  lazy = false,
  config = function()
    -- require("luasnip").config.set_config({
    --   -- Enable autotriggered snippets
    --   enable_autosnippets = true,
    -- })
    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/rotemhoresh/snippets" })

    local ls = require("luasnip")

    vim.keymap.set({ "i", "s" }, "<C-K>", function() ls.jump(1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })
  end
}
