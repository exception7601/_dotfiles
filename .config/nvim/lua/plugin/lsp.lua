local cmp = require('cmp')
local cmp_lsp = require("cmp_nvim_lsp")

-- Merge Table overide values
local capabilities = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  cmp_lsp.default_capabilities()
)

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

-- require("fidget").setup({})
require("mason").setup()

require("mason-lspconfig").setup({

  -- A list of servers to automatically install if they're not already installed.
  -- Example: { "rust_analyzer@nightly", "lua_ls" }
  -- This setting has no relation with the `automatic_installation` setting.
  ensure_installed = {
    -- "tsserver",
    -- "html",
    -- "cssls",
    "lua_ls",
    "hydra_lsp", 
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
            runtime = { version = "Lua 5.1" },
            diagnostics = {
              globals = { "vim", "it", "describe", "before_each", "after_each" },
            }
          }
        }
      }
    end,
  }
})

local util = require("lspconfig.util")
local default_config = {
  cmd = { "sourcekit-lsp" },
  filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp" },
  -- root_dir = util.root_pattern("buildServer.json", "Package.swift", ".git"),
  capabilities = capabilities
}

require'lspconfig'.sourcekit.setup{
  default_config
}

require'lspconfig'.cssls.setup({
  capabilities = capabilities,
})

require'lspconfig'.html.setup({
  capabilities = capabilities,
  settings = {
    css = {
      lint = {
        validProperties = {},
      },
    },
  },

})

-- Config cmp for autocomplet
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
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
    { name = 'luasnip' },

  }, {

    { name = 'buffer' },

  })

})

vim.diagnostic.config({

  virtual_text = false,
  -- update_in_insert = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always", 
    header = "",
    prefix = ""
  },
})

