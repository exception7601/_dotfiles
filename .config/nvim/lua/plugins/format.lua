return {
  "stevearc/conform.nvim",
  enabled = false,
  dependencies = { },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
      }
    })
  end
}

