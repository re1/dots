require("catppuccin").setup({
    color_overrides = {
        mocha = {
	    base = "#1e1e1e",
	    mantle = "#181818",
	    crust = "#111111"
	},
    }
})

vim.cmd.colorscheme "catppuccin"
