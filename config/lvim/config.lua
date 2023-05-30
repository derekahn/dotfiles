--[[

░█████╗░░█████╗░███╗░░██╗███████╗██╗░██████╗░░░░██╗░░░░░██╗░░░██╗░█████╗░
██╔══██╗██╔══██╗████╗░██║██╔════╝██║██╔════╝░░░░██║░░░░░██║░░░██║██╔══██╗
██║░░╚═╝██║░░██║██╔██╗██║█████╗░░██║██║░░██╗░░░░██║░░░░░██║░░░██║███████║
██║░░██╗██║░░██║██║╚████║██╔══╝░░██║██║░░╚██╗░░░██║░░░░░██║░░░██║██╔══██║
╚█████╔╝╚█████╔╝██║░╚███║██║░░░░░██║╚██████╔╝██╗███████╗╚██████╔╝██║░░██║
░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝░╚═════╝░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝

--]]

-- general
lvim.builtin.breadcrumbs.active = true
lvim.builtin.dap.active = true
lvim.colorscheme = "onedark"
lvim.format_on_save.enabled = true
lvim.lint_on_save = true
lvim.log.level = "warn"
lvim.reload_config_on_save = false

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.update_cwd = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.terminal.active = true

local sources = {
	"core.options",
	"core.keymaps",
	"core.autocmds",

	"config/copilot",
	"config/hlargs",
	"config/indentlines",
	"config/inlay-hints",
	"config/lspkind",
	"config/lualine",
	"config/numb",
	"config/spectre",
	"config/telescope",
	"config/treesitter",
	"config/which_key",

	"lsp/go",
	"lsp/javascript",
	-- "lsp/python",
	"lsp/rust",
	"lsp/sh",

	"plugins",
}

for _, source in ipairs(sources) do
	local status_ok, fault = pcall(require, source)
	if not status_ok then
		error("Failed to load source " .. source .. "\n\n" .. fault)
	end
end
