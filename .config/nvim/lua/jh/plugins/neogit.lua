return {
    "neogitorg/neogit",
    dependencies = {
        { "sindrets/diffview.nvim", lazy = false },
        { "nvim-lua/plenary.nvim" },
    },
    init = function()
        local cmd = vim.api.nvim_create_user_command
        local autocmd = vim.api.nvim_create_autocmd
        local group = vim.api.nvim_create_augroup("neogit", { clear = true })

        cmd("DiffviewReview", function(opts)
            if opts.bang then
                -- review a PR by file
                vim.cmd.DiffviewOpen "origin/HEAD...HEAD --imply-local"
            else
                -- review a PR by commit
                vim.cmd.DiffviewFileHistory "--range=origin/HEAD...HEAD --right-only --no-merges --imply-local"
            end
        end, {
            bang = true,
        })

        autocmd("FileType", {
            desc = "Close these windows with `q`",
            pattern = { "DiffviewFileHistory", "DiffviewFiles" },
            group = group,
            command = "nnoremap <buffer> q <cmd>tabc!<cr>",
        })
    end,
    config = true,
    opts = {
        integrations = {
            diffview = true,
        },
        sections = {
            recent = { folded = false },
        },
        signs = {
            -- { CLOSED, OPENED }
            section = { "▸", "▾" },
            item = { "▸", "▾" },
        },
    },
    keys = {
        {
            "<leader>gg",
            function()
                require("neogit").open()
            end,
        },
        {
            "<leader>gc",
            function()
                require("neogit").open { "commit" }
            end,
        },
        {
            "<leader>gh",
            function()
                vim.cmd.DiffviewFileHistory "%"
            end,
        },
        {
            "<leader>gd",
            function()
                vim.cmd.DiffviewOpen "origin/HEAD"
            end,
        },
        {
            "<leader>gr",
            function()
                vim.cmd.DiffviewReview()
            end,
        },
        {
            "<leader>gR",
            function()
                vim.cmd.DiffviewReview { bang = true }
            end,
        },
    },
}
