local bleems = {
    '⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄',
		'⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣳⣤⣀⣀⡀⣀⡴⡄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄',
		'⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣼⣾⣾⣿⣿⣯⡾⣣⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄',
		'⠄⠄⠄⠄⠄⠄⠄⠄⢠⢧⢿⣟⣨⣿⢿⢿⣿⢿⣵⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄',
		'⠄⠄⠄⠄⠄⠄⠄⠄⢨⣞⡋⠈⡈⠂⢂⢨⢯⢿⢵⠹⣢⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄',
		'⠄⠄⠄⠄⠄⠄⠄⠄⢱⢫⢦⢠⢂⠨⣠⡿⣯⡿⡱⡱⣜⣧⢄⡀⠄⠄⠄⠄⠄⠄⠄⠄',
		'⠄⠄⠄⠄⠄⠄⠄⠄⠄⣷⣅⢇⣕⣰⣷⡿⣟⣝⣾⣽⣿⢽⣣⢿⣄⠄⠄⠄⠄⠄⠄⠄',
		'⠄⠄⠄⠄⠄⠄⠄⠄⠄⢫⣿⣿⣿⣿⣫⣫⢾⣾⢷⡿⣞⣟⣞⣽⡾⡆⠄⠄⠄⠄⠄⠄',
		'⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⢛⢿⣻⢷⢷⢟⢏⠏⣗⣿⢿⣽⡾⣿⣽⡇⠄⠄⠄⠄⠄⠄',
		'⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠘⣮⡪⡪⣮⣦⡱⣽⣿⣿⣟⢗⣿⣟⣷⠃⠄⠄⠄⠄⠄⠄',
		'⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣹⡽⣞⣮⣷⣟⣿⣿⣿⣏⢺⣿⣿⣿⠄⠄⠄⠄⠄⠄⠄',
		'⠄⠄⠄⠄⠄⠄⠄⠄⣔⢤⣲⢮⢫⣞⣿⣟⣿⣿⣻⣷⡳⡹⢟⢯⡧⠄⠄⠄⠄⠄⠄⠄',
		'⠄⠄⠄⠄⠄⠄⠄⠉⠊⠉⢉⠱⣕⢷⡫⣯⡫⡯⡻⡓⢕⢸⣺⠽⠁⠄⠄⠄⠄⠄⠄⠄',
		'⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠐⠑⠃⢇⠜⠈⠈⠉⠙⠄⡂⠉⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄',
		'⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠠⡐⣐⠈⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄',
		'⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄',
}

local settings = {
    header = {
        type = "text",
				align = "center",
				fold_section = false,
				title = "Image",
				margin = 5,
				content = bleems,
				highlight = "Statement",
				default_color = "",
        oldfiles_amount = 0,
    },
    body = {
        type = "oldfiles",
				align = "center",
				fold_section = false,
				title = "Oldfiles",
				margin = 5,
				content = "",
        highlight = "String",
        default_color = "",
        oldfiles_amount = 5,
    },
    options = {
        after = function()
            require("startup.utils").oldfiles_mappings()
        end,
        mapping_keys = false,
        cursor_column = 0.25,
        empty_line_between_mappings = false,
        disable_statuslines = true,
        paddings = { 1, 1, 1, 1 },
    },
    mappings = {
        execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<c-o>",
        open_section = "<TAB>",
        open_help = "?",
    },
    colors = {
        background = "#1f2227",
        folded_section = "#56b6c2",
    },
    parts = { "header", "body" },
}

return settings
