return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    window = { border = "single" },
    plugins = {
      marks = true,
      registers = true,
    },
    preset = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = true })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>f", group = "Find" },
      { "<leader>e", group = "Navigation" },
      { "<leader>w", group = "Workspace" },
      { "<leader>z", group = "Folds" },
      { "<leader>x", group = "Trouble" },
      { "<leader>t", group = "Tabs" },
      { "<leader>m", group = "Format" },
      { "<leader>s", group = "Splits" },
    })
  end,
}
