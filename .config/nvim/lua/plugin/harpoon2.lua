local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<D-a>", function() harpoon:list():add() end)
vim.keymap.set("n", "<D-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- configura o option como o carater 
vim.keymap.set("n", "<D-S-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<D-S-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<D-S-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<D-S-4>", function() harpoon:list():select(4) end)


-- Toggle previous & next buffers stored within Harpoon list
    -- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
