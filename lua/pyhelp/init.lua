local M = {}

M.setup = function(config)
  if not config then
    config = {}
  else
    -- Immediately quit if not needed without loading anything
    if not config.enabled then
      return
    end

    -- 1. is it python file?
    if not CE(config.filetypes, vim.bo.filetype) then
      return
    end
  end

  -- Actual init
  require("pyhelp.globals")

  -- start off with defaults
  local defaults = require("pyhelp.config")
  for k, v in pairs(defaults) do
    M[k] = v
  end

  -- is it 'project' dir?
  local root_dir = (vim.fs.dirname(vim.fs.find(M.root_pattern, { upward = true })[1]))
  if not root_dir then
    return
  end
  M.root_dir = root_dir

  -- use config where available
  for k, v in pairs(config) do
    M[k] = v
  end

  -- add the actions
  vim.notify("pyhelp is here.")
  local actions = require("pyhelp.actions")

  M.open_docs = function()
    actions.open_docs(M.root_dir, M.split, "/docs/source", function(filename)
      return string.gsub(filename, ".py", ".rst")
    end)
  end

  M.open_tests = function()
    -- actions.open_tests(M.root_dir, M.split)
    actions.open_docs(M.root_dir, M.split, "/tests", function(filename)
      return "test_" .. filename
    end)
  end

  -- 4. set the mappings
  for k, v in pairs(M.mappings.nmaps) do
    vim.api.nvim_set_keymap("n", k, ':lua require"pyhelp".' .. v .. "<cr>", {
      noremap = true,
      silent = true,
    })
  end

  for k, v in pairs(M.mappings.imaps) do
    vim.api.nvim_set_keymap("i", k, '<Esc>:lua require"pyhelp".' .. v .. "<cr>", {
      noremap = true,
      silent = true,
    })
  end
end

return M
