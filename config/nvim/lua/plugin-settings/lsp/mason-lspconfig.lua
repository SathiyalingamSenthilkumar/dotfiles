local mason_lsp_config_status_ok, mason_lsp_config = pcall(require, 'mason-lspconfig')
if not mason_lsp_config_status_ok then
  print("mason-lspconfig doesn't load!")
  return
end

mason_lsp_config.setup({automatic_enable = false})

local common = require('plugin-settings.lsp.server-settings.common_functions')
local default_setup = {
  on_attach = common.default_attach
}

for _, server_name in ipairs(mason_lsp_config.get_installed_servers()) do
    local status_ok, cfg = pcall(require, 'plugin-settings.lsp.server-settings.' .. server_name)
    if not status_ok then
      cfg = default_setup
    end
    vim.lsp.config(server_name, cfg)
    vim.lsp.enable(server_name)
end
