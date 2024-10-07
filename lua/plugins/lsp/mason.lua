return {
  { "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  { "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = "williamboman/mason.nvim",
    config = function ()
      require("mason-tool-installer").setup({
        ensure_installed = {
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
          -- "pyright",
        },
        auto_update = true,
      })
    end
  },
}
