-- DOCS:
-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#snippets
--
-- GLOBAL VARS:
-- https://github.com/L3MON4D3/LuaSnip/blob/69cb81cf7490666890545fef905d31a414edc15b/lua/luasnip/config.lua#L82-L104§

local session = require("luasnip.session")

local env = session.config.snip_env
local s = env["s"]   -- snippet
local c = env["c"]   -- choice node
local sn = env["sn"] -- choice node
local t = env["t"]   -- text node
local i = env["i"]   -- insert node
local d = env["d"]   -- dynamic node

-- Function to get all types from the current buffer using Tree-sitter
local function types_from_treesitter()
  local ts = vim.treesitter
  local parser = ts.get_parser(0, "go")
  local tree = parser:parse()[1]
  local root = tree:root()

  local query = ts.query.parse("go", [[
        (type_spec name: (type_identifier) @type_name)
    ]])

  local types = {}
  for _, captures, _ in query:iter_matches(root, 0) do
    local type_name = vim.treesitter.get_node_text(captures[1], 0)
    table.insert(types, type_name)
  end

  -- Create receiver choices based on types
  local choices = {}
  for _, type_name in ipairs(types) do
    table.insert(choices, t(type_name:sub(1, 1):lower() .. " *" .. type_name))
  end

  if #choices == 0 then
    table.insert(choices, t("r *Type"))
  end

  return choices
end

return {
  s({ trig = "meth", name = "Method", dscr = "Declare a method for a type" }, {
    t("func ("), d(1, function()
    return sn(nil, c(1, types_from_treesitter()))
  end), t(") "), i(2, "MethodName"), t("("), i(3, ""), t(") "), i(4, "error"), t({
    " {", "\t" }),
    i(0),
    t({ "", "}" }),
  })
}
