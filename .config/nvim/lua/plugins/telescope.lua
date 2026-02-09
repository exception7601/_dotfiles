return {
  "nvim-telescope/telescope.nvim",
  enabled = false,
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    require('telescope').setup{
      defaults = {
        file_ignore_patterns = {
          "Applications/",
          "games/",
          "Library/",
          "Movies/",
          "Music/",
          "Pictures/",
          "Downloads/",
          ".Trash/",
          ".cache/",
          ".git/"
        }
      }
    }

    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>o', function()
      builtin.find_files({ hidden = true, no_ignore = false })
    end, { noremap = true, silent = true })

    vim.keymap.set('n', '<leader>O', builtin.git_files, {})
    vim.keymap.set('n', '<leader>B', builtin.buffers, { desc = 'Telescope buffers' })
    -- vim.keymap.set('n', '<leader>f', builtin.live_grep, {})

    vim.keymap.set('n', '<leader>F', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)

     -- vim.keymap.set('n', '<leader>Fw', function()

     --  local word = vim.fn.expand("<cword>")
     --  builtin.grep_string({ search = word })
    -- end)

    -- vim.keymap.set('n', '<leader>fw', function()
     --  local word = vim.fn.expand("<cWORD>")
     --  builtin.grep_string({ search = word })
    -- end)

    -- Toggle previous & next buffers stored within Harpoon list
    -- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
  end
}
