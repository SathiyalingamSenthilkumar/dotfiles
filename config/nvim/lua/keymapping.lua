local h = require('helpers')

local g = {
  mapleader = ' ',
  maplocalleader = ' ',
}
h.set_globals(g)

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

local n_keys = {
  -- Set space as leader
  { '', '<Space>', '<Nop>' },

  -- No prefix bindings
  -- Buffer handling
  { 'n', '<Tab>',     ':bnext<CR>' },
  { 'n', '<S-Tab>',   ':bprev<CR>' },

  -- Buffer deletion (vim-bbye plugin)
  { 'n', '<Leader>c', ':Bdelete<CR>' },

  -- Prefixed bindings
  -- Splitting, Prefix: <Leader>s
  { '',  's',          '<nop>' },
  { 'n', '<Leader>ss', ':split<CR>' },
  { 'n', '<Leader>sv', ':vsplit<CR>' },
  { 'n', '<Leader>se', ':wincmd =' },

  -- Window selection
  { 'n', '<Leader>h',  '<C-w>h' }, -- Left
  { 'n', '<Leader>j',  '<C-w>j' }, -- Down
  { 'n', '<Leader>k',  '<C-w>k' }, -- Up
  { 'n', '<Leader>l',  '<C-w>l' }, -- Right

  -- Window resize with arrows
  { 'n', '<Leader><Up>',    ':resize -5<CR>' },
  { 'n', '<Leader><Down>',  ':resize +5<CR>' },
  { 'n', '<Leader><Left>',  ':vertical resize -5<CR>' },
  { 'n', '<Leader><Right>', ':vertical resize +5<CR>' },
}

local v_keys = {
  -- Indentation re-select
  { 'v', '<', '<gv' },
  { 'v', '>', '>gv' },
}

h.map_keys(n_keys)
h.map_keys(v_keys)
