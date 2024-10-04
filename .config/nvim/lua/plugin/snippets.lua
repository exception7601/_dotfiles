require("luasnip.loaders.from_vscode").lazy_load()
local ls = require("luasnip")
-- ls.filetype_extend("javascript", { "jsdoc" })

-- --- TODO: What is expand?
-- vim.keymap.set({"i"}, "<C-s>e", function() ls.expand() end, {silent = true})

-- vim.keymap.set({"i", "s"}, "<C-s>;", function() ls.jump(1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-s>,", function() ls.jump(-1) end, {silent = true})

-- vim.keymap.set({"i", "s"}, "<C-E>", function()
--   if ls.choice_active() then
--     ls.change_choice(1)
--   end
-- end, {silent = true})
--
-- press <Tab> to expand or jump in a snippet. These can also be mapped separately
-- via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next. 

vim.keymap.set({"i"}, "<C-Tab>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-Tab>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})

--- modo multiplas escolhas >--->
vim.keymap.set({"i", "s"}, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, {silent = true})

