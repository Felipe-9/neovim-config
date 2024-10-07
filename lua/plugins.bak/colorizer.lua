return {
  "norcalli/nvim-colorizer.lua",
  event = "BufRead",
  config = function()
    require("colorizer").setup({"*"},{
      RGB = true,
      RRGGBB = true,
      names = true,
      RRGGBBAA = true,
      AARRGGBB = true,
      -- 0xAARRGGBB = true,
      -- 0xRRGGBBAA = true,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
      lowercase = true,
      mode = "background",
    })
  end,
}
