require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		markdown = { "prettier", "prettier" },
		javascript = { "prettierd", "prettier" },
		javascriptreact = { "prettierd", "prettier" },
		typescript = { "prettierd", "prettier" },
		typescriptreact = { "prettierd", "prettier" },
		vue = { "prettierd", "prettier" },
		css = { "prettierd", "prettier" },
		graphql = { "prettierd", "prettier" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_on_save = {
		timeout_ms = 500,
	},
})
