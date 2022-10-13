local M = {}

function M.setup()
	local icons = require("core.icons")
	local signs = {
		{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
		{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
		{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
		{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = true,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

local function lsp_keymaps(bufnr)
	local keymap = vim.api.nvim_buf_set_keymap
	local opts = { noremap = true, silent = true }

	keymap(bufnr, "n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "gs", "<CMD>lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap(bufnr, "n", "gI", "<CMD>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gt", "<CMD>lua vim.lsp.buf.type_definition()<CR>", opts)

	keymap(bufnr, "n", "gh", "<CMD>Lspsaga lsp_finder<CR>", opts)
	keymap(bufnr, "n", "gr", "<CMD>Lspsaga rename<CR>", opts)
	keymap(bufnr, "n", "gl", "<CMD>Lspsaga code_action<CR>", opts)
	keymap(bufnr, "n", "g;", ":<c-u>Lspsaga range_code_action<CR>", opts)
	keymap(bufnr, "n", "K", "<CMD>Lspsaga hover_doc<CR>", opts)
	keymap(bufnr, "n", "gdd", "<CMD>Lspsaga show_line_diagnostics<CR>", opts)
	keymap(bufnr, "n", "gj", "<CMD>Lspsaga diagnostic_jump_next<CR>", opts)
	keymap(bufnr, "n", "gk", "<CMD>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap(bufnr, "n", "<C-u>", "<CMD>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<CR>", {})
	keymap(bufnr, "n", "<C-d>", "<CMD>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<CR>", {})

	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.document_formatting = false
	end
	if client.name == "jsonls" then
		client.server_capabilities.document_formatting = false
	end
	if client.name == "html" then
		client.server_capabilities.document_formatting = false
	end
	if client.name == "sumneko_lua" then
		client.server_capabilities.document_formatting = false
	end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
