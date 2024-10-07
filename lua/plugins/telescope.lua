return {
  'nvim-telescope/telescope.nvim',
  -- tag = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    'nvim-tree/nvim-web-devicons',
    'folke/todo-comments.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    "folke/trouble.nvim",
    'MunifTanjim/nui.nvim',
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

    local vimgrep_arguments = { unpack( telescope_config.values.vimgrep_arguments ) }
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
      end
    })
    
    -- Extensions
    telescope.load_extension('ui-select')
    telescope.load_extension('noice')
    telescope.load_extension('neoclip') -- clipboard list on <leader>p
    telescope.load_extension('undo') -- File version history <leader>fu
    telescope.load_extension('fzf') -- Fuzzy find stuff

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
            ["<C-k>"] = actions.move_selection_previous,                                      -- Move to prev result
            ["<C-j>"] = actions.move_selection_next,                                          -- Move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist, -- Move to next result
            ["<C-t>"] = trouble_t.open,
          }
        },
        -- create_layout = function(picker)
        --   local border = {
        --     results = {
        --       top_left = "┌",
        --       top = "─",
        --       top_right = "┬",
        --       right = "│",
        --       bottom_right = "",
        --       bottom = "",
        --       bottom_left = "",
        --       left = "│",
        --     },
        --     results_patch = {
        --       minimal = {
        --         top_left = "┌",
        --         top_right = "┐",
        --       },
        --       horizontal = {
        --         top_left = "┌",
        --         top_right = "┬",
        --       },
        --       vertical = {
        --         top_left = "├",
        --         top_right = "┤",
        --       },
        --     },
        --     prompt = {
        --       top_left = "├",
        --       top = "─",
        --       top_right = "┤",
        --       right = "│",
        --       bottom_right = "┘",
        --       bottom = "─",
        --       bottom_left = "└",
        --       left = "│",
        --     },
        --     prompt_patch = {
        --       minimal = {
        --         bottom_right = "┘",
        --       },
        --       horizontal = {
        --         bottom_right = "┴",
        --       },
        --       vertical = {
        --         bottom_right = "┘",
        --       },
        --     },
        --     preview = {
        --       top_left = "┌",
        --       top = "─",
        --       top_right = "┐",
        --       right = "│",
        --       bottom_right = "┘",
        --       bottom = "─",
        --       bottom_left = "└",
        --       left = "│",
        --     },
        --     preview_patch = {
        --       minimal = {},
        --       horizontal = {
        --         bottom = "─",
        --         bottom_left = "",
        --         bottom_right = "┘",
        --         left = "",
        --         top_left = "",
        --       },
        --       vertical = {
        --         bottom = "",
        --         bottom_left = "",
        --         bottom_right = "",
        --         left = "│",
        --         top_left = "┌",
        --       },
        --     },
        --   }
        --
        --   local results = make_popup({
        --     focusable = false,
        --     border = {
        --       style = border.results,
        --       text = {
        --         top = picker.results_title,
        --         top_align = "center",
        --       },
        --     },
        --     win_options = {
        --       winhighlight = "Normal:Normal",
        --     },
        --   })
        --
        --   local prompt = make_popup({
        --     enter = true,
        --     border = {
        --       style = border.prompt,
        --       text = {
        --         top = picker.prompt_title,
        --         top_align = "center",
        --       },
        --     },
        --     win_options = {
        --       winhighlight = "Normal:Normal",
        --     },
        --   })
        --
        --   local preview = make_popup({
        --     focusable = false,
        --     border = {
        --       style = border.preview,
        --       text = {
        --         top = picker.preview_title,
        --         top_align = "center",
        --       },
        --     },
        --   })
        --
        --   local box_by_kind = {
        --     vertical = Layout.Box({
        --       Layout.Box(preview, { grow = 1 }),
        --       Layout.Box(results, { grow = 1 }),
        --       Layout.Box(prompt, { size = 3 }),
        --     }, { dir = "col" }),
        --     horizontal = Layout.Box({
        --       Layout.Box({
        --         Layout.Box(results, { grow = 1 }),
        --         Layout.Box(prompt, { size = 3 }),
        --       }, { dir = "col", size = "50%" }),
        --       Layout.Box(preview, { size = "50%" }),
        --     }, { dir = "row" }),
        --     minimal = Layout.Box({
        --       Layout.Box(results, { grow = 1 }),
        --       Layout.Box(prompt, { size = 3 }),
        --     }, { dir = "col" }),
        --   }
        --
        --   local function get_box()
        --     local strategy = picker.layout_strategy
        --     if strategy == "vertical" or strategy == "horizontal" then
        --       return box_by_kind[strategy], strategy
        --     end
        --
        --     local height, width = vim.o.lines, vim.o.columns
        --     local box_kind = "horizontal"
        --     if width < 100 then
        --       box_kind = "vertical"
        --       if height < 40 then
        --         box_kind = "minimal"
        --       end
        --     end
        --     return box_by_kind[box_kind], box_kind
        --   end
        --
        --   local function prepare_layout_parts(layout, box_type)
        --     layout.results = results
        --     results.border:set_style(border.results_patch[box_type])
        --
        --     layout.prompt = prompt
        --     prompt.border:set_style(border.prompt_patch[box_type])
        --
        --     if box_type == "minimal" then
        --       layout.preview = nil
        --     else
        --       layout.preview = preview
        --       preview.border:set_style(border.preview_patch[box_type])
        --     end
        --   end
        --
        --   local function get_layout_size(box_kind)
        --     return picker.layout_config[box_kind == "minimal" and "vertical" or box_kind].size
        --   end
        --
        --   local box, box_kind = get_box()
        --   local layout = Layout({
        --     relative = "editor",
        --     position = "50%",
        --     size = get_layout_size(box_kind),
        --   }, box)
        --
        --   layout.picker = picker
        --   prepare_layout_parts(layout, box_kind)
        --
        --   local layout_update = layout.update
        --   function layout:update()
        --     local box, box_kind = get_box()
        --     prepare_layout_parts(layout, box_kind)
        --     layout_update(self, { size = get_layout_size(box_kind) }, box)
        --   end
        --
        --   return TSLayout(layout)
        -- end,
      },
      -- vimgrep_arguments = {
      --   "rg",
      --   "--color=always",
      --   "--stats",
      --   "-C 0",
      --   "--trim",
      --   "--smart-case"
      -- }
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        },
        ["ui-select"] = { require("telescope.themes").get_dropdown {} }
      },
    })

    local keymap = vim.keymap
    keymap.set({'n','v'}, '<leader>ff', builtin.find_files, { desc = "Files in cwd" })
    keymap.set({'n','v'}, '<leader>fF', builtin.planets, { desc = "Files in cwd" })
    keymap.set({'n','v'}, '<leader>fr', builtin.oldfiles, { desc = "Recent files" })
    keymap.set({'n','v'}, '<leader>fR', builtin.reloader, { desc = "reload plugins" })
    keymap.set({'n','v'}, '<leader>fs', builtin.live_grep, { desc = "Find string in cwd" })
    keymap.set({'n','v'}, '<leader>fc', builtin.grep_string, { desc = "Find string under cursor in cwd" })
    keymap.set({'n','v'}, '<leader>fh', builtin.help_tags, { desc = "Help tags" })
    -- keymap.set('n', '<leader>fP', builtin.commands, { desc = "Commands" })
    keymap.set({'n','v'}, '<leader>fk', builtin.keymaps, { desc = "Keymaps" })
    keymap.set({'n','v'}, '<leader>fb', builtin.buffers, { desc = "Buffers" })
    keymap.set({'n','v'}, '<leader>fB', builtin.builtin, { desc = "Other builtins" })
    keymap.set({'n','v'}, '<leader>fo', builtin.lsp_document_symbols, { desc = "Outline" })
    -- keymap.set('n', '<leader>fp', builtin., { desc = "Outline" })
    keymap.set({'n','v'}, '<leader>ft', "<cmd>TodoTelescope<cr>", { desc = "Todos" })
    keymap.set({'n','v'}, '<leader>fn', "<cmd>Telescope noice<cr>", { desc = "Noice messages" })
    keymap.set({'n','v'}, '<leader>p', "<cmd>Telescope neoclip<cr>", { desc = "Clipboard" })
  end
}
