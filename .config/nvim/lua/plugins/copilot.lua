return {
  "github/copilot.vim",
  enabled = false,
  dependencies = {
  },
  config = function()
    vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false
    })
    vim.g.copilot_no_tab_map = true
    vim.keymap.set('i', '<C-]>', '<Plug>(copilot-dismiss)')
    vim.keymap.set('i', '<M-]>', '<Plug>(copilot-next)')
    vim.keymap.set('i', '<M-[>', '<Plug>(copilot-previous)')
    vim.keymap.set('i', '<M-\\>', '<Plug>(copilot-suggest)')
    vim.keymap.set('i', '<M-Right>', '<Plug>(copilot-accept-word)')
    vim.keymap.set('i', '<M-C-Right>', '<Plug>(copilot-accept-line)')

  end
}
