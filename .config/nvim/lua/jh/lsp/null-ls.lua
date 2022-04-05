local has_null, null_ls = pcall(require, "null-ls")
local b = null_ls.builtins

if not has_null then
    return
end

local sources = {
    b.formatting.prettierd.with {
        filetypes = {
            "css",
            "html",
            "javascriptreact",
            "json",
            "markdown",
            "scss", -- this is not originally included
            "svelte",
            "typescript",
            "typescriptreact",
            "vue",
            "yaml",
            "javascript",
        },
    },
    b.formatting.stylua,
    b.diagnostics.eslint_d,
    b.diagnostics.credo,
}

local M = {}

M.setup = function(on_attach)
    null_ls.setup { sources = sources, on_attach = on_attach }
end

return M
