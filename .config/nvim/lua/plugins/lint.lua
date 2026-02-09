return {
  "mfussenegger/nvim-lint",
  enabled = true,
  config = function()
    -- Existe um linter genérico chado compilerque usa o
    -- makeprge errorformatopções do buffer atual.

    local lint = require("lint")

    lint.linters_by_ft = {

      -- lua = { "selene" },
      swift = { "swiftlint" },
      sh = { "shellcheck" },
      bash = { "shellcheck" },
      zsh = { "shellcheck" },
      -- python = { "ruff" },
      ruby = { "standardrb" },
      javascript = { "eslint" },
      typescript = { "eslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
      vue = { "eslint" },
    }
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

--     -- Auto lint
--     vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
--       group = lint_augroup,
--       callback = function()
--         lint.try_lint()
--       end,
--     })

    -- Criando o comando 'LintTryLint' no Neovim
    vim.api.nvim_create_user_command("LintTryLint", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
