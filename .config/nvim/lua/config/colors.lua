function theme()
  Dradule()
  vim.cmd('colorscheme dracula')
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFoat", { bg = "none" })
end

function Dradule()
  local dracula = require("dracula")
  dracula.setup({
    -- customize dracula color palette
    -- show the '~' characters after the end of buffers
    show_end_of_buffer = true, -- default false
    -- use transparent background
    transparent_bg = true, -- default false
    -- set custom lualine background color
    -- lualine_bg_color = "#44475a", -- default nil
    -- set italic comment
    italic_comment = false, -- default false
    -- overrides the default highlights with table see `:h synIDattr`
    overrides = {},
    -- You can use overrides as table like this
    -- overrides = {
    --   NonText = { fg = "white" }, -- set NonText fg to white
    --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
    --   Nothing = {} -- clear highlight of Nothing
    -- },
    -- Or you can also use it like a function to get color from theme
    -- overrides = function (colors)
    --   return {
    --     NonText = { fg = colors.white }, -- set NonText fg to white of theme
    --   }
    -- end,
  })

end

function Colors(color)
   require('rose-pine').setup({
    disable_background = true,
    styles = {
      italic = false,
    },
   })

   vim.cmd("colorscheme rose-pine")
end

function Tokyo()
  require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
     -- Style to be applied to different syntax groups
     -- Value is any valid attr-list value for `:help nvim_set_hl`
     comments = { italic = false },
     keywords = { italic = false },
     -- Background styles. Can be "dark", "transparent" or "normal"
     sidebars = "dark", -- style for sidebars, see below
     floats = "dark", -- style for floating windows
   },
  })
   vim.cmd("colorscheme tokyonight")
end

theme()

