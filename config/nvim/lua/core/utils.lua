local M = {}

local g = vim.g

function M.bootstrap()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    print "Cloning packer...\nSetup dotfiles/config/nvim"
    vim.cmd [[packadd packer.nvim]]
  end
end

function M.disabled_builtins()
  g.loaded_gzip = false
  g.loaded_netrwPlugin = false
  g.loaded_netrwSettngs = false
  g.loaded_netrwFileHandlers = false
  g.loaded_tar = false
  g.loaded_tarPlugin = false
  g.zipPlugin = false
  g.loaded_zipPlugin = false
  g.loaded_2html_plugin = false
  g.loaded_remote_plugins = false
end

function M.impatient()
  local impatient_ok, _ = pcall(require, "impatient")
  if impatient_ok then
    require("impatient").enable_profile()
  end
end


local setting = require("core.settings")
function M.compiled()
  local run_me, _ = loadfile(setting.packer_file)
  if run_me then
    run_me()
  else
    print "Please run :PackerSync"
  end
end

return M
