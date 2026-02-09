
return {
  "tpope/vim-fugitive",
  config = function()
    -- vim.keymap.set("n", "<leader>g", ":vertical Git<CR>", { silent = true })
    vim.keymap.set("n", "<leader>g", vim.cmd.Git)

    local Ex_Fugitive = vim.api.nvim_create_augroup("Ex_Fugitive", {})

    local autocmd = vim.api.nvim_create_autocmd

    -- Criar um atuto comando para adicionar maps no fugitive
    autocmd("BufWinEnter", {
      group = Ex_Fugitive,
      pattern = "*",

      callback = function()
        if vim.bo.ft ~= "fugitive" then
          return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}

        vim.keymap.set("n", "<leader>p", function()
          vim.cmd.Git('push')
        end, opts)

        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
          vim.cmd.Git({'pull',  '--rebase'})
        end, opts)

        -- NOTA: Ele me permite definir facilmente o branch que estou
        -- enviando e qualquer rastreamento
        -- necessário se eu não configurei o branch corretamente
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
      end,
    })

    -- Atalhos para merge de branch files
    -- Versão local (você ou sua cópia de trabalho).
    -- Versão base (//2), que é a versão antes das mudanças.
    -- Versão remota (//3), que contém as mudanças feitas na outra versão
    -- Using diffput for all conflit:s
    vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
    vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
  end
}
