return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- "williamboman/mason.nvim",
    -- "williamboman/mason-lspconfig.nvim",

    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",

    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",

    "j-hui/fidget.nvim",
  },

  config = function()

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

    local util = require 'lspconfig.util'

    require'lspconfig'.lua_ls.setup{
      cmd = { 'lua-language-server' },
      filetypes = { 'lua' },
      -- root_markers = {
        --   '.luarc.json',
        --   '.luarc.jsonc',
        --   '.luacheckrc',
        --   '.stylua.toml',
        --   'stylua.toml',
        --   'selene.toml',
        --   'selene.yml',
        --   '.git',
        -- },
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

    require'lspconfig'.sourcekit.setup{
      cmd = { "sourcekit-lsp" },
      filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp" },
      root_dir = util.root_pattern("buildServer.json", "Package.swift", ".git"),
      capabilities = capabilities
    }

    vim.opt.completeopt = {'menu', 'menuone', 'noinsert', 'noselect'}

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

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
        -- { name = 'luasnip', option = { use_show_condition = false } },
        { name = 'path'},
      }, {
        { name = 'buffer' },
      })
    })

    -- Show diagnostics in a floating window
    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    vim.diagnostic.config({
      signs = true,
      virtual_text = true,
      update_in_insert = false,
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
