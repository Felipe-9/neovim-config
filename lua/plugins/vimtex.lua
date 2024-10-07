return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    local g = vim.g
    g.vimtex_view_method = "zathura_simple"
    g.vimtex_compiler_latexmk_engines = { ["_"] = '-lualatex'}
    g.vimtex_compiler_latexmk = {
      aux_dir = ".build",
      -- out_dir = "",
      options = {
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      }
    }
    g.vimtex_quickfix_mode = 0
    g.vimtex_mappings_enable = 0
    -- g.vimtex_syntax_conceal = {
    --   accents = 1,             
    --   ligatures = 1,
    --   cites = 1,
    --   fancy = 1,
    --   spacing = 1,
    --   greek = 1,
    --   math_bounds = 1,
    --   math_delimiters = 1,
    --   math_fracs = 1,
    --   math_super_sub = 1,
    --   math_symbols = 1,
    --   sections = 0,
    --   styles = 1,
    -- }
    g.vimtex_log_ignore = ({
      "Underfull",
      "Overfull",
      "specifier changed to",
      "Token not allowed in PDF string",
    })
  end
}
