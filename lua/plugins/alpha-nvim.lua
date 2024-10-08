return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = require("tables.banners")["hydra"]
    -- dashboard.section.header.opts.hl = "AlphaHeading"

    -- dashboard.section.header = {
    --   type = "text",
    --   val = require("tables.banners")["hydra"],
    --   opts = {
    --     position = "center",
    --     hl = "AlphaHeading",
    --   },
    -- }

    -- Set menu
    dashboard.section.buttons.val = {
      -- dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("<leader>ee", "  > Toggle file explorer", "<cmd>Yazi<CR>"),
      dashboard.button("<leader>ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("<leader>fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("<leader>wr", "󰁯  > Restore Session For CD", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
