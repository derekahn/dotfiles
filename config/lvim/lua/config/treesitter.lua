local treesitter = lvim.builtin.treesitter

treesitter.ensure_installed = {
	"bash",
	"css",
	"go",
	"javascript",
	"json",
	"lua",
	"python",
	"rust",
	"tsx",
	"typescript",
	"yaml",
}

treesitter.ignore_install = {
	"haskell",
	"java",
}

treesitter.highlight.enabled = true
