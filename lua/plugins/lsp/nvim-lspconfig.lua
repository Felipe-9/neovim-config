return {
  { "SmiteshP/nvim-navbuddy",
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim"
    },
    opts = { lsp = { auto_attach = true } }
  },
  { "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "SmiteshP/nvim-navbuddy",
      'nvim-telescope/telescope.nvim',
      -- "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "folke/neodev.nvim", opts = {} },
      "williamboman/mason.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local navbuddy = require("nvim-navbuddy")

      -- lspconfig.setup()

      -- local keymap = vim.keymap
      -- local buf = vim.lsp.buf
      -- local api = vim.api
      -- local diag = vim.diagnostic

      -- api.nvim_create_autocmd("LspAttach", {
      --   group = api.nvim_create_augroup("UserLspConfig", {}),
      --   callback = function(ev)
      --     -- Buffer local mappings.
      --     -- See `:help vim.lsp.*` for documentation on any of the below functions
      --     local opts = { buffer = ev.buf, silent = true }
      --
      --     -- set keybinds
      --     opts.desc = "show Navbuddy"
      --     keymap.set('n', "<leader>et", ":Navbuddy<CR>", opts)
      --
      --     opts.desc = "Show LSP references"
      --     keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
      --
      --     opts.desc = "Go to declaration"
      --     keymap.set("n", "gD", buf.declaration, opts) -- go to declaration
      --
      --     opts.desc = "Show LSP definitions"
      --     keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
      --     -- keymap.set('n', 'gd', buf.definition, opts)
      --
      --     opts.desc = "Show LSP implementations"
      --     keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
      --
      --     opts.desc = "Show LSP type definitions"
      --     keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
      --
      --     opts.desc = "See available code actions"
      --     keymap.set({ "n", "v" }, "<leader>ca", buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
      --
      --     opts.desc = "Smart rename"
      --     keymap.set("n", "<leader>rn", buf.rename, opts) -- smart rename
      --
      --     opts.desc = "Show buffer diagnostics"
      --     keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
      --
      --     opts.desc = "Show line diagnostics"
      --     keymap.set("n", "<leader>d", diag.open_float, opts) -- show diagnostics for line
      --
      --     opts.desc = "Go to previous diagnostic"
      --     keymap.set("n", "[d", diag.goto_prev, opts) -- jump to previous diagnostic in buffer
      --
      --     opts.desc = "Go to next diagnostic"
      --     keymap.set("n", "]d", diag.goto_next, opts) -- jump to next diagnostic in buffer
      --
      --     opts.desc = "Show documentation for what is under cursor"
      --     keymap.set("n", "K", buf.hover, opts) -- show documentation for what is under cursor
      --
      --     opts.desc = "Restart LSP"
      --     keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      --
      --     -- workspace
      --     opts.desc = "add workspace folder"
      --     keymap.set('n', '<space>wa', buf.add_workspace_folder, opts)
      --     opts.desc = "rem workspace folder"
      --     keymap.set('n', '<space>wx', buf.remove_workspace_folder, opts)
      --     opts.desc = "list workspace folders"
      --     keymap.set('n', '<space>wl', function()
      --       print(vim.inspect(buf.list_workspace_folders()))
      --     end, opts)
      --   end,
      -- })

      -- Change the Diagnostic symbols in the sign column (gutter)
      -- (not in youtube nvim video)
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      lspconfig.clangd.setup {
        on_attach = function(client, bufnr)
          navbuddy.attach(client, bufnr)
        end,
      }
    end,
  }
}

