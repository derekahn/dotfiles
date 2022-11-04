lvim.plugins = {
	{ "christoomey/vim-tmux-navigator" }, -- seamless navigation between tmux panes and vim splits
	{ "tpope/vim-surround" }, -- quoting/parenthesizing made simple (!lua)
	{ "tpope/vim-abolish" }, -- case coercion (!lua)
	{ "romgrk/nvim-treesitter-context" }, -- show code context
	{ "kevinhwang91/nvim-bqf", ft = "qf" }, -- better quickfix window in Neovim, polish old quickfix windo

	{ --  neovim undotree
		"jiaoshijie/undotree",
		config = function()
			local ok, undotree = pcall(require, "undotree")
			if ok then
				undotree.setup()
			end
		end,
	},

	{ -- a tree like view for symbols in Neovim using the Language Server Protocol
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	},

	{ -- atom's one dark and light theme
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

	{ -- highlight, list and search todo comments in your projects
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

	{ -- find and replace
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			local ok, spectre = pcall(require, "spectre")
			if ok then
				spectre.setup()
			end
		end,
	},

	{ -- A Neovim Telescope extension to open your browser bookmarks right from the editor
		"dhruvmanila/telescope-bookmarks.nvim",
		requires = {
			"kkharji/sqlite.lua",
		},
		config = function()
			local ok, telescope = pcall(require, "telescope")
			if ok then
				telescope.setup({
					extensions = {
						bookmarks = {
							debug = false,
							firefox_profile_name = "dev-edition-default",
							selected_browser = "firefox",
							url_open_command = "open",
						},
					},
				})
			end
		end,
	},

	{ -- orgmode for neovim
		"nvim-neorg/neorg",
		config = function()
			local ok, neorg = pcall(require, "neorg")
			if ok then
				neorg.setup({
					load = {
						["core.defaults"] = {},
						["core.norg.dirman"] = {
							config = {
								workspaces = {
									work = "~/notes/work",
									home = "~/notes/home",
								},
							},
						},
					},
				})
			end
		end,
	},

	{ -- markdown preview plugin for (neo)vim
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{ -- A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI
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
}
