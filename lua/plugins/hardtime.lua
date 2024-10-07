return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  opts = {
    disable_mouse = false,
    restriction_mode = "hint",
    notification = true,
    max_count = 10,
    disabled_keys = {
      ["<Up>"] = {},
      ["<Down>"] = {},
      ["<Left>"] = {},
      ["<Right>"] = {},
    },
  },
  -- config = function()
  --   require("hardtime").setup({
  --     disable_mouse = false,
  --     restriction_mode = "hint",
  --     notification = false,
  --   })
  -- end
}
