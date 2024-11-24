local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup{
  defaults = {
    -- Puedes añadir configuraciones por defecto aquí si lo deseas
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
}

vim.keymap.set('n', '<C-p>', function()
  builtin.find_files()
end, {})
