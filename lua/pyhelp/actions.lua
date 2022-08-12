local actions = {}

actions.open_docs = function(root_dir, split, corresponding, filesub_fn)
  local path = vim.api.nvim_buf_get_name(0)
  local parent = vim.fs.dirname(path)
  local filename = string.gsub(path, parent .. "/", "")

  -- disable for setup file
  if filename == "setup.py" then
    vim.notify("Disabled for setup.py")
    return
  end

  -- disable for dunder files
  if vim.startswith(filename, "__") then
    vim.notify("Disabled for dunder files.")
    return
  end

  -- relative = /<libname>/<module>/<submodule>/.../<name.py>
  local relative = string.gsub(parent, root_dir .. "/", "")
  local parts = vim.split(relative, "/")
  local rest = ""
  for i, part in ipairs(parts) do
    if i > 1 then
      rest = rest .. "/" .. part
    end
  end

  -- doc = /docs/source/<module>/<submodule>/.../<name.md>
  local docparent = root_dir .. corresponding .. rest
  local docfile = docparent .. "/" .. filesub_fn(filename)

  -- mkdir with parents
  vim.cmd("silent!mkdir -p " .. docparent, { silent = true })

  -- open in split
  vim.cmd(split .. " " .. docfile)
end

return actions
