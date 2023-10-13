return {
    "nvimdev/guard.nvim",
    enabled = false,
    dependencies = {
        "nvimdev/guard-collection",
    },
    config = function()
        local ft = require "guard.filetype"

        ft("lua"):fmt "stylua"
        ft("javascript"):fmt "prettier"
        ft("astro"):fmt "prettier"
        ft("html"):fmt "prettier"
        ft("typescript,javascript,typescriptreact,javascriptreact,svelte,css"):fmt "prettier"
        ft("elixir", "eelixir"):fmt {
            cmd = "mix",
            args = { "format" },
            fname = true,
        }

        ft("python"):fmt "black"

        require("guard").setup {
            fmt_on_save = true,
        }
    end,
}
