vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>x", vim.cmd.Ex)

--  move lines using  option+command  { }
-- vim.keymap.set("v", "g[", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("v", "g]", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("n", "g[", ":m .-2<CR>==")
-- vim.keymap.set("n", "g]", ":m .+1<CR>==")

vim.keymap.set("v", "<D-“>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<D-‘>", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<D-“>", ":m .-2<CR>==")
vim.keymap.set("n", "<D-‘>", ":m .+1<CR>==")
vim.keymap.set("i", "<D-‘>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<D-“>", "<Esc>:m -2<CR>==gi")

-- Select after indentation.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Save File
vim.keymap.set("n", "<D-s>", ":w<CR>")
vim.keymap.set("i", "<D-s>", "<Esc>:w<CR>")
vim.keymap.set("v", "<D-s>", "<Esc>:w<CR>gv")

-- vim.keymap.set("n","<silent><Leader>r",  ":PlugInstall<CR> | :PlugUpdate<CR>")
-- vim.keymap.set("n", "J", "mzJ`z")

-- Move remaps Center 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", "<C-c>", "<Esc>")

-- Replace text
vim.keymap.set("n", "<Leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- vim.keymap.set("n", "<Leader><Leader>", function()
--     vim.cmd("so")
-- end)

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- "black hole"
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- greatest remap ever visual replace 
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy visual mode using Ctr+C
-- vim.keymap.set("v", "<C-c>", "\"+y")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- copia a linha para register do systema 
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Função para reselecionar a última seleção visual e comentar
function ReselectAndComment()
  vim.api.nvim_command('Commentary')
end

vim.keymap.set('n', '<D-/>', ReselectAndComment)
vim.keymap.set('i', '<D-/>', ReselectAndComment)
vim.keymap.set('v', '<D-/>', ":Commentary | normal! gv_<CR>", { silent = true })

-- Disable move keys
vim.keymap.set('n', '<Left>', ':echoe "Use h"<CR>')
vim.keymap.set('n', '<Right>', ':echoe "Use l"<CR>')
vim.keymap.set('n', '<Up>', ':echoe "Use k"<CR>')
vim.keymap.set('n', '<Down>', ':echoe "Use j"<CR>')

vim.keymap.set("n", "<C-s>", function()
  vim.cmd("w")
end, { noremap = true, silent = true })

-- vim.keymap.set("n", "<leader><leader>", function()
--   vim.cmd("so")
-- end)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

    -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  end
})
