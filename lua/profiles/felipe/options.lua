local opt = vim.opt

-- Options
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register
vim.opt.scrolloff = 6 -- min lines between cursor and vertical window edge
vim.opt.backspace = "indent,eol,start"  -- allow backspace on indent, end of line or insert mode start position
-- vim.opt.fillchars = { eob = " "} -- remove EOB
vim.opt.spell = false -- disable spell check
-- Time
vim.opt.updatetime = 200
vim.opt.timeoutlen = 300 -- ms wait for mapped sequence to complete
-- wrap
vim.opt.wrap = true -- wrap text
vim.opt.linebreak = true -- break line in "breakat"
-- folds
vim.opt.foldenable = false -- disable default folding
vim.opt.foldmethod = "manual" -- set folding to manual
-- Linenumber
vim.opt.number = true                   -- Relative number with cursor being absolute number
vim.opt.relativenumber = true           -- Relative number
-- tabs & indentation
vim.opt.tabstop = 2                     -- 2 spaces for tabs (prettier default)
vim.opt.softtabstop = 2                 --
vim.opt.shiftwidth = 2                  -- 2 spaces for indent width
vim.opt.showtabline = 2 -- show tabline (indentation guides)
vim.opt.expandtab = true                -- expand tab to spaces
vim.opt.autoindent = true               -- copy indent from current line when starting new one
vim.opt.smartindent = true
vim.opt.breakindent = true
-- search settings
vim.opt.ignorecase = true               -- ignore case when searching
vim.opt.smartcase = true                -- if you include mixed case in your search, assumes you want case-sensitive
-- Splits
vim.opt.splitbelow = true               -- set new split windows below
vim.opt.splitright = true               -- set new split windows right
-- Theme
vim.opt.cursorline = true               -- Highlight cursor line
vim.opt.termguicolors = true
vim.opt.background = "dark"             -- colorschemes that can be light or dark theme
vim.opt.signcolumn = "yes"              -- show sign column so taht text doesnt shift
vim.opt.cmdheight = 1;
-- ui
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { border = "rounded" }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, { border = "rounded" }
)
vim.diagnostic.config{ float={border= 'rounded'} }
