return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "stevearc/conform.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },

  config = function()
    require("conform").setup({
      formatters_by_ft = {
      }
    })
    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities()
    )

    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      -- A list of servers to automatically install if they're not already installed.
      -- Example: { "rust_analyzer@nightly", "lua_ls" }
      -- This setting has no relation with the `automatic_installation` setting.
      ensure_installed = {
        -- "tsserver",
        -- "html",
        -- "cssls",
        -- "ruff",
        -- "pylsp",
        -- "rubocop",
        -- "ruby_lsp",
        -- "solargraph",
        "pyright",
        "lua_ls",
        -- "hydra_lsp",
      },

      handlers = {
        function(server_name)
          -- default handler (optional)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,

        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                -- runtime = { version = "Lua 5.1" },
                completion = {
                  callSnippet = "Both"  -- Mostra nome e snippet de chamada
                },
                diagnostics = {
                  globals = { "vim", "it", "hs", "describe", "before_each", "after_each" },
                }
              }
            }
          }
        end,
      }
    })

    local default_config = {
      cmd = { "sourcekit-lsp" },
      filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp" },
      -- root_dir = util.root_pattern("buildServer.json", "Package.swift", ".git"),
      capabilities = capabilities
    }

    require'lspconfig'.sourcekit.setup{
      default_config
    }

    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },

      window = {
        documentation = cmp.config.window.bordered()
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),

      -- For luasnip users.
      sources = cmp.config.sources({
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'luasnip', option = { use_show_condition = false } },
        { name = 'path'},
      }, {

        { name = 'buffer' },
      })
    })

    vim.diagnostic.config({
      -- update_in_insert = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end
}
