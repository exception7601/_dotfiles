return {
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({
        icons = false,
      })

      -- vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
      -- vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
      -- vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
      -- vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
      -- vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
      vim.keymap.set("n", "<leader>x", function() require("trouble").toggle("diagnostics") end)

      vim.keymap.set("n", "[d", function()
        require("trouble").next({skip_groups = true, jump = true});
      end)

      vim.keymap.set("n", "]d",     function()
        require("trouble").previous({skip_groups = true, jump = true});
      end)

      -- Show diagnostics in a floating window
      -- vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
      -- Move to the previous diagnostic
      -- vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
      -- Move to the next diagnostic
      -- vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
   end
  },
}

