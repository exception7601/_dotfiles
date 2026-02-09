return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",

  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    -- Fist queue
    vim.keymap.set("n", "<leader>A", function() harpoon:list():prepend() end)
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>j", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

    vim.keymap.set("n", "<leader>!", function() harpoon:list():replace_at(1) end)
    vim.keymap.set("n", "<leader>@", function() harpoon:list():replace_at(2) end)
    vim.keymap.set("n", "<leader>#", function() harpoon:list():replace_at(3) end)
    vim.keymap.set("n", "<leader>$", function() harpoon:list():replace_at(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    -- vim.keymap.set("n", "<leader>-P", function() harpoon:list():prev() end)
    -- vim.keymap.set("n", "<leader>-N", function() harpoon:list():next() end)

  end
}
