lvim.plugins = {
	{ "christoomey/vim-tmux-navigator" }, -- seamless navigation between tmux panes and vim splits (!lua)
	{ "jose-elias-alvarez/typescript.nvim" }, -- plugin to write TypeScript
	{ "kevinhwang91/nvim-bqf", ft = "qf" }, -- better quickfix window in Neovim, polish old quickfix windo
	{ "leoluz/nvim-dap-go" }, -- extension for nvim-dap providing configurations for launching go debugger (delve) and debugging individual tests
	{ "m-demare/hlargs.nvim" }, -- highlight arguments' definitions and usages, using treesitter
	{ "mxsdev/nvim-dap-vscode-js" }, -- nvim-dap adapter for vscode-js-debug
	{ "olexsmir/gopher.nvim" }, -- plugin for easy golang development
	{ "onsails/lspkind-nvim" }, -- vscode-like pictograms for neovim lsp completion items
	{ "romgrk/nvim-treesitter-context" }, -- show code context
	{ "simrat39/rust-tools.nvim" }, -- tools for better development in rust using neovim's builtin lsp
	{ "tpope/vim-surround" }, -- quoting/parenthesizing made simple (!lua)

	-- { "mfussenegger/nvim-dap-python" }, -- nvim-dap extension to test and debug python

	{ -- telescope extension to open browser bookmarks
		"dhruvmanila/telescope-bookmarks.nvim",
		dependencies = "kkharji/sqlite.lua",
		config = function()
			local has, telescope = pcall(require, "telescope")
			local ok, _ = pcall(require, "telescope-bookmarks")
			if has and ok then
				telescope.setup({
					extensions = {
						fzf = {
							fuzzy = true, -- false will only do exact matching
							override_generic_sorter = true, -- override the generic sorter
							override_file_sorter = true, -- override the file sorter
							case_mode = "smart_case", -- "ignore_case" or "respect_case"
						},
						bookmarks = {
							debug = false,
							firefox_profile_name = "dev-edition-default",
							selected_browser = "firefox",
							url_open_command = "open",
						},
					},
				})
				telescope.load_extension("bookmarks")
			end
		end,
	},

	{ -- neovim undotree with git diff
		"jiaoshijie/undotree",
		config = function()
			local ok, undotree = pcall(require, "undotree")
			if ok then
				undotree.setup()
			end
		end,
	},

	{ -- atom's one dark theme
		"navarasu/onedark.nvim",
		config = function()
			local ok, onedark = pcall(require, "onedark")
			if ok then
				onedark.setup({
					style = "darker",
				})
				onedark.load()
			end
		end,
	},

	{ -- tree like view for symbols in Neovim using the Language Server Protocol
		"simrat39/symbols-outline.nvim",
		config = function()
			local ok, symbols_outline = pcall(require, "symbols-outline")
			if ok then
				symbols_outline.setup()
			end
		end,
	},

	{ -- highlight, list and search todo comments in your projects
		"folke/todo-comments.nvim",
		config = function()
			local ok, todo = pcall(require, "todo-comments")
			if ok then
				todo.setup()
			end
		end,
	},

	{ -- helps managing crates.io dependencies
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local ok, crates = pcall(require, "crates")
			if ok then
				crates.setup()
			end
		end,
	},

	{ -- find and replace in visual mode
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			local ok, spectre = pcall(require, "spectre")
			if ok then
				spectre.setup()
			end
		end,
	},

	{ -- markdown preview
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{ -- highly performant ui for lsp things
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		config = function()
			local ok, saga = pcall(require, "lspsaga")
			if ok then
				saga.setup({
					code_action_lightbulb = {
						enable = false,
						enable_in_insert = false,
					},
				})
			end
		end,
	},

	-- TODO: testing these plugins

	-- { -- orgmode for neovim
	-- 	"nvim-neorg/neorg",
	-- 	after = "nvim-treesitter",
	-- 	config = function()
	-- 		local ok, neorg = pcall(require, "neorg")
	-- 		if ok then
	-- 			neorg.setup({
	-- 				load = {
	-- 					["core.defaults"] = {},
	-- 					["core.norg.completion"] = {
	-- 						config = {
	-- 							engine = "nvim-cmp",
	-- 						},
	-- 					},
	-- 					["core.norg.dirman"] = {
	-- 						config = {
	-- 							workspaces = {
	-- 								work = "~/notes/work",
	-- 								home = "~/notes/home",
	-- 							},
	-- 						},
	-- 					},
	-- 				},
	-- 			})
	-- 		end
	-- 	end,
	-- },
}
