-- Bootstrap packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!mkdir -p ' .. install_path)
	execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local packer = require('packer')
local v = require('utils')

-- Install Plugins
packer.startup(function()
	use {'wbthomason/packer.nvim'}
	use {'nvim-lua/plenary.nvim'}

	-- aesthetics
	use {'kyazdani42/nvim-web-devicons'} -- Web devicons for neovim
	use {
		'navarasu/onedark.nvim', -- Atom's One Dark and Light theme
		style = 'darker',
		config = 'vim.cmd[[colorscheme onedark]]'
	}

	-- editing
	use {'tpope/vim-surround'} -- Quoting/parenthesizing made simple
	use {'preservim/nerdcommenter'} -- Toggle comment
	use {'jiangmiao/auto-pairs'} -- Auto close brackets, parenthesis etc
	use {'tpope/vim-abolish'}	-- Case coercion

	-- utils
	use {'christoomey/vim-tmux-navigator'} -- Seamless navigation between tmux panes and vim splits
	use {'troydm/zoomwintab.vim'} -- Zoom in/out of windows
end)
