return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
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

    vim.keymap.set('n', '<leader>f', function()
      builtin.find_files({ hidden = false, no_ignore = false })
    end, { noremap = true, silent = true })

    vim.keymap.set('n', '<leader>P', builtin.git_files, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })

     vim.keymap.set('n', '<leader>p', function()
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
    -- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
  end
}
