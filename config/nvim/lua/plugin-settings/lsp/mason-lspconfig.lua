local status_ok, mason_lsp_config = pcall(require, 'mason-lspconfig')
if not status_ok then
  print("mason-lspconfig doesn't load!")
  return
end

-- Enable all servers installed through mason. Per-server settings are in
-- after/lsp/<server>.lua, which nvim merges on top of nvim-lspconfig's defaults.
mason_lsp_config.setup({ automatic_enable = true })
