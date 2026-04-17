-------------------
-- Configuration --
-------------------

-- Set leader before loading lazy.nvim to ensure correct mappings
vim.g.mapleader = " "
-- Prevent leader being overriden by a keybind
vim.keymap.set("n", "<Space>", "<Nop>", { noremap = true, silent = true })

-- General
vim.opt.undofile = true -- Enable persistent undo

-- Sync OS and Neovim clipboard
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Completion
vim.opt.updatetime = 250 -- Decreases delay before showing plugin completions

-- Formatting
vim.opt.expandtab = true -- Always use spaces
vim.opt.tabstop = 2 -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 2 -- Number of spaces per indentation (0 for tabstop)
vim.opt.shiftround = true -- Round indent to multiple of shift width
vim.opt.smartindent = true -- Indent after indentation keywords (like brackets)
vim.opt.linebreak = true -- Wrap lines at convenient points
vim.opt.breakindent = true -- Continue indentation after line breaks

-- Searching
vim.opt.ignorecase = true -- Ignore casing for searching
vim.opt.smartcase = true -- Case sensitive if string includes capital letters

-- Help
vim.opt.relativenumber = true -- Show line numbers relative to current position
vim.opt.showmatch = true -- Show matching brackets

-- Visibility
vim.opt.scrolloff = 6 -- Show six lines before window border
vim.opt.matchpairs:append("<:>") -- Match XML
vim.opt.whichwrap:append("<,>,[,]") -- Allow horizontal movement between lines
vim.opt.foldlevelstart = 99 -- Start without closed folds
vim.opt.inccommand = "split" -- Preview substitutions
vim.opt.cursorline = true -- Highlight current line (increases redraw time)
vim.opt.signcolumn = "yes" -- Reserve sign space (Git, LSP) in gutter to avoid layout shift

-- netrw
vim.g.netrw_banner = 0 -- Disable netrw banner
vim.g.netrw_winsize = 25 -- Set netrw window size to 25%

-- Delete trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*" },
	command = [[%s/\s+$//e]],
})

--------------
-- Keybinds --
--------------

-- Make 0 jump to first non-blank character
vim.keymap.set("n", "0", "^")

-- Copy and cut to clipboard
vim.keymap.set("v", "<C-c>", "+y", { desc = "Copy to clipboard" })
vim.keymap.set("v", "<C-x>", "+d", { desc = "Cut to clipboard" })

-- Save file using Ctrl+s as most other editors
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })

-- Move lines by pressing Alt
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv")

-- Clear search highlights on <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search higlights" })

-- Toggle spellchecking
vim.keymap.set("n", "<F7>", ":setlocal spell! spelllang=en_gb spell?<CR>", {
	desc = "Toggle English spellchecking",
})
vim.keymap.set("n", "<F8>", ":setlocal spell! spelllang=de_at spell?<CR>", {
	desc = "Toggle German spellchecking",
})

--------------
-- Commands --
--------------

-- Command to save file with sudo
vim.api.nvim_create_user_command("W", "w !sudo tee > /dev/null %", {})

-------------
-- Plugins --
-------------

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

require("lazy").setup({
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{ "mason-org/mason-lspconfig.nvim", opts = {} },
			"saghen/blink.cmp",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		opts = { auto_install = true },
		init = function()
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "stevearc/conform.nvim" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "catppuccin",
			},
		},
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = {
			signature = {
				enabled = true,
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>fc", "<cmd>TodoTelescope<cr>", desc = "[F]ind [C]omments" },
		},
		opts = {},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
})
