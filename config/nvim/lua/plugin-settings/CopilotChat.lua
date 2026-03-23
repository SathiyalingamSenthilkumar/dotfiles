local status_ok, copilot_chat = pcall(require, 'CopilotChat')
if not status_ok then
  print('CopilotChat does not load!')
  return
end

copilot_chat.setup(
{
  headers = {
    user = '👤 You',
    assistant = '🤖 Copilot',
    tool = '🔧 Tool',
  },
}
)


local h = require('helpers')
local keys = {
    { 'n', '<Leader>cct', ":CopilotChatToggle<CR>" },
    { 'n', '<Leader>ccr', ":CopilotChatReset<CR>" },
    { 'n', '<Leader>ccs', ":CopilotChatSave<CR>" },
    { 'n', '<Leader>ccl', ":CopilotChatLoad<CR>" },
    { 'n', '<Leader>ccp', ":CopilotChatPrompts<CR>" },
    { 'n', '<Leader>ccm', ":CopilotChatModels<CR>" },
}
h.map_keys(keys)
