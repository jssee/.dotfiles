return {
    "nvimdev/guard.nvim",
    config = function()
        local ft = require "guard.filetype"

        ft("lua"):fmt "stylua"
        ft("javascript"):fmt "prettier"
        ft("typescript,javascript,typescriptreact,javascriptreact,svelte,css"):fmt "prettier"
        ft("elixir", "eelixir"):fmt {
            cmd = "mix",
            args = { "format" },
            fname = true,
        }

        require("guard").setup {
            fmt_on_save = true,
        }
    end,
}
