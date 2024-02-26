local status_ok, lspsaga = pcall(require, 'lspsaga')
if not status_ok then
  print("lspsaga doesn't load!")
  return
end

lspsaga.setup({})

local h = require('helpers')
local keys = {
  { 'n', '<Leader>lsa', ':Lspsaga code_action<CR>' },
  { 'n', '<Leader>lsd', ':Lspsaga hover_doc<CR>' },
  { 'n', '<Leader>lsr', ':Lspsaga rename<CR>' },
  { 'n', '<Leader>lsf', ':Lspsaga finder<CR>' },
  { 'n', '<Leader>ls?', ':Lspsaga show_line_diagnostics<CR>' },
  { 'n', '<Leader>lso', ':Lspsaga outline<CR>' },
}
h.map_keys(keys)
