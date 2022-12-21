local ok, telescope = pcall(require, "telescope")
local builtin = require("telescope.builtin")
local nnoremap = require("kaspar.keymap").nnoremap

if not ok then
    return
end

telescope.setup()
telescope.load_extension("fzf")

nnoremap("<leader>ff", builtin.find_files)
