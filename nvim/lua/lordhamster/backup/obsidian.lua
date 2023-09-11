return {
	"epwalsh/obsidian.nvim",
	lazy = true,
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		"BufReadPre /Users/jacob/Library/Mobile Documents/iCloud~md~obsidian/Documents/LordHamster/**.md",
		"BufNewFile /Users/jacob/Library/Mobile Documents/iCloud~md~obsidian/Documents/LordHamster/**.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- see below for full list of optional dependencies 👇
	},
	opts = function()
		vim.keymap.set("n", "gf", function()
			if require("obsidian").util.cursor_on_markdown_link() then
				return "<cmd>ObsidianFollowLink<CR>"
			else
				return "gf"
			end
		end, { noremap = false, expr = true })
		return {
			dir = "/Users/jacob/Library/Mobile Documents/iCloud~md~obsidian/Documents/LordHamster", -- no need to call 'vim.fn.expand' here

			-- Optional, set to true if you don't want obsidian.nvim to manage frontmatter.
			disable_frontmatter = true,

			mappings = {
				-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
				-- ["gf"] = require("obsidian.mapping").gf_passthrough(),
			},
			follow_url_func = function(url)
				-- Open the URL in the default web browser.
				vim.fn.jobstart({ "open", url }) -- Mac OS
				-- vim.fn.jobstart({"xdg-open", url})  -- linux
			end,
		}
	end,
}