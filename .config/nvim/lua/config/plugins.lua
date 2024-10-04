local vim = vim

local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug ('nvim-lua/plenary.nvim')
Plug ('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.6' })

--  NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug ('preservim/nerdtree', { ['on'] = 'NERDTreeToggle' })

Plug ('godlygeek/tabular')

Plug ('rose-pine/neovim')
Plug ('mbbill/undotree')

Plug ('tpope/vim-commentary')

Plug ('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})

Plug ('folke/tokyonight.nvim')
Plug ('Mofiqul/dracula.nvim')

Plug ('kepano/flexoki-neovim', { ['as'] = 'flexoki' })

-- GitHub extensions for fugitive
Plug ('tpope/vim-eunuch')
Plug ('tpope/vim-fugitive')
Plug ('tpope/vim-rhubarb')
-- tpope/vim-surround

-- LSP Support
Plug ("neovim/nvim-lspconfig")
Plug ("williamboman/mason.nvim")
Plug ("williamboman/mason-lspconfig.nvim")

-- Autocompletion
Plug ("hrsh7th/cmp-nvim-lsp")
Plug ("hrsh7th/cmp-buffer")
Plug ("hrsh7th/cmp-path")
Plug ("hrsh7th/cmp-cmdline")
Plug ("hrsh7th/nvim-cmp")
Plug ("saadparwaiz1/cmp_luasnip")
Plug ("hrsh7th/cmp-nvim-lua")

-- Snippets
Plug ("L3MON4D3/LuaSnip")
Plug ("j-hui/fidget.nvim")
Plug ("rafamadriz/friendly-snippets")

Plug ("ThePrimeagen/harpoon", { ["branch"] = 'harpoon2'})
Plug ("ThePrimeagen/vim-be-good")

Plug ("mfussenegger/nvim-lint")
Plug ("folke/trouble.nvim")

Plug ('cfdrake/vim-pbxproj')
-- Notification LSP
-- Plug ("j-hui/fidget.nvim")
-- mfussenegger/nvim-lint

vim.call('plug#end')

