return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
      -- r = {"r-languageserver"},
    }

    local api = vim.api
    local lint_augroup = api.nvim_create_augroup("lint", { clear = true })

    api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end
    })

    vim.keymap.set("n", "<leader>ml", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end
}
