return {
  "junegunn/vim-easy-align",
  lazy = false,
  config = function()
    vim.keymap.set("x","ga",":EasyAlign ",{
      noremap=true,
      silent=false,
      desc="Easy align"
    })
    vim.keymap.set('n',"ga",":EasyAlign ",{
      noremap=true,
      silent=false,
      desc="Easy align"
    })
  end
  -- cmd = 'EasyAlign',
  -- keys = {
  --   {'ga',mode = {'n','x'}},
  --   {'gA',mode = {'n','x'}},
  -- },
  -- config = function()
  --   require'configs.vim-easy-align'
  -- end
  -- init = function()
  --   local align = require("align")
  --   local atoString = align.align_to_string
  --   local atoChar = align.align_to_char
  --   local function opString(obj)
  --     align.operator(atoString, obj)
  --   end
  --   local function opChar(obj)
  --     align.operator(atoChar, obj)
  --   end
  --
  --   local function map_x(key, func, opts, desc)
  --     vim.keymap.set("x", "a" .. key, function()
  --       func(opts)
  --     end, {
  --       noremap = true,
  --       silent = false,
  --       desc = desc,
  --     })
  --   end
  --   local function map_n(key, func, opts, desc)
  --     vim.keymap.set("n", "<leader>ga" .. key, function()
  --       func(opts)
  --     end, {
  --       noremap = true,
  --       silent = false,
  --       desc = desc,
  --     })
  --   end
  --   local function map_special(key, pattern, opts, desc)
  --     vim.keymap.set("n", "<leader>ga" .. key, function()
  --       align.align(pattern, opts)
  --     end, {
  --       noremap = true,
  --       silent = false,
  --       desc = desc,
  --     })
  --   end
  --
  --   map_x("c", atoChar, { length = 1 }, "align to char")
  --   map_x("C", atoChar, { length = 2, preview = true }, "align to char 2")
  --   -- align to string
  --   map_x("v", atoString, { preview = true, regex = false }, "align to string")
  --   map_x("V", atoString, { preview = true, regex = true }, "align to regex")
  --   -- align operators
  --   map_n("s", opString, { preview = true, regex = false }, "align to string operator")
  --   -- map_n("p", opString, { preview = true, reverse = true, is_pattern=true },                  "align to char operator")
  --   map_n("c", opChar, { preview = false },                  "align to char operator")
  --   -- align special
  --   -- map_special("gc", "comment", { reverse = true },         "align comments")
  -- end,
}
