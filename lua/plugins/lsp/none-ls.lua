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
      "stylua", -- lua formatter
      "isort", -- python formatter
      "black", -- python formatter
      "pylint",
      "eslint_d",
      "bibtex-tidy",
      "latexindent",
      "markdown-toc",
      "markdownlint",
      "r-languageserver",
      "biome",
    })

    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local completion = null_ls.builtins.completion

    null_ls.setup({
      sources = {
        -- formatting
        formatting.stylua, -- Lua
        formatting.black, -- Python
        formatting.isort, -- Python
        formatting.biome, -- JSON
        formatting.prettier,
        -- diagnostics
        diagnostics.pylint, -- Python
        -- diagnostics.eslint, -- javascript, typescript
        -- diagnostics.r-languageserver,
        -- completions
        completion.spell,
      },
    })
  end,
}
