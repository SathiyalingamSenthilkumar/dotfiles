local status_ok, nt = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

local h = require('helpers')
local keys = {
  { 'n', '<Leader>nt', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>' },
}
h.map_keys(keys)

nt.setup({
  git = {
    enable = true,
    ignore = false,
    timeout = 500
  },
  view = {
    width = 35,
    side = 'left',
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
      },
    },
  },
})
