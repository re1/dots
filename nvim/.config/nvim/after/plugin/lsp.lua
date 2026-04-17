-- Configuration for when a language server is active in the file
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		-- Helper function to include buffer in LSP keymaps
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
		end

		local telescope = require("telescope.builtin")

		-- Telescope overrides native
		map("grr", telescope.lsp_references, "[G]oto [R]eferences")
		map("gri", telescope.lsp_implementations, "[G]oto [I]mplementation")
		map("grt", telescope.lsp_type_definitions, "[G]oto [T]ype Definitions")

		-- Additional native
		map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("gs", vim.lsp.buf.signature_help, "[G]oto [S]ignature")

		-- Additional telescope
		map("grd", telescope.lsp_definitions, "[G]oto [D]efinitions")

		map("<leader>fds", telescope.lsp_document_symbols, "[F]ind [D]ocument [S]ymbols")
		map("<leader>ftd", telescope.lsp_type_definitions, "[F]ind [T]ype [D]efinitions")
		map("<leader>fws", telescope.lsp_dynamic_workspace_symbols, "[F]ind [W]orkspace [S]ymbols")

		-- Common in other editors
		map("K", vim.lsp.buf.hover, "Quick documentation")
		map("<F2>", vim.lsp.buf.rename, "Rename")
		map("<F3>", function()
			vim.lsp.buf.format({ async = true })
		end, "Format")
		map("<F4>", vim.lsp.buf.code_action, "Code action")
		map("<A-CR>", vim.lsp.buf.code_action, "Code action")
	end,
})

vim.lsp.config("ts_ls", {
	plugins = {
		{
			name = "@vue/typescript-plugin",
			location = vim.fn.expand("$MASON/packages/vue-language-server") .. "/node_modules/@vue/language-server",
			languages = { "vue" },
		},
	},
	filetypes = { "typescript", "javascript", "vue" },
})
