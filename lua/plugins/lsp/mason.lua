return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        -- "tsserver",
        "ts_ls", -- typescript and Javascript
        "biome", -- JSON
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls", -- Lua
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "texlab",   -- LaTeX
        "marksman", -- Markdown
        "nil_ls",   -- Nix
        -- "r-languageserver",
      },
    })

    mason_tool_installer.setup({
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
  end,
}
