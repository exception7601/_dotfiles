return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    -- "nvim-treesitter/nvim-treesitter"
    "antoinemadec/FixCursorHold.nvim",
  },
  config = function()
    require("neotest").setup({
      summary = {
        open = "botright vsplit | vertical resize 80",
      },
      adapters = {
        -- require("neotest-swift-testing")({
        --   args = { "--parallel" }
        -- }),
        -- require("neotest-jest")({
        --   jestCommand = "npm test --",
        --   cwd = function(path)
        --     return vim.fn.getcwd()
        --   end,
        -- }),
      },
      status = { virtual_text = true },
      output = { open_on_run = true },
      quickfix = {
        open = function()
          require("trouble").open({ mode = "quickfix", focus = false })
          vim.cmd("copen")
        end,
      },
    })

    vim.keymap.set("n", "<leader>tr", function()
      require("neotest").run.run()
    end)
    vim.keymap.set("n", "<leader>tf", function()
      require("neotest").run.run(vim.fn.expand("%"))
    end)
    vim.keymap.set("n", "<leader>ts", function()
      require("neotest").summary.toggle()
    end)
    vim.keymap.set("n", "<leader>to", function()
      require("neotest").output.open({ enter = true })
    end)
    vim.keymap.set("n", "<leader>tp", function()
      require("neotest").output_panel.toggle()
    end)
    vim.keymap.set("n", "<leader>t.", function()
      require("neotest").run.stop()
    end)
  end,
}
