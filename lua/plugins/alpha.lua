return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local boardlogo = [[
				=================     ===============     ===============   ========  ========
				\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
				||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
				|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
				||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
				|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
				||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
				|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
				||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
				||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
				||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
				||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
				||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
				||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
				||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
				||.=='    _-'                                                     `' |  /==.||
				=='    _-'                      N E R O V I M                         \/   `==
				\   _-'                                                                `-_   /
				 `''                                                                      ``'	]]
		dashboard.section.header.val = vim.split(boardlogo, "\n")
		dashboard.section.buttons.val = {
			dashboard.button("f", " [1]" .. " Find file", "<cmd> Telescope find_files <cr>"),
			dashboard.button("n", " [2]" .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
			dashboard.button("r", " [3]" .. " Recent files", "<cmd> Telescope oldfiles <cr>"),
			dashboard.button("g", " [4]" .. " Find text", "<cmd> Telescope live_grep <cr>"),
			dashboard.button("rs", " [5]" .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
			dashboard.button("l", "󰒲 [6]" .. " Lazy", "<cmd> Lazy <cr>"),
			dashboard.button("m", " [7]" .. " Mason (Configure LSPs)", "<cmd> Mason<cr>"),
			dashboard.button("q", " [8]" .. " Quit", "<cmd> qa <cr>"),
		}

		dashboard.section.footer.val = "It took me a while to be happy"
		alpha.setup(dashboard.config)
	end,
}
