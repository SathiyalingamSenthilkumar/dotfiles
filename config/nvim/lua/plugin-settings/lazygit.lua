local h = require('helpers')

local keys = {
  { 'n', '<Leader>lg', ':LazyGit<CR>' },
  { 'n', '<Leader>lgcf', ':LazyGitCurrentFile<CR>' },
  { 'n', '<Leader>lgf', ':LazyGitFilter<CR>' },
  { 'n', '<Leader>lgff', ':LazyGitFilterCurrentFile<CR>' },
  { 'n', '<Leader>lgl', ':LazyGitLog<CR>' },
}

h.map_keys(keys)
