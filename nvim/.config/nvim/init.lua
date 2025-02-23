-- Install lazy.nvim automatically if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Set leader before loading lazy.nvim to ensure correct mappings
vim.g.mapleader = " "
-- Prevent leader being overriden by a keybind
vim.keymap.set("n", "<Space>", "<Nop>", { noremap = true, silent = true })

require("lazy").setup({
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "stevearc/conform.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "catppuccin",
			},
		},
	},
	{ "nvim-telescope/telescope.nvim", tag = "0.1.8", dependencies = { "nvim-lua/plenary.nvim" } },
})

-------------------
-- Configuration --
-------------------

-- General
vim.opt.undofile = true -- Enable persistent undo

-- Completion
vim.opt.complete:append("kspell") -- Complete with dictionary
vim.opt.matchpairs:append("<:>") -- Match XML

-- Formatting
vim.opt.expandtab = true -- Always use spaces
vim.opt.tabstop = 2 -- Number of spaces that a <Tab> counts for
vim.opt.softtabstop = 2 -- Number of spaces that a <Tab> counts for when inserted
vim.opt.shiftwidth = 2 -- Number of spaces per indentation
vim.opt.shiftround = true -- Round indent to multiple of shift width
vim.opt.smartindent = true -- Indent after indentation keywords (like brackets)
vim.opt.linebreak = true -- Wrap lines at convenient points

-- Searching
vim.opt.gdefault = true -- Add g flag to search/replace by default
vim.opt.ignorecase = true -- Ignore casing for searching
vim.opt.smartcase = true -- Smart casing for searching

-- Help
vim.opt.relativenumber = true -- Show line numbers relative to current position
vim.opt.showmatch = true -- Show matching brackets

-- Visibility
vim.opt.scrolloff = 6 -- Show six lines before window border
vim.opt.whichwrap:append("<,>,[,]") -- Allow horizontal movement between lines
vim.opt.foldlevelstart = 99 -- Start without closed folds

-- netrw
vim.g.netrw_banner = 0 -- Disable netrw banner
vim.g.netrw_winsize = 25 -- Set netrw window size to 25%

-- Delete trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = "%s/s+$//e",
})

--------------
-- Keybinds --
--------------

-- Make 0 jump to first non-blank character
vim.keymap.set("n", "0", "^")

-- Copy and cut to clipboard
vim.keymap.set("v", "<C-c>", "+y")
vim.keymap.set("v", "<C-x>", "+d")

-- Save file using Ctrl+s as most other editors
vim.keymap.set("n", "<C-s>", ":w<CR>")

-- Move lines by pressing Alt
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv")

-- Toggle spellchecking
vim.keymap.set("n", "<F7>", ":setlocal spell! spelllang=en_gb spell?<CR>")
vim.keymap.set("n", "<F8>", ":setlocal spell! spelllang=de_at spell?<CR>")

--------------
-- Commands --
--------------

-- Command to save file with sudo
vim.api.nvim_create_user_command("W", "w !sudo tee > /dev/null %", {})
