return {
  "mfussenegger/nvim-lint",
  enabled = false,
  config = function()
    -- Existe um linter genérico chado compilerque usa o 
    -- makeprge errorformatopções do buffer atual. 

    -- local lint = require("lint")

    --  lint.linters_by_ft = {
    --    lua = { 'luacheck' },
    --    swift = { 'swiftlint' },
    --  }
    --  local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    --  -- Auto lint
    --  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    --    group = lint_augroup,
    --    callback = function()
    --      lint.try_lint()
    --    end,
    --  })

    --  -- Criando o comando 'LintTryLint' no Neovim
    --  vim.api.nvim_create_user_command(
    --  'LintTryLint',
    --  function ()
    --    lint.try_lint()
    --  end, { desc = "Trigger linting for current file" }
    --  )
  end
}
