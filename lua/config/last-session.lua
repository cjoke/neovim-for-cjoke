local executeCommand = vim.cmd
local callFunction = vim.fn

local SessionManager = {}

local function getSessionFilePath()
  local workingDirectory = callFunction.getcwd()
  return workingDirectory .. "/Session.vim"
end

function SessionManager.saveCurrentSession()
  executeCommand("mksession! " .. getSessionFilePath())
end

function SessionManager.restoreLastSession()
  if callFunction.filereadable(getSessionFilePath()) == 1 then
    executeCommand("source " .. getSessionFilePath())
  else
    print("No session file found. Starting Neovim as usual.")
  end
end

function SessionManager.setupSessionManager()
  executeCommand("command! -nargs=0 SaveSession lua require('config.last-session').saveCurrentSession()")
  executeCommand("command! -nargs=0 LoadSession lua require('config.last-session').restoreLastSession()")

  executeCommand("autocmd VimLeave * SaveSession")

  -- Check if Neovim was invoked with "load" as the first argument
  --
  if vim.fn.argv(0) == "load" then
    -- Remove "load" from the argument list
    table.remove(vim.fn.argv(), 1)
    -- Load the session after VimEnter event to ensure that all plugins and color schemes are loaded
    -- executeCommand("autocmd VimEnter * LoadSession")
  end
end

return SessionManager
