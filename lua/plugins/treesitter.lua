return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  depedencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
        disable = {"latex"},
      },
      indent = { enable = true },
      autotag = { enable = true },
      defaults = {
        path_display = { "smart" },
      },
      auto_install = true,
      ignore_install = { "latex" },
      sync_install = false,
      ensure_installed = {
        "markdown", -- "markdown-inline",
        "lua",
        "vim",
        "javascript",
        "typescript",
        "json",
        "yaml",
        "gitignore",
        "html",
        "css",
        "nix",
        "python",
        "markdown", "markdown_inline", "r", "rnoweb", "yaml", -- Needed for R
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
