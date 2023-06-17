new_user_command("Telescope_cs_files", function(opts)
    require("telescope.builtin").find_files { search_file = "*.cs" }
end, { nargs = 0 })
