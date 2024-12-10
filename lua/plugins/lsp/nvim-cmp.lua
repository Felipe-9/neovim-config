return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter","CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path",   -- source for file system paths
    "hrsh7th/cmp-cmdline",
    -- "petertriho/cmp-git",
    -- "f3fora/cmp-spell",
    "micangl/cmp-vimtex",
    "L3MON4D3/LuaSnip",
    -- {
    --   "L3MON4D3/LuaSnip",
    --   version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    --   build = "make install_jsregexp"
    -- },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    -- "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")
    local config = cmp.config
    local mapping = cmp.mapping
    local luasnip = require("luasnip")
    -- local lspkind = require("lspkind")

    -- local keymap = vim.keymap
    local kind_icons = {
      article = "󰧮",
      book = "",
      incollection = "󱓷",
      Function = "󰊕",
      Constructor = "",
      Text = "󰦨",
      Method = "",
      Field = "󰅪",
      Variable = "󱃮",
      Class = "",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "󰚯",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "󰌁",
      -- Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      -- spell = "",
      -- EnumMember = "",
      Constant = "󰀫",
      Struct = "",
      -- Struct = "",
      Event = "",
      Operator = "󰘧",
      TypeParameter = "",
    }

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = mapping.preset.insert({
        ["<C-k>"] = mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = mapping.scroll_docs(-4),
        ["<C-f>"] = mapping.scroll_docs(4),
        ["<C-Space>"] = mapping.complete(), -- show completion suggestions
        ["<C-e>"] = mapping.abort(),        -- close completion window
        ["<CR>"] = mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function (fallback)
          if luasnip.expandable() then luasnip.expand()
          elseif luasnip.locally_jumpable(1) then luasnip.jump()
          elseif cmp.visible() then cmp.select_next_item()
          else fallback()
          end
        end, {"i","s"}),
        ["<S-Tab>"] = cmp.mapping(function ()
          if cmp.visible() then cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then luasnip.jump(-1)
          end
        end, {"i","s"}),
      }),
      -- formatting = {
      --   format = lspkind.cmp_format({
      --     maxwidth = 50,
      --     ellipsis_char = "...",
      --   }),
      -- },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        expandable_indicator = true,
        format = function(entry, vim_item)
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- Kind icons
          vim_item.menu = ({
            -- vimtex = (vim_item.menu ~= nil and vim_item.menu or "[VimTex]"),
            -- vimtex = test_fn(vim_item.menu, entry.source.name),
            vimtex = vim_item.menu,
            luasnip = "[Snippet]",
            nvim_lsp = "[LSP]",
            buffer = "[Buffer]",
            spell = "[Spell]",
            -- orgmode = "[Org]",
            -- latex_symbols = "[Symbols]",
            cmdline = "[CMD]",
            path = "[Path]",
          })[entry.source.name]

          function trim(text)
            local max = 40
            if text and text:len() > max then
              text = text:sub(1,max) .. "..."
            end
            return text
          end

          vim_item.abbr = trim(vim_item.abbr:match("[^(]+"))
          return vim_item
        end,
      },
      -- sources for autocompletion
      sources = config.sources({
        { name = "luasnip" }, -- snippets
        { name = "vimtex" }, -- Latex
        { name = "nvim_lsp" },
        { name = "cmp_r" }, -- For r
        { name = "buffer", keyword_length = 3 },  -- text within current buffer
        {
          name = "spell",
          keyword_length = 4,
          option = {
            keep_all_entries = false,
            enable_in_context = function ()
              return true
            end
          },
        },
        { name = "path" },    -- file system paths
      }),
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      view = { entries = "custom"},
      window = {
        completion = config.window.bordered(),
        documentation = config.window.bordered(),
      },
      performance = {
        trigger_debounce_time = 500,
        throttle = 550,
        fetching_timeout = 80,
      }
    })

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { {name = "buffer"}}
    })
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        {name = "path"},
        {name = "cmdline"},
      }
    })

  end,
}
