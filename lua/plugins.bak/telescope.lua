return {
  'nvim-telescope/telescope.nvim',
  -- tag = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    'nvim-tree/nvim-web-devicons',
    'folke/todo-comments.nvim',
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_md = require("telescope.actions.mt").transform_mod
    local builtin = require("telescope.builtin")

    local trouble = require("trouble")
    local trouble_t = require("trouble.sources.telescope")

    local custom_actions = transform_md({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end
    })

    telescope.load_extension('fzf')
    telescope.load_extension('ui-select')
    telescope.load_extension('noice')

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        -- layout_strategy = "flex",
        layout_strategy = "vertical",
        -- vimgrep_arguments = {
        --   "rg",
        --   "--color=always",
        --   "--stats",
        --   "-C 0",
        --   "--trim",
        --   "--smart-case"
        -- }
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,                                      -- Move to prev result
            ["<C-j>"] = actions.move_selection_next,                                          -- Move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist, -- Move to next result
            ["<C-t>"] = trouble_t.open,
          }
        }
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        },
        ["ui-select"] = { require("telescope.themes").get_dropdown {} }
      }
    })

    local keymap = vim.keymap
    -- keymap.set('n', '<leader>p', builtin.find_files, { desc = "Fuzzy find files in cwd" })
    -- keymap.set('n', '<leader>F', builtin.live_grep, { desc = "Find string in cwd" })
    keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Fuzzy find files in cwd" })
    keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Fuzzy find recent files" })
    keymap.set('n', '<leader>fs', builtin.live_grep, { desc = "Find string in cwd" })
    keymap.set('n', '<leader>fc', builtin.grep_string, { desc = "Find string under cursor in cwd" })
    keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })
    keymap.set('n', '<leader>ft', "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    keymap.set('n', '<leader>fn', "<cmd>Telescope noice<cr>", { desc = "Find Noice messages" })
  end
}
