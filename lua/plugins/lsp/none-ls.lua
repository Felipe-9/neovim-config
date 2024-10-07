return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "jay-babu/mason-null-ls.nvim",
    "williamboman/mason.nvim",
    -- "MunifTanjim/prettier.nvim"
  },
  config = function()
    local mason_null = require("mason-null-ls")

    mason_null.setup({
      "prettier", -- prettier formatter
      "stylua",   -- lua formatter
      "isort",    -- python formatter
      "black",    -- python formatter
      "pylint",
      "eslint_d",
      "bibtex-tidy",
      "latexindent",
      "markdown-toc",
      "markdownlint",
      "r-languageserver",
    })

    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local completion = null_ls.builtins.completion

    local keymap = vim.keymap
    local buf = vim.lsp.buf
    local api = vim.api

    null_ls.setup({
      sources = {
        -- formatting
        formatting.prettier,
        formatting.stylua, -- Lua
        formatting.black, -- Python
        formatting.isort, -- Python
        -- diagnostics
        diagnostics.pylint, -- Python
        -- diagnostics.eslint, -- javascript, typescript
        -- diagnostics.r-languageserver,
        -- completions
        completion.spell,
      },
    })

    api.nvim_create_autocmd("LspAttach", {
      group = api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "format file"
        keymap.set("n", "<leader>mF", buf.format, opts)
      end,
    })
  end,
}
