local status_ok, t = pcall(require, 'telescope')
if not status_ok then
  return
end

local lga_actions = require('telescope-live-grep-args.actions')

t.setup({
  extensions = {
    -- Pass ripgrep args in the prompt, e.g. `foo -g !build/**`
    live_grep_args = {
      auto_quoting = true,
      mappings = {
        i = {
          -- Quote the prompt and start a glob: `!dir/**` excludes, `dir/**` includes
          ['<C-g>'] = lga_actions.quote_prompt({ postfix = ' -g ' }),
          ['<C-k>'] = lga_actions.quote_prompt(),
        },
      },
    },
  },
})

t.load_extension('live_grep_args')

local h = require('helpers')
local keys = {
  { 'n', '<Leader>tt', ':Telescope<CR>' },
  { 'n', '<Leader>tg', ':Telescope live_grep_args<CR>' },
  { 'n', '<Leader>tf', ':Telescope git_files<CR>' },
  { 'n', '<Leader>tF', ':Telescope find_files<CR>' },
  { 'n', '<Leader>tb', ':Telescope git_branches<CR>' },
}
h.map_keys(keys)
