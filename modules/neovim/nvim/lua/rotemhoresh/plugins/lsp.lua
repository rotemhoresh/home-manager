return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },

  config = function()
    vim.keymap.set("n", "gd", vim.lsp.buf.definition)

    vim.filetype.add({ extension = { templ = "templ" } })

    local templ_format = function()
      local bufnr = vim.api.nvim_get_current_buf()
      local filename = vim.api.nvim_buf_get_name(bufnr)
      local cmd = "templ fmt " .. vim.fn.shellescape(filename)

      vim.fn.jobstart(cmd, {
        on_exit = function()
          -- Reload the buffer only if it"s still the current buffer
          if vim.api.nvim_get_current_buf() == bufnr then
            vim.cmd("e!")
          end
        end,
      })
    end

    vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = templ_format })

    local cmp = require("cmp")
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities())

    require("lspconfig").nixd.setup({
      settings = {
        nixd = {
          formatting = {
            command = { "nixfmt" }
          }
        }
      },
      capabilities = capabilities
    })

    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "gopls",
        "templ",
        "html",
        "htmx",
        "tailwindcss",
        "bashls",
        "jsonls",
      },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,
        ["html"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.html.setup({
            capabilities = capabilities,
            filetypes = { "html", "templ" },
          })
        end,
        ["htmx"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.htmx.setup({
            capabilities = capabilities,
            filetypes = { "html", "templ" },
          })
        end,
        ["tailwindcss"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.tailwindcss.setup({
            capabilities = capabilities,
            filetypes = { "templ", "html", "javascript", "typescript", "react", "svelte" },
            settings = {
              tailwindCSS = {
                includeLanguages = {
                  templ = "html",
                },
              },
            },
          })
        end,
        ["gopls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.gopls.setup {
            capabilities = capabilities,
            settings = {
              gopls = {
                gofumpt = true,        -- Use `gofumpt` for stricter formatting
                analyses = {
                  unusedparams = true, -- Detect unused parameters
                },
                staticcheck = true,    -- Enable static analysis
                experimentalTemplateSupport = true,
              },
            },
            on_attach = function(client, bufnr)
              -- Format on save
              if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                  buffer = bufnr,
                  callback = function()
                    -- Format and organize imports before saving the file
                    vim.lsp.buf.format()
                    vim.lsp.buf.code_action({
                      context = { only = { "source.organizeImports" } },
                      apply = true,
                    })
                  end,
                })
              end

              -- TODO: check if there is a better solution
              -- Key mappings for LSP
              local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
              local opts = { noremap = true, silent = true }

              -- Set "gd" to go to definition
              buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
            end,
          }
        end,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                  globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                }
              }
            }
          }
        end,
      }
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      formatting = {
        format = function(entry, vim_item)
          -- Source
          vim_item.menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[LaTeX]",
          })[entry.source.name]
          return vim_item
        end
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
        { name = "nvim_lsp_signature_help" },
      }, {
        { name = "buffer" },
      }),
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })

    vim.diagnostic.config({
      -- update_in_insert = true,
      float = {
        -- focusable = false,
        -- style = "minimal",
        border = "rounded",
        source = true,
        -- header = "",
        -- prefix = "",
      },
    })


    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded"
    })
  end
}
