return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    todo_comments.setup({
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#d20f39" },
        warning = { "DiagnosticWarn", "WarningMsg", "#df8e1d" },
        info = { "DiagnosticInfo", "#179299" },
        hint = { "DiagnosticHint", "#1e66f5" },
        default = { "Identifier", "#8839ef" },
        test = { "Identifier", "#ea76cb" },
      },
    })
  end,
}
