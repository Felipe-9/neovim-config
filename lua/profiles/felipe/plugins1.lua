return {
  { import = "plugins.alpha-nvim" }, -- Greeter
  { import = "plugins.auto-session" }, -- Sessions with w...
  { import = "plugins.autopairs" }, -- Edditing
  { import = "plugins.bufferline" }, -- Tab bar
  { import = "plugins.catppuccin" }, -- Theme
  { import = "plugins.colorizer" }, -- Colorize color codes
  { import = "plugins.comment" }, -- Comments
  { import = "plugins.default" }, -- Essential Plugins
  { import = "plugins.flash" }, -- flash searching enhancer
  { import = "plugins.fzf" }, -- Fuzzy finder integrations
  { import = "plugins.gitsigns" }, -- Git integration
  { import = "plugins.hardtime" }, -- Usage advises
  -- start
  -- { import = "plugins.indent-blankline" }, -- Indenting help lines
  -- end
  { import = "plugins.lazygit" }, -- Lazy Git integration
  { import = "plugins.legendary" }, -- Command palette
  { import = "plugins.lualine" }, -- Bottomline ui
  { import = "plugins.neoclip" }, -- persistent clipboard
  { import = "plugins.neoscroll" }, -- smooth scrolling
  { import = "plugins.nvim-ufo" }, -- folding
  { import = "plugins.surround" }, -- EDIT surroundings
  { import = "plugins.telescope" }, -- UI Find everything
  { import = "plugins.todo-comments" }, -- TODO comments
  { import = "plugins.treesitter" }, -- LSP coloring file
  { import = "plugins.vim-maximizer" }, -- UI maximize splits
  { import = "plugins.visual-multi" }, -- multiple cursors
  { import = "plugins.which-key" }, -- UI find keys and shortcuts
  { import = "plugins.yazi" }, -- UI File manager integration
  --
  -- LSPs
  --
  { import = "plugins.lsp.barbecue" }, -- Breadcrumbs bar
  { import = "plugins.lsp.linting" }, -- linting
  { import = "plugins.lsp.luasnip" }, -- snippets
  { import = "plugins.lsp.mason" }, -- lsp manager
  { import = "plugins.lsp.mason-lspconfig" }, -- lsp configuration
  { import = "plugins.lsp.none-ls" }, -- lsp server
  { import = "plugins.lsp.nvim-cmp" }, -- completion as you type
  { import = "plugins.lsp.nvim-lspconfig" }, -- lsp configuration
  { import = "plugins.lsp.trouble" }, -- error messages
  -- language specific
  { import = "plugins.lsp.r" }, -- Support for R
  { import = "plugins.vim-glsl" }, -- GLSL interpreter
  -- 
  -- Latex
  -- 
  { import = "plugins.latex.vimtex-cmp" }, -- Support for R
  { import = "plugins.latex.vimtex" }, -- LaTeX
}
