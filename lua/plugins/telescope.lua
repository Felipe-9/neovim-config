return {
  "nvim-telescope/telescope.nvim",
  -- tag = '0.1.x',
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "folke/trouble.nvim",
    "MunifTanjim/nui.nvim",
    "AckslD/nvim-neoclip.lua",
    "debugloop/telescope-undo.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_md = require("telescope.actions.mt").transform_mod
    local builtin = require("telescope.builtin")
    -- local TSLayout = require("telescope.pickers.layout")
    local telescope_config = require("telescope.config")

    local trouble = require("trouble")
    local trouble_t = require("trouble.sources.telescope")

    -- local vimgrep_arguments = {
    --   "rg",
    --   "--color=always",
    --   "--stats",
    --   "-C 0",
    --   "--trim",
    --   "--smart-case"
    -- }
    local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }
    -- table.insert(vimgrep_arguments, "--hidden") -- Search hidden files
    table.insert(vimgrep_arguments, "--glob") -- Dont search inside .git
    table.insert(vimgrep_arguments, "!**/.git/*") -- Dont search inside .git

    -- local Popup = require("nui.popup")
    -- local Layout = require("nui.layout")

    -- local function make_popup(options)
    --   local popup = Popup(options)
    --   function popup.border:change_title(title)
    --     popup.border.set_text(popup.border, "top", title)
    --   end
    --   return TSLayout.Window(popup)
    -- end

    local custom_actions = transform_md({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    -- Extensions
    telescope.load_extension("ui-select")
    telescope.load_extension("noice")
    telescope.load_extension("neoclip") -- clipboard list on <leader>p
    telescope.load_extension("undo") -- File version history <leader>fu
    telescope.load_extension("fzf") -- Fuzzy find stuff

    telescope.setup({
      defaults = {
        vimgrep_arguments = vimgrep_arguments,
        path_display = { "smart" },
        -- layout_strategy = "flex",
        layout_strategy = "flex",
        -- layout_config = {
        --   horizontal = { size = {
        --     width = "90%",
        --     height = "60%",
        --   },},
        --   vertical = { size = {
        --     width = "90%",
        --     height = "90%",
        --   },},
        -- },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- Move to prev result
            ["<C-j>"] = actions.move_selection_next, -- Move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist, -- Move to next result
            ["<C-t>"] = trouble_t.open,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
        ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
      },
    })

    local keymap = vim.keymap
    -- keymap.set('n', '<leader>fP', builtin.commands, { desc = "Commands" })
    -- keymap.set('n', '<leader>fp', builtin., { desc = "Outline" })
    keymap.set("n", "<leader>fB", builtin.builtin, { desc = "Other builtins" })
    keymap.set("n", "<leader>fF", builtin.planets, { desc = "Files in cwd" })
    keymap.set("n", "<leader>fR", builtin.reloader, { desc = "reload plugins" })
    keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Files in cwd" })
    keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
    keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
    keymap.set("n", "<leader>fn", "<cmd>Telescope noice<cr>", { desc = "Noice messages" })
    keymap.set("n", "<leader>fo", builtin.lsp_document_symbols, { desc = "Outline" })
    keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
    keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Todos" })
    keymap.set("n", "<leader>p", "<cmd>Telescope neoclip<cr>", { desc = "Clipboard" })
  end,
}
