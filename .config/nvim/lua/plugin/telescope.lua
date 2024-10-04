require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "Applications",
      "Games",
      "Library",
      "Music",
      "Pictures"
    }
  }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<D-S-F>', function()
  builtin.find_files({ hidden = false, no_ignore = false })
end, { noremap = true, silent = true })

vim.keymap.set('n', '<D-S-P>', builtin.git_files, {})
vim.keymap.set('n', '<D-S-B>', builtin.buffers, { desc = 'Telescope buffers' })

vim.keymap.set('n', '<D-p>', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- vim.keymap.set('n', '<leader>pws', function()
--   local word = vim.fn.expand("<cword>")
--   builtin.grep_string({ search = word })
-- end)

-- vim.keymap.set('n', '<leader>pWs', function()
--   local word = vim.fn.expand("<cWORD>")
--   builtin.grep_string({ search = word })
-- end)

-- Toggle previous & next buffers stored within Harpoon list
-- im.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)

