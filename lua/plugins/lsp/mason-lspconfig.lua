return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local lspconfig = require("lspconfig")

    mason_lspconfig.setup({
      ensure_installed = {
        -- "tsserver",
        "ts_ls", -- typescript and Javascript
        -- "tsserver",
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
      },
    })

    local keymap = vim.keymap
    local buf = vim.lsp.buf
    -- local api = vim.api
    local diag = vim.diagnostic

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()
    local on_attach = function(client, bufnr)
      local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
      end

      buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

      local opts = {
        silent = true,
        buffer = bufnr,
        noremap = true,
      }
      -- set keybinds
      opts.desc = "fortmat buffer"
      keymap.set("n", "<leader>mf", buf.format, opts)

      opts.desc = "show Navbuddy"
      keymap.set("n", "<leader>et", ":Navbuddy<CR>", opts)

      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
      -- keymap.set('n', 'gd', buf.definition, opts)

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", diag.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", diag.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", diag.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

      -- workspace
      opts.desc = "add workspace folder"
      keymap.set("n", "<space>wa", buf.add_workspace_folder, opts)
      opts.desc = "rem workspace folder"
      keymap.set("n", "<space>wx", buf.remove_workspace_folder, opts)
      opts.desc = "list workspace folders"
      keymap.set("n", "<space>wl", function()
        print(vim.inspect(buf.list_workspace_folders()))
      end, opts)

      -- Format on save
      -- if client.supports_method("textDocument/formatting") then
      --   vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      --   vim.api.nvim_create_autocmd("BufWritePre", {
      --     group = augroup,
      --     buffer = bufnr,
      --     callback = function()
      --       -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
      --       -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
      --       buf.format()
      --     end,
      --   })
      -- end
    end

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end,
      -- ["tsserver"] = function ()
      --   lspconfig("tsserver").setup({
      --     capabilities = capabilities,
      --     on_attach = function (client)
      --       client.server_capabilities.documentFormattingProvider= false
      --     end
      --   })
      -- end,
      ["svelte"] = function()
        -- configure svelte server
        lspconfig["svelte"].setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                -- Here use ctx.match instead of ctx.file
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end,
        })
      end,
      ["graphql"] = function()
        -- configure graphql language server
        lspconfig["graphql"].setup({
          capabilities = capabilities,
          filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        })
      end,
      ["emmet_ls"] = function()
        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })
      end,
      -- ["lua_ls"] = function()
      --   -- configure lua server (with special settings)
      --   lspconfig["lua_ls"].setup({
      --     capabilities = capabilities,
      --     -- filetypes = { "lua", "tex" },
      --     filetypes = { "lua" },
      --     settings = {
      --       Lua = {
      --         -- make the language server recognize "vim" global
      --         diagnostics = {
      --           -- globals = { "vim", "tex" },
      --           globals = { "vim" },
      --         },
      --         completion = {
      --           callSnippet = "Replace",
      --         },
      --       },
      --     },
      --   })
      -- end,
    })
  end,
}
