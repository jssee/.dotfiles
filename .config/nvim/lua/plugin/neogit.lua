return {
    "neogitorg/neogit",
    dependencies = {
        {
            "sindrets/diffview.nvim",
            lazy = false,
            opts = {
                use_icons = false,
            },
        },
        { "nvim-lua/plenary.nvim", lazy = false, priority = 1000 },
    },
    init = function()
        local cmd = vim.api.nvim_create_user_command
        local autocmd = vim.api.nvim_create_autocmd
        local group = vim.api.nvim_create_augroup("plugin/neogit", { clear = true })

        cmd("DiffviewReview", function(opts)
            if opts.bang then
                -- review a PR by file
                vim.cmd.DiffviewOpen "origin/HEAD...HEAD --imply-local"
            else
                -- review a PR by commit
                vim.cmd.DiffviewFileHistory [[
                                        --range=origin/HEAD...HEAD
                                        --right-only
                                        --no-merges
                                        --imply-local
                                ]]
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
            mini_pick = true,
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
            desc = "git status",
        },
        {
            "<leader>gc",
            function()
                require("neogit").open { "commit" }
            end,
            desc = "git commit",
        },
        {
            "<leader>gh",
            function()
                vim.cmd.DiffviewFileHistory "%"
            end,
            desc = "git file history",
        },
        {
            "<leader>gd",
            function()
                vim.cmd.DiffviewOpen "origin/HEAD"
            end,
            desc = "git diff",
        },
        {
            "<leader>gr",
            function()
                vim.cmd.DiffviewReview()
            end,
            desc = "review changed files",
        },
        {
            "<leader>gR",
            function()
                vim.cmd.DiffviewReview { bang = true }
            end,
            desc = "review branch commits",
        },
    },
}
