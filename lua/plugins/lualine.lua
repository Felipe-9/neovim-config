return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'folke/noice.nvim',
  },
  config = function()
    local lazy_status = require('lazy.status')

    local colors = {
      blue = "#89dceb",
      teal = "#94e2d5",
      green = "#a6e3a1",
      muave = "#cba6f7",
      lavender = "#b4befe",
      yellow = "#f9e2af",
      peach = "#fab387",
      red = "#f38ba9",
      fg = "#cdd6f4",
      bg = "#1e1e2e",
      inactive_bg = "#181825",
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.lavender, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.teal, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },
    }

    local lazypackages_status = {
      lazy_status.updates,
      cond = lazy_status.has_updates,
      color = { fg = colors.peach },
    }

    -- local noice_status = {}
    -- -- if "noice is loaded" then
    --   local noiceasmode = require("noice").api.statusline.mode
    --   noice_status = {
    --     noiceasmode.get,
    --     cond = noiceasmode.has,
    --     color = { fg = colors.peach }
    --   }
    -- -- end

    
    require 'lualine'.setup({
      options = {
        icons_enabled = true,
        theme = my_lualine_theme,
        -- theme = 'pywl16-nvim',
        -- theme = 'dracula',
        -- theme = 'nightfly',
        -- theme = 'palenight',
        -- theme = 'pywall',
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        -- disabled_filetypes = {
        --   statusline = {},
        --   winbar = {},
        -- },
        -- ignore_focus = {},
        -- always_divide_middle = true,
        globalstatus = true,
        -- refresh = {
        --   statusline = 1000,
        --   tabline = 1000,
        --   winbar = 1000,
        -- }
      },
      sections = {
        --   lualine_a = {'mode'},
        -- lualine_b = {'branch', 'diff', 'diagnostics'},
        --   lualine_c = {'filename'},
        lualine_x = {
          lazypackages_status,
          -- noice_status,
          { 'encoding' }, { 'fileformat' }, { 'filetype' }
        },
        --   lualine_y = {'progress'},
        --   lualine_z = {'location'}
      },
      -- inactive_sections = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {'filename'},
      --   lualine_x = {'location'},
      --   lualine_y = {},
      --   lualine_z = {}
      -- },
      -- tabline = {},
      -- winbar = {},
      -- inactive_winbar = {},
      -- extensions = {}
    })
  end
}
