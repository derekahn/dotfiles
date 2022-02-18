local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  return
end

require 'cybernaut.lsp.lsp-installer'
require('cybernaut.lsp.handlers').setup()
require 'cybernaut.lsp.null-ls'
