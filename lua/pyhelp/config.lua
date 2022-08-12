local defaults = {

  -- essential Defaults
  name = "pyhelp",
  filetypes = { "python" },
  root_pattern = { ".git", "setup.py" },
  enabled = true,

  -- appearance
  split = "sp", -- "vsp", "e"

  -- extra defaults
  mappings = {
    nmaps = {
      ["<C-h>d"] = "open_docs()",
      ["<C-h>t"] = "open_tests()",
    },

    imaps = {
      -- ["<C-h>i"] = "add_note()",
    },
  },
}

return defaults
