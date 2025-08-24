set number relativenumber
inoremap jj <Esc>
command! Vimrc edit $MYVIMRC
command! ReloadVimrc source $MYVIMRC | echo "Vimrc reloaded!"

call plug#begin()
Plug 'martinsione/darkplus.nvim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'kdheepak/lazygit.nvim'
Plug 'nvim-tree/nvim-tree.lua'
call plug#end()

lua require('theme_switcher').apply_theme()

"lualine config
lua << EOF
require('lualine').setup {
  options = {
    theme = 'auto',
    icons_enabled = true,
    component_separators = '' ,
    section_separators = '' ,
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  }
}
EOF

" Telescope
lua << EOF
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
EOF


" lazygit
nnoremap <leader>gg :LazyGit<CR>

" nvim-tree setup
lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
    side = "left",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF
nnoremap <C-n> :NvimTreeToggle<CR>
