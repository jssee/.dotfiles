local cmd = vim.api.nvim_create_user_command

cmd("Rg", function(opts)
    require("jh.functions").Rg(opts.args)
end, {
    nargs = "+",
    complete = "file_in_path",
    bar = true,
})
