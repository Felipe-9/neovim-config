return {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    -- { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Trouble list" },
    { "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble diagnostics workspace" },
    { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Trouble diagnostics document" },
    { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Trouble location List" },
    { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Trouble quickfix List" },
    { "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", desc = "Trouble quickfix List" },
    { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Trouble todo List" },
    { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Trouble Symbols" },
    { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)", },
  },
}
