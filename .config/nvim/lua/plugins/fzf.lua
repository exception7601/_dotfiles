return {
  "ibhagwan/fzf-lua",
  enabled = true,
  dependencies = {},
  config = function()
    -- local trouble = require("trouble.sources.fzf")
    local fzf = require("fzf-lua")
    -- local actions = require("fzf-lua.actions")
    local config = fzf.config

    config.defaults.keymap.fzf["ctrl-q"] = "select-all+accept"
    config.defaults.keymap.fzf["ctrl-u"] = "half-page-up"
    config.defaults.keymap.fzf["ctrl-d"] = "half-page-down"
    config.defaults.keymap.fzf["ctrl-x"] = "jump"
    config.defaults.keymap.fzf["ctrl-f"] = "preview-page-down"
    config.defaults.keymap.fzf["ctrl-b"] = "preview-page-up"
    config.defaults.keymap.builtin["<c-f>"] = "preview-page-down"
    config.defaults.keymap.builtin["<c-b>"] = "preview-page-up"

    fzf.setup({
      -- winopts = {
      --   height = 0.8, width = 0.8,
      --   row = 0.5, col = 0.5,
      --   preview = { scrollchars = { "┃", "" } },
      -- },
      grep = { hidden = true },
      fzf_opts = { ["--no-scrollbar"] = "" },
      fzf_tmux_opts = { ["-p"] = "80%,80%", ["--margin"] = "0,0" },
      -- defaults = { formatter = "path.dirname_first" },
    })

    --  vim.keymap.set("n", "<leader>G", function()
    --    fzf.global()
    --  end, { desc = "Global" })

    -- vim.keymap.set("n", "<leader>O", fzf.git_files, { desc = "Git Files" })
    vim.keymap.set("n", "<D-O>", function()
      fzf.combine({ pickers = "oldfiles;git_files" })
    end, { desc = "Files (History + Git)" })

    vim.keymap.set("n", "<D-F>", function()
      fzf.live_grep()
    end, { desc = "Live Grep" })

    vim.keymap.set("n", "<leader>o", function()
      fzf.files({ hidden = true, no_ignore = false })
    end, { desc = "Find Files (hidden, respect .gitignore)" })

    vim.keymap.set("n", "<leader>fw", function()
      fzf.grep_cword({ prompt = "Grep > " })
    end, { desc = "Live Grep" })

    vim.keymap.set("v", "<leader>fv", function()
      fzf.grep_visual()
    end, { desc = "Fzf Search Selection" })

    vim.keymap.set("n", "<leader>B", fzf.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>R", fzf.registers, { desc = "Registers" })

    -- vim.keymap.set("n", "<leader>d", fzf.diagnostics_document, { desc = "" })
    vim.keymap.set("n", "<leader>ls", fzf.lsp_document_symbols, { desc = "Document Symbols" })
    -- vim.keymap.set("n", "<leader>lS", fzf.lsp_workspace_symbols, { desc = "Workspace Symbols" })
    -- vim.keymap.set("n", "<leader>gc", fzf.git_commits, { desc = "Git Commits" })
    -- vim.keymap.set("n", "<leader>gs", fzf.git_status, { desc = "Git Status" })

    vim.keymap.set("n", "<leader>lr", function()
      fzf.lsp_references({ jump1 = true, ignore_current_line = true })
    end, { desc = "LSP References" })
  end,
}
