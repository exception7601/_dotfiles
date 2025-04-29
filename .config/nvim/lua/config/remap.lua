vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>ex", vim.cmd.Ex)
vim.keymap.set("n", "<D-x>", vim.cmd.Ex)

--  move lines using  option+command  { }
vim.keymap.set("v", "g[", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "g]", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "g[", ":m .-2<CR>==")
vim.keymap.set("n", "g]", ":m .+1<CR>==")

-- vim.keymap.set("i", "<D-[>", "<Esc>:m -2<CR>==gi")
-- vim.keymap.set("i", "<D-]>", "<Esc>:m .+1<CR>==gi")

-- Select after indentation.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<C-s>", ":w<CR>")

-- vim.keymap.set("n","<silent><Leader>r",  ":PlugInstall<CR> | :PlugUpdate<CR>")
-- vim.keymap.set("n", "J", "mzJ`z")

-- Move remaps
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
vim.keymap.set("v", "<C-c>", "\"+y")
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- copia a linha para register do systema 
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Função para reselecionar a última seleção visual e comentar
function ReselectAndComment()
  vim.api.nvim_command('Commentary')
end

vim.keymap.set('n', 'g/', ReselectAndComment)
vim.keymap.set('i', 'g/', ReselectAndComment)
vim.keymap.set('v', 'g/', ":Commentary| normal gv_<CR>", { silent = true })

-- Disable move keys
vim.keymap.set('n', '<Left>', ':echoe "Use h"<CR>')
vim.keymap.set('n', '<Right>', ':echoe "Use l"<CR>')
vim.keymap.set('n', '<Up>', ':echoe "Use k"<CR>')
vim.keymap.set('n', '<Down>', ':echoe "Use j"<CR>')

