local h = require('helpers')

vim.diagnostic.config({
  virtual_text = false,
  underline = true,
  severity_sort = true,
  update_in_insert = false,
})

-- Buffer-local keybindings for buffers with a language server attached
local cmds = {
  { 'LspAttach', {
    callback = function(args)
      local opts = { silent = true, buffer = args.buf }
      h.map_keys({
        { 'n', '<Leader>lD', vim.lsp.buf.declaration, opts },
        { 'n', '<Leader>ld', vim.lsp.buf.definition, opts },
        { 'n', '<Leader>lh', vim.lsp.buf.hover, opts },
        { 'n', '<Leader>li', vim.lsp.buf.implementation, opts },
        { 'n', '<Leader>lf', vim.lsp.buf.references, opts },
        { 'n', '<Leader>lt', vim.lsp.buf.type_definition, opts },
      })
    end,
  } },
}
h.create_autocmds('ToeLsp', cmds)
