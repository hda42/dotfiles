set number
set cursorline          
set expandtab
set smarttab
set nowrap             
set ignorecase
set smartcase
set clipboard=unnamedplus

syntax on
packloadall

noremap A $
noremap nn diw
nnoremap <Space>k :Ex<CR>

nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d


inoremap kk <ESC>

packadd! onedark.vim

inoremap " ""<left>
inoremap ' ''<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

:set tabstop=2
:set shiftwidth=2
:set expandtab
:set whichwrap+=<,> 
:set virtualedit=all
"set timeout timeoutlen=150

augroup InsertMode
  autocmd!
  autocmd InsertEnter * set timeout timeoutlen=190
  autocmd InsertLeave * set timeout timeoutlen=1000
augroup EN
