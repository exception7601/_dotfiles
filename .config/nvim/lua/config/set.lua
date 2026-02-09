
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

-- Ident 
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

local space = "·"
vim.opt.listchars:append {
  tab = "» ",
  lead = space,
  leadmultispace = space,
  trail = space,
  space = space,
  multispace = space,
  eol = "¬",
  -- extends = ">",
  -- precedes = "<",
  nbsp = "_"
}


vim.opt.list = true

-- Sempre usar o registrador "+ or "*
-- vim.opt.clipboard = "unnamedplus"

-- Use tab in make files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.bo.expandtab = false
  end,
})

--
-- Spell checking settings
--
-- Custom words list. Quite useful when working in tech because Vim doesn't
-- know a lot of the names we use.
local home = os.getenv("HOME")
vim.opt.spellfile = home .. "/.vim/spell/custom-spell.utf-8.add"

local function set_spell_for_window()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
end

-- I haven't figured out a way to have good spell checking for code, so for now
-- only check spelling on 'text' files
--
-- TODO: extract lang value in a constant
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.md",
  callback = set_spell_for_window
})

-- Check spelling on commit messages too
vim.api.nvim_create_autocmd("BufRead", {
  pattern = "COMMIT_EDITMSG",
  callback = set_spell_for_window
})

-- Complete for insertion mode CTRL-Nou CTRL-P
vim.opt.complete = "kspell"

-- Files Type
-- Highlight Podfile, Fastfile, etc. as a Ruby file

local filetypes = {
  "Podfile",
  "Fastfile",
  "AppFile",
  "Deliverfile",
  "Matchfile",
  "Snapfile",
  "Pluginfile",
  "Dangerfile"
}

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = filetypes,
  callback = function()
    vim.bo.filetype = "ruby"
  end,
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = ".swift-format",
  callback = function ()
    vim.bo.filetype = "json"
  end
})

-- Highlight Pods.WORKSPACE as a Starlark file

vim.api.nvim_create_autocmd("BufRead", {
  pattern = { "Pods.WORKSPACE" },
  callback = function()
    vim.bo.filetype = "starlark"
  end,
})

-- vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
--   pattern = "*.swift",
--   callback = function ()
--   end
-- })

-- Ativar divisões verticais por padrão
-- vim.opt.splitright = true

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.api.nvim_create_autocmd("FileType", {
  pattern = "swift",
  callback = function()
    vim.opt_local.commentstring = '// %s'
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end
})
