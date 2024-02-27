local mason_lsp_config_status_ok, mason_lsp_config = pcall(require, 'mason-lspconfig')
if not mason_lsp_config_status_ok then
  print("mason-lspconfig doesn't load!")
  return
end

mason_lsp_config.setup()

-- Refer `:h mason-lspconfig-automatic-server-setup` for automatic configuration
local lsp_config_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_config_status_ok then
  print("lspconfig doesn't load!")
  return
end

local common = require('plugin-settings.lsp.server-settings.common_functions')
local default_setup = {
  on_attach = common.default_attach
}

require("mason-lspconfig").setup_handlers {
  function (server_name)
    local status_ok, cfg = pcall(require, 'plugin-settings.lsp.server-settings.' .. server_name)
    if not status_ok then
      cfg = default_setup
    end
    lspconfig[server_name].setup(cfg)
  end
}
