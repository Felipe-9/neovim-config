return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    -- Preview
    vim.g.vimtex_view_method = "zathura"
    vim.g.latex_view_general_viewer = "zathura"
    -- vim.g.vimtex_view_method = "zathura_simple"
    -- Compiling
    vim.g.vimtex_compiler_latexmk_engines = { ["_"] = "-lualatex" }
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = ".build",
      -- out_dir = "",
      options = {
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }
    -- Features
    vim.g.vimtex_quickfix_mode = 1
    vim.g.vimtex_mappings_enable = 0
    vim.g.vimtex_indent_enabled = 1
    vim.g.vimtex_format_enabled = 1
    vim.g.vimtex_indent_on_ampersands = 0
    vim.g.imaps_enabled = 0
    vim.g.vimtex_log_ignore = {
      "Underfull",
      "Overfull",
      "specifier changed to",
      "Token not allowed in PDF string",
    }
    --
    -- Syntax conceal
    --
    vim.wo.conceallevel = 2
    vim.vimtex_syntax_conceal = 1
    vim.g.vimtex_syntax_conceal = {
      accents = 1,
      ligatures = 1,
      cites = 1,
      fancy = 1,
      spacing = 0,
      greek = 1,
      math_bounds = 1,
      math_delimiters = 1,
      math_fracs = 1,
      math_super_sub = 0,
      math_symbols = 1,
      sections = 0,
      styles = 1,
    }
    --
    -- Defining custom syntax conceal
    --
    -- Simple commands
    vim.g.vimtex_syntax_custom_cmds = {
      -- {
      --   mathmode = true,
      --   name = ",",
      --   concealchar = " ",
      -- },
      { -- mdif
        mathmode = true,
        name = "mdif",
        concealchar = "D",
      },
      -- { -- mdif*
      --   mathmode = true,
      --   name = "mdifstar",
      --   cmdre = "mdif\\*",
      --   concealchar = "D",
      -- },
      { -- odif
        mathmode = true,
        name = "odif",
        concealchar = "d",
      },
      { -- fdif
        mathmode = true,
        name = "fdif",
        concealchar = "δ",
      },
      { -- adif
        mathmode = true,
        name = "adif",
        concealchar = "Δ",
      },
      { -- jdif
        mathmode = true,
        name = "jdif",
        concealchar = "∂",
      },
      { -- gdif
        mathmode = true,
        name = "gdif",
        concealchar = "∇",
      },
      -- -- delims
      -- {
      --   mathmode = true,
      --   -- opt = false,
      --   name = "left(",
      --   cmdre = "\\left(",
      --   concealchar = "("
      -- },
    }
    -- Commands with variables
    vim.g.vimtex_syntax_custom_cmds_with_concealed_delims = {
      { -- myrange
        mathmode = true,
        opt = false,
        name = "myrange",
        nargs = 1,
        cchar_open = "[",
        cchar_close = "]",
      },
      { -- myrange*
        mathmode = true,
        opt = false,
        conceal = true,
        name = "myrangestar",
        cmdre = "myrange\\*",
        nargs = 1,
        cchar_open = "]",
        cchar_close = "[",
      },
      { -- myranger
        mathmode = true,
        opt = false,
        name = "myranger",
        nargs = 1,
        cchar_open = "[",
        cchar_close = "[",
      },
      { -- myrangel
        mathmode = true,
        opt = false,
        name = "myrangel",
        nargs = 1,
        cchar_open = "]",
        cchar_close = "]",
      },
      { -- myrangelr
        mathmode = true,
        opt = false,
        name = "myrangelr",
        nargs = 1,
        cchar_open = "]",
        cchar_close = "[",
      },
      { -- myvert
        mathmode = true,
        opt = false,
        nargs = 1,
        name = "myvertsingle",
        cmdre = "myvert",
        cchar_open = "|",
        cchar_close = "|",
      },
      { -- myVert
        mathmode = true,
        opt = false,
        nargs = 1,
        name = "myVertdouble",
        cmdre = "myVert",
        cchar_open = "‖",
        cchar_close = "‖",
      },
      { -- myvert*
        mathmode = true,
        opt = false,
        nargs = 1,
        name = "myvertsinglestar",
        cmdre = "myvert\\*",
        cchar_open = "|",
        cchar_close = "|",
      },
      { -- myVert
        mathmode = true,
        opt = false,
        nargs = 1,
        name = "myVertdoublestar",
        cmdre = "myVert\\*",
        cchar_open = "‖",
        cchar_close = "‖",
      },
    }

    vim.g.vimtex_syntax_custom_envs = {
      { -- BM
        name = "BM",
        math = true,
      },
      { -- sectionBox
        name = "sectionBox",
        contains = "ALL",
      },
      { -- questionBox
        name = "questionBox",
      },
      { -- exampleBox
        name = "exampleBox",
        contains="ALL",
      },
    }

    vim.g.vimtex_indent_delims = {
      open  = { "{", "(", "\\[" },
      close = { "}", ")", "\\]" },
      -- close_indented = 1,
      include_modified_math = 1,
    }
  end,
}
