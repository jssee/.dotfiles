return {
    "ms-jpq/coq_nvim",
    branch = "coq",
    dependencies = {
        { "ms-jpq/coq.artifacts", branch = "artifacts" },
    },
    init = function()
        vim.g.coq_settings = {
            auto_start = "shut-up",
            ["completion.skip_after"] = { "{", "}", "[", "]" },
        }
    end,
}
