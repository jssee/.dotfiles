local colors_name = "gruvbones"
vim.g.colors_name = colors_name -- Required when defining a colorscheme

local lush = require "lush"
local hsluv = lush.hsluv -- Human-friendly hsl
local util = require "zenbones.util"

local bg = vim.o.background

-- Define a palette. Use `palette_extend` to fill unspecified colors
-- Based on https://github.com/gruvbox-community/gruvbox#palette
local palette
if bg == "light" then
    palette = util.palette_extend({
        bg = hsluv "#D3D6E1",
        fg = hsluv "#030405",
        rose = hsluv "#CB3F31",
        leaf = hsluv "#01C96A",
        wood = hsluv "#FF9F2D",
        water = hsluv "#317371",
        blossom = hsluv "#F05432",
        sky = hsluv "#206A96",
    }, bg)
else
    palette = util.palette_extend({
        bg = hsluv "#2E3C4D",
        fg = hsluv "#C1C7DB",
        rose = hsluv "#B06159",
        leaf = hsluv "#8EAA9D",
        wood = hsluv "#E9CEAF",
        water = hsluv "#7EA2B7",
        blossom = hsluv "#EFD3CC",
        sky = hsluv "#C4DFDE",
    }, bg)
end

-- Generate the lush specs using the generator util
local generator = require "zenbones.specs"
local base_specs = generator.generate(palette, bg, generator.get_global_config(colors_name, bg))

-- Optionally extend specs using Lush
local specs = lush.extends({ base_specs }).with(function()
    return {
        Statement { base_specs.Statement, fg = palette.rose },
        Special { fg = palette.water },
        Type { fg = palette.sky, gui = "italic" },
    }
end)

-- Pass the specs to lush to apply
lush(specs)

-- Optionally set term colors
require("zenbones.term").apply_colors(palette)
