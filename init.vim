let mapleader = "\<space>"
set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set background=dark

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rwxmad/spacecat.nvim'
Plug 'tiagovla/tokyodark.nvim'
call plug#end()

let g:tokyodark_transparent_background = 0
let g:tokyodark_enable_italic_comment = 1
let g:tokyodark_enable_italic = 1
let g:tokyodark_color_gamma = "1.0"

set termguicolors
colorscheme tokyodark

" Remaps
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <C-k> :cnext<CR>
nnoremap <C-j> :cprev<CR>
vnoremap <leader>p "_dP
vnoremap <leader>y "+y
noremap <leader>y "+y
noremap <leader>Y gg"+yG

vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>
nnoremap <silent> <leader>x <cmd>!chmod +x %<CR>
