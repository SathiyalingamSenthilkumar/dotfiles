local status_ok, mv = pcall(require, 'markview')
if not status_ok then
  return
end

mv.setup({
  preview = {
    icon_provider = 'devicons',
    enable = false, -- plaintext by default, use splitview or toggle to preview
  },
})

local h = require('helpers')
local keys = {
  { 'n', '<Leader>mvt', ':Markview toggle<CR>' },
  { 'n', '<Leader>mvs', ':Markview splitToggle<CR>' },
}
h.map_keys(keys)
