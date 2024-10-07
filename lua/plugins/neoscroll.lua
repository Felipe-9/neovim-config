return {
  "karb94/neoscroll.nvim",
  config = function()
    require("neoscroll").setup({
      mappings = { "<C-u>", "<C-d>" },
      easing = "sine",
      performance_mode = false,
    })
  end,
}
