
local h = require('helpers')
local keys = {
  { 'n', '<Leader>mp', ':MarkdownPreview<CR>' },
  { 'n', '<Leader>mps', ':MarkdownPreviewStop<CR>' },
  { 'n', '<Leader>mpt', ':MarkdownPreviewToggle<CR>' },
}
h.map_keys(keys)
