return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<F10>", ":Neotree filesystem toggle left<CR>", {})
		vim.keymap.set("n", "<C-b>", ":Neotree buffers reveal float<CR>", {})
	end,
}
