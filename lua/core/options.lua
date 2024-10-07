local opt = vim.opt

-- Options
opt.updatetime = 200
opt.wrap = false
-- Linenumber
opt.relativenumber = true           -- Relative number
opt.number = true                   -- Relative number with cursor being absolute number
-- tabs & indentation
opt.tabstop = 2                     -- 2 spaces for tabs (prettier default)
opt.softtabstop = 2                 --
opt.shiftwidth = 2                  -- 2 spaces for indent width
opt.expandtab = true                -- expand tab to spaces
opt.autoindent = true               -- copy indent from current line when starting new one
-- search settings
opt.ignorecase = true               -- ignore case when searching
opt.smartcase = true                -- if you include mixed case in your search, assumes you want case-sensitive
-- Splits
opt.splitbelow = true               -- set new split windows below
opt.splitright = true               -- set new split windows right
-- backspace
opt.backspace = "indent,eol,start"  -- allow backspace on indent, end of line or insert mode start position
-- Theme
opt.cursorline = true               -- Highlight cursor line
opt.termguicolors = true
opt.background = "dark"             -- colorschemes that can be light or dark theme
opt.signcolumn = "yes"              -- show sign column so taht text doesnt shift
-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
