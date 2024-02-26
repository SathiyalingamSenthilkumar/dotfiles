local h = require('helpers')

local M = {}

-- Default keybindings
function M.lsp_keybinds()
  local keys = {
    -- LSP Navigation
    { 'n', '<Leader>nd', vim.lsp.buf.declaration },
    { 'n', '<Leader>ni', vim.lsp.buf.definition },
    { 'n', '<Leader>no', vim.lsp.buf.implementation },
    { 'n', '<Leader>nb', '<C-o>' },

    -- Symbols-Outline
    { 'n', '<Leader>ns', ':SymbolsOutline<CR>' },
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
