return {
  "stevearc/conform.nvim",
  enabled = true,
  dependencies = {},
  -- event = { "BufWritePre" },
  -- cmd = { "ConformInfo" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        swift = { "swift_format" },
        html = { "prettierd", "prettier", stop_after_first = true },
        json = { "jq" },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
        -- ruby = { "standardrb" },
        -- python = { "isort", "black" },
        ruby = { "rufo" },
        toml = { "taplo" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      formatters = {
        shfmt = {
          -- "-i 2" define 2 espaços para indentação
          prepend_args = { "-i", "2" },
        },
      },
    })

    vim.keymap.set("n", "<C-I>", function()
      require("conform").format({ async = true, lsp_fallback = true })
    end, { desc = "Format buffer (async)" })

    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_format = "fallback", range = range })
    end, { range = true })
  end,
}
