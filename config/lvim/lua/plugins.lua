lvim.plugins = {
	{ "christoomey/vim-tmux-navigator" }, -- seamless navigation between tmux panes and vim splits
	{ "kevinhwang91/nvim-bqf", ft = "qf" }, -- better quickfix window in Neovim, polish old quickfix windo
	{ "onsails/lspkind-nvim" }, -- vscode-like pictograms for neovim lsp completion items
	{ "romgrk/nvim-treesitter-context" }, -- show code context
	{ "tpope/vim-abolish" }, -- case coercion (!lua)
	{ "tpope/vim-surround" }, -- quoting/parenthesizing made simple (!lua)

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

	{ -- highlight arguments' definitions and usages, using treesitter
		"m-demare/hlargs.nvim",
		config = function()
			local ok, hlargs = pcall(require, "hlargs")
			if ok then
				hlargs.setup({
					color = "#dd636e",
					highlight = {},
					excluded_filetypes = {},
					paint_arg_declarations = true,
					paint_arg_usages = true,
					paint_catch_blocks = {
						declarations = false,
						usages = false,
					},
					extras = {
						named_parameters = false,
					},
					hl_priority = 10000,
				})
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

	{ -- tools for better development in rust using neovim's builtin lsp
		"simrat39/rust-tools.nvim",
		config = function()
			local ok, rt = pcall(require, "rust-tools")
			if ok then
				rt.setup({
					server = {
						standalone = true,
						["rust-analyzer"] = {
							checkOnSave = {
								command = "clippy",
							},
						},
					},
				})
			end
		end,
	},

	{ -- helps managing crates.io dependencies
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("crates").setup()
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
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{ -- highly performant ui for lsp things
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			local ok, saga = pcall(require, "lspsaga")
			if ok then
				saga.init_lsp_saga({
					code_action_lightbulb = {
						enable = false,
						enable_in_insert = false,
					},
				})
			end
		end,
	},

	{ -- telescope extension to open browser bookmarks
		"dhruvmanila/telescope-bookmarks.nvim",
		requires = {
			"kkharji/sqlite.lua",
		},
		config = function()
			local ok, telescope = pcall(require, "telescope")
			if ok then
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

	-- { -- run lines/blocs of code (independently of the rest of the file)
	-- 	"michaelb/sniprun",
	-- 	run = "bash ./install.sh",
	-- 	config = function()
	-- 		local ok, sniprun = pcall(require, "sniprun")
	-- 		if ok then
	-- 			sniprun.setup({
	-- 				display = {
	-- 					"Terminal",
	-- 				},
	-- 			})
	-- 		end
	-- 	end,
	-- },
}
