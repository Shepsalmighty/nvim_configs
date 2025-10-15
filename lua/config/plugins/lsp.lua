return {
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false, config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"pyright",
					"html",
					"cssls",
					"ts_ls",
				},

				-- MUST BE FALSE / NIL TO AVOID DUP ISSUE
				automatic_installation = false,
				automatic_setup = false,
				automatic_enable = false,
				handlers = nil,
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",

		config = function()
			vim.lsp.set_log_level("off")

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.offsetEncoding = { "utf-16" }

			local servers = {
				"lua_ls",
				"clangd",
				"pyright",
				"html",
				"cssls",
				"ts_ls",
			}

			for _, server in ipairs(servers) do
				local opts = {
					capabilities = capabilities,
					flags = { debounce_text_changes = 150 },
				}

				if server == "clangd" then
					opts.cmd = {
						"clangd",
						"--background-index",
						"--clang-tidy",
						"--header-insertion=iwyu",
						"--completion-style=detailed",
						"--function-arg-placeholders",
						"--fallback-style=file", -- uses your project .clang-format
						"--fallback-style=llvm",
						"--header-insertion=never",
					}
				end

				vim.lsp.config(server, opts)
				vim.lsp.enable({ server })
			end

			vim.keymap.set(
                "n", "K", vim.lsp.buf.hover,
                { desc = "Hover docs" }
            )

			vim.keymap.set(
                "n", "gd", vim.lsp.buf.definition,
                { desc = "Jump to Definition" }
            )

			vim.keymap.set(
                { "n", "v" }, "<leader>ca",
                vim.lsp.buf.code_action, { desc = "Code Action" }
            )
		end,
	},
}
