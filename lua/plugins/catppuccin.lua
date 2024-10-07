return { 
  "catppuccin/nvim", 
  version = "*",
  lazy = false,
  name = "catppuccin", 
  priority = 1000,
  config = function()

    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      term_colors = true,
      integrations = {
        alpha = true,
        treesitter = true,
        neotree = true,
        telescope = { enabled = true },
        which_key = true
      },
      custom_highlights = function(color)
        return {
          -- NormalFloat = { fg = color.text, bg = color.none }, -- REMOVE THIS LINE
        }
      end,
    })
    vim.cmd.colorscheme "catppuccin"
    -- vim.cmd.colorscheme "catppuccin-mocha"
    -- Fix transparent background
  end,
}
