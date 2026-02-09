return {
  "neovim/nvim-lspconfig",
  enabled = true ,
  
  dependencies = {

    -- "williamboman/mason.nvim",
    -- "williamboman/mason-lspconfig.nvim",
    -- "mason-org/mason.nvim",

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

    vim.lsp.config('lua_ls', {
      cmd = { 'lua-language-server' },
      filetypes = { 'lua' },
      root_markers = {
        '.luarc.json',
        '.luarc.jsonc',
        '.luacheckrc',
        '.stylua.toml',
        'stylua.toml',
        'selene.toml',
        'selene.yml',
        '.git',
      },
      capabilities = capabilities,
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if
            path ~= vim.fn.stdpath('config')
            and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              version = 'LuaJIT',
              path = {
                'lua/?.lua',
                'lua/?/init.lua',
              },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
              }
            }
          })
        end,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "it", "hs", "describe", "before_each", "after_each" },
            }
          }
        }
    })

    capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

    vim.lsp.config.sourcekit = {
      cmd = { "sourcekit-lsp" },
      filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp" },
      -- root_dir = custom_root_dir,
      capabilities = capabilities,
      -- Desativa semantic tokens do sourcekit
      on_attach = function(client, bufnr)
        client.server_capabilities.semanticTokensProvider = nil
      end
    }

    vim.lsp.config('pylsp', {
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              ignore = {'W391'},
              maxLineLength = 100
            }
          }
        }
      }
    })

    vim.lsp.enable('yamlls')
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('sourcekit')
    vim.lsp.enable('jsonls')
    vim.lsp.enable('html')
    vim.lsp.enable('cssls')
    vim.lsp.enable('vtsls')
    vim.lsp.enable('bashls')
    vim.lsp.enable('docker_language_server')
    vim.lsp.enable('ruby_lsp')
    vim.lsp.enable('taplo')
    -- vim.lsp.enable('solargraph')
    -- vim.lsp.enable('pyright')
    -- vim.lsp.enable('pylsp')
    -- vim.lsp.enable('gopls')
    -- vim.lsp.enable('marksman')

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },

      performance = {
        max_view_entries = 15,
      },

      formatting = {
        format = function(_, vim_item)
          if #vim_item.abbr > 80 then
            vim_item.abbr = string.sub(vim_item.abbr, 1, 77) .. "..."
          end
          return vim_item
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

      sources = cmp.config.sources({
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'luasnip', option = { use_show_condition = false } },
        { name = 'path'},
      }, {
        { name = 'buffer' },
      })
    })

     -- Show diagnostics in a floating window
    vim.opt.completeopt = {'menu', 'menuone', 'noinsert', 'noselect'}

    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    vim.diagnostic.config({
      virtual_text = false,
      severity_sort = true,
      float = {
        border = 'rounded',
        source = 'always',
      },
    })

    -- Type virtual text
    -- vim.lsp.inlay_hint.enable()
  end
}
