local common = require('plugin-settings.lsp.server-settings.common_functions')

local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  print("lspconfig doesn't load!")
  return
end

local servers = {
  "clangd",                 -- C/C++
  "lua_ls",                 -- Lua
  "pyright",                -- Python
}

local default_setup = {
  on_attach = common.default_attach
}

for _, server in ipairs(servers) do
    local cfg_ok, cfg = pcall(require, 'plugin-settings.lsp.server-settings.' .. server)
    if not cfg_ok then
      cfg = default_setup
    end

    lspconfig[server].setup(cfg)
end
