-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require("lspconfig").util.default_config
local capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig_defaults.capabilities = vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, capabilities)

-- Configuration for when a language server is active in the file
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		-- Helper function to include buffer in LSP keymaps
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
		end

		local telescope = require("telescope.builtin")

		map("gd", telescope.lsp_definitions, "[G]oto [D]efinitions")
		map("gr", telescope.lsp_references, "[G]oto [R]eferences")
		map("gi", telescope.lsp_implementations, "[G]oto [I]mplementation")
		map("gt", telescope.lsp_type_definitions, "[G]oto [T]type definitions")

		map("fds", telescope.lsp_document_symbols, "[F]ind [D]ocument [S]ymbols")
		map("fws", telescope.lsp_dynamic_workspace_symbols, "[F]ind [W]orkspace [S]ymbols")

		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("gs", vim.lsp.buf.signature_help, "[G]oto [S]ignature")

		map("K", vim.lsp.buf.hover, "Quick documentation")

		map("<F2>", vim.lsp.buf.rename, "Rename")
		map("<F3>", function()
			vim.lsp.buf.format({ async = true })
		end, "Format")
		map("<F4>", vim.lsp.buf.code_action, "Code action")
	end,
})

local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		-- Carriage return complete (usually Enter)
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		-- Simple tab complete
		["<Tab>"] = cmp.mapping(function(fallback)
			local col = vim.fn.col(".") - 1

			if cmp.visible() then
				cmp.select_next_item({ behavior = "select" })
			elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
				fallback()
			else
				cmp.complete()
			end
		end, { "i", "s" }),

		-- Go to previous item
		["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
	}),
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
})

-- Borders for help windows
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

-- Vim scripting
require("lspconfig").lua_ls.setup({})

-- Web development
require("lspconfig").cssls.setup({})
require("lspconfig").jsonls.setup({})
require("lspconfig").html.setup({})
require("lspconfig").denols.setup({})

-- Bash
require("lspconfig").bashls.setup({})

-- GraphQL
require("lspconfig").graphql.setup({})

-- Yaml
require("lspconfig").yamlls.setup({})

-- LaTeX
require("lspconfig").texlab.setup({
	settings = {
		texlab = {
			build = {
				args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "-outdir=out", "%f" },
			},
			chktex = {
				onOpenAndSave = true,
			},
		},
	},
})

vim.g.markdown_fenced_languages = {
	"ts=typescript",
}
