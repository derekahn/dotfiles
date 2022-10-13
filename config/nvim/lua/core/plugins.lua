local M = {}

local packer_status_ok, packer = pcall(require, "packer")
if not packer_status_ok then
	return
end

local plugins = {
	{ "wbthomason/packer.nvim" }, -- have packer manage itself

	{ "nvim-lua/plenary.nvim" }, -- useful lua functions used ny lots of plugins
	{ "lewis6991/impatient.nvim" }, -- improve startup time for neovim

	-- aesthetics
	{
    "navarasu/onedark.nvim", -- atom's one dark and light theme
    config = "vim.cmd[[colorscheme onedark]]",
	},

	{ "goolord/alpha-nvim" }, -- greeter like vim-startify
	{ "kyazdani42/nvim-web-devicons" }, -- dev icons
	{
		"kyazdani42/nvim-tree.lua", -- a file explorer tree
		commit = "2e1f82d8c0c57cbc2bfdc041a3aff26947559a1e",
	},
	{ "ahmedkhalf/project.nvim" }, -- fuzzy finder for projects
	{ "akinsho/bufferline.nvim" }, -- a snazzy bufferline
	{ "nvim-lualine/lualine.nvim" }, -- statusline

	-- cmp plugins
	{ "hrsh7th/cmp-buffer" }, -- buffer completions
	{ "hrsh7th/cmp-cmdline" }, -- cmdline completions
	{ "hrsh7th/cmp-emoji" }, -- nvim-cmp source for emoji
	{ "hrsh7th/cmp-nvim-lsp" }, -- nvim-cmp source for neovim builtin LSP client
	{ "hrsh7th/cmp-path" }, -- path completions
	{ "hrsh7th/nvim-cmp" }, -- completion plugin
	{ "f3fora/cmp-spell" }, -- spell source for nvim-cmp

	-- snippets
	{ "L3MON4D3/LuaSnip" }, -- snippet engine
	{ "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use
	{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions

	-- lsp
	{ "jose-elias-alvarez/null-ls.nvim" }, -- for formatters and linters
	{ "neovim/nvim-lspconfig" }, -- enable lsp
	{ "tamago324/nlsp-settings.nvim" }, -- language server settings defined in json for
	{ "williamboman/mason.nvim" }, -- simple to use language server installer
  { "williamboman/mason-lspconfig.nvim" }, -- extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
	{ "tami5/lspsaga.nvim" }, -- the neovim language-server-client UI
  { "simrat39/rust-tools.nvim" }, -- tools for better development in rust using neovim's builtin lsp

	-- ide
	{ "JoosepAlviste/nvim-ts-context-commentstring" }, -- empowers treesitter
  { "m-demare/hlargs.nvim" }, -- highlight arguments' definitions and usages, using treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		requires = {
			{ "romgrk/nvim-treesitter-context" },
		},
		run = ":TSUpdate",
	},

	-- HUD
	{ "akinsho/toggleterm.nvim" }, -- easily manage multiple terminal windows
	{ "folke/trouble.nvim" }, --  pretty diagnostics
	{ "folke/which-key.nvim" }, -- keybindings and help modal
	{ "lewis6991/gitsigns.nvim" }, -- like gitgutter
	{ "lukas-reineke/indent-blankline.nvim" }, -- indent guides
	{ "kevinhwang91/nvim-bqf", ft = "qf" }, -- better quickfix window in neovim
	{
		"nvim-telescope/telescope.nvim", -- fuzzy finder with preview
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "dhruvmanila/telescope-bookmarks.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
	},

	-- editing
	{ "numToStr/Comment.nvim" }, -- toggle comment
	{ "tpope/vim-abolish" }, -- case coercion (!lua)
	{ "tpope/vim-repeat" }, -- enable repeating supported plugin maps (!lua)
	{ "tpope/vim-surround" }, -- quoting/parenthesizing made simple (!lua)
	{ "windwp/nvim-autopairs" }, -- autopairs, integrates with both cmp and treesitter
	{ "RRethy/vim-illuminate" }, -- automatically highlighting other uses of the word under the cursor using either lsp, tree-sitter, or regex matching.

	-- utils
	{ "christoomey/vim-tmux-navigator" }, -- seamless navigation between tmux panes and vim splits
	{ "famiu/bufdelete.nvim" }, -- delete Neovim buffers without losing window layout
	{
		"nvim-neorg/neorg", -- note taking
		requires = "nvim-lua/plenary.nvim",
	},
}

local setting = require("core.settings")

packer.startup({
	function(use)
		for _, plugin in pairs(plugins) do
			use(plugin)
		end
	end,

	config = {
		compile_path = setting.packer_file,
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
		profile = {
			enable = true,
			threshold = 0.0001,
		},
		git = {
			clone_timeout = 300,
		},
		auto_clean = true,
		compile_on_sync = true,
	},
})

-- enables install on save
if PACKER_BOOTSTRAP then
	require("packer").sync()
end

return M
