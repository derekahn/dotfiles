local utils = require "core.utils"

utils.disabled_builtins()
utils.bootstrap()
utils.impatient()

local sources = {
  "core.autocmds",
  "core.keymaps",
  "core.options",
  "core.plugins",
  "lsp",
}

for _, source in ipairs(sources) do
  local status_ok, fault = pcall(require, source)
  if not status_ok then
    error("Failed to load source " .. source .. "\n\n" .. fault)
  end
end

local plugins = {
  -- aesthetics
  "config.alpha",
  "config.bufferline",
  "config.lualine",
  "config.nvim-tree",
  "config.project",
  "config.whichkey",

  -- hud
  "config.gitsigns",
  "config.indent-blankline",
  "config.telescope",
  "config.toggleterm",
  "config.trouble",

  -- edit
  "config.autopairs",
  "config.comment",
  "config.illuminate",
  "config.neorg",
  "config.rust-tools",

  -- syntax
  "config.cmp",
  "config.treesitter-textobjects",
  "config.treesitter",
  "config.hlargs",
}

for _, plugin in ipairs(plugins) do
  local status_ok, fault = pcall(require, plugin)
  if not status_ok then
    error("Failed to load plugin " .. plugin .. "\n\n" .. fault)
  end
end

-- keep this last:
utils.compiled()
