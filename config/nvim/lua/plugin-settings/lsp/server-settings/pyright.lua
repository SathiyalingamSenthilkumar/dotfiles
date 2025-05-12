local common = require("plugin-settings.lsp.server-settings.common_functions")

return {
  on_attach = common.default_attach,
  root_markers = { '.git' },
}
