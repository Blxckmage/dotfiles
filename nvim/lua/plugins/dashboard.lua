return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	opts = function()
		local logo = [[
     ▄▄▄▄    ██▓    ▄▄▄       ▄████▄   ██ ▄█▀ ███▄ ▄███▓ ▄▄▄        ▄████ ▓█████ 
    ▓█████▄ ▓██▒   ▒████▄    ▒██▀ ▀█   ██▄█▒ ▓██▒▀█▀ ██▒▒████▄     ██▒ ▀█▒▓█   ▀ 
    ▒██▒ ▄██▒██░   ▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ ▓██    ▓██░▒██  ▀█▄  ▒██░▄▄▄░▒███   
    ▒██░█▀  ▒██░   ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄ ▒██    ▒██ ░██▄▄▄▄██ ░▓█  ██▓▒▓█  ▄ 
    ░▓█  ▀█▓░██████▒▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄▒██▒   ░██▒ ▓█   ▓██▒░▒▓███▀▒░▒████▒
    ░▒▓███▀▒░ ▒░▓  ░▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒░ ▒░   ░  ░ ▒▒   ▓▒█░ ░▒   ▒ ░░ ▒░ ░
    ▒░▒   ░ ░ ░ ▒  ░ ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░░  ░      ░  ▒   ▒▒ ░  ░   ░  ░ ░  ░
     ░    ░   ░ ░    ░   ▒   ░        ░ ░░ ░ ░      ░     ░   ▒   ░ ░   ░    ░   
     ░          ░  ░     ░  ░░ ░      ░  ░          ░         ░  ░      ░    ░  ░
          ░                  ░                                                   
    ]]

		logo = string.rep("\n", 8) .. logo .. "\n\n"

		local opts = {
			theme = "hyper",
			config = {
				header = vim.split(logo, "\n"),
				hide = {
					statusline = false,
				},
				shortcut = {
					{
						desc = "Lazy",
						icon = "󰒲 ",
						action = "Lazy",
						group = "Type",
						key = "l",
					},
					{
						desc = "Find file",
						icon = " ",
						group = "Label",
						action = "Telescope find_files",
						key = "d",
					},
					{
						desc = "New file",
						icon = " ",
						action = "ene | startinsert",
						group = "Statement",
						key = "n",
					},
					{
						desc = "Find text",
						icon = " ",
						action = "Telescope live_grep",
						group = "PreProc",
						key = "/",
					},
					{
						desc = "Quit",
						icon = " ",
						action = "qa",
						group = "Error",
						key = "q",
					},
				},
			},
		}

		return opts
	end,
}
