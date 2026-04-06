local status_ok, nt = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

local h = require('helpers')
local keys = {
  { 'n', '<Leader>nt', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>' },
}
h.map_keys(keys)

local g = {
  loaded_netrw = 1,
  loaded_netrwPlugin = 1,
}
h.set_globals(g)

nt.setup({
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    git_ignored = false,
  },
})
