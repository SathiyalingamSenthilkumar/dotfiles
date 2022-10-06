local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
  return
end

bufferline.setup({
  options = {
    numbers = 'none',
    max_name_length = 30,
    max_prefix_length = 30,
    diagnostics = false,
  }
})

local h = require('helpers')
local keys = {
  -- For moving buffers
  { 'n', '<leader>bm', ':BufferLineMoveNext<CR>' },
  { 'n', '<leader>bM', ':BufferLineMovePrev<CR>' },

  -- For jumping to buffers
  { 'n', '<leader>b1', ':BufferLineGoToBuffer 1<CR>' },
  { 'n', '<leader>b2', ':BufferLineGoToBuffer 2<CR>' },
  { 'n', '<leader>b3', ':BufferLineGoToBuffer 3<CR>' },
  { 'n', '<leader>b4', ':BufferLineGoToBuffer 4<CR>' },
  { 'n', '<leader>b5', ':BufferLineGoToBuffer 5<CR>' },
  { 'n', '<leader>b6', ':BufferLineGoToBuffer 6<CR>' },
  { 'n', '<leader>b7', ':BufferLineGoToBuffer 7<CR>' },
  { 'n', '<leader>b8', ':BufferLineGoToBuffer 8<CR>' },
  { 'n', '<leader>b9', ':BufferLineGoToBuffer 9<CR>' }
}
h.map_keys(keys)
