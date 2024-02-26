local h = require('helpers')

local M = {}

-- Default keybindings
function M.lsp_keybinds()
  local keys = {
    -- LSP Navigation
    { 'n', '<Leader>lD', vim.lsp.buf.declaration },
    { 'n', '<Leader>ld', vim.lsp.buf.definition },
    { 'n', '<Leader>lh', vim.lsp.buf.hover },
    { 'n', '<Leader>li', vim.lsp.buf.implementation },
    { 'n', '<Leader>lf', vim.lsp.buf.references },
    { 'n', '<Leader>lt', vim.lsp.buf.type_definition },
  }
  h.map_keys(keys)
end

-- Default AutoCMDs
function M.lsp_autocmd()
  local cmds = {
    -- { 'CursorHold',  { command = 'Lspsaga show_line_diagnostics' } },
  }
  h.create_autocmds('ToeLsp', cmds)
end

-- Default attach function
function M.default_attach(client)
  M.lsp_keybinds()
  M.lsp_autocmd()

  -- Disable diagnostic virtual text.
  vim.diagnostic.config({
    virtual_text = false,
    underline = true,
    severity_sort = true,
    update_in_insert = false,
  })
end

return M
