"                                 (_)               
"  _ .--.  .---.   .--.   _   __  __   _ .--..--.   
" [ `.-. |/ /__\\/ .'`\ \[ \ [  ][  | [ `.-. .-. |  
"  | | | || \__.,| \__. | \ \/ /  | |  | | | | | |  
" [___||__]'.__.' '.__.'   \__/  [___][___||__||__] 
"                                                  
" Date: 10th December 2021
" Desc: My (sorta) lightweight nvim conf


" ==> Setters <==
set number			" - Enables line numbering 
set noshowmode			" - Removes unnessecary mode descriptor
set clipboard+=unnamedplus	" - Use sytem clipboard


" ==> Plugins <==

" Using vim-plug plugin manager. Appropriate repo found at:
" https://github.com/junegunn/vim-plug
call plug#begin()

" Srcery -- Dark theme w/an earthy tone
Plug 'srcery-colors/srcery-vim'

" Vim Startify -- Dynamic start screen when running "nvim"
" Further customization with ":h startify" or ":h startify-faq"
Plug 'mhinz/vim-startify'

" Vim-TOML -- A TOML syntax highlighter 
Plug 'cespare/vim-toml' 

" Asynchronous Light Engine -- Linting, code completion, 
Plug 'dense-analysis/ale' " and more

" Rust language syntax highlighting
Plug 'rust-lang/rust.vim'

" Lightling -- A solid status bar plugin
Plug 'itchyny/lightline.vim'

call plug#end()


" ==> Basic Setup <==

" Required by: 'rust-lang/rust.vim'
syntax enable
filetype plugin indent on

" ==> Asynchronous Light Engine <==

" ~~ ALE ~~
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '-'

" ~ fixers ~
let g:ale_fixers = {'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines']}

" ~ linters ~
let g:ale_linters = {'rust': ['rls']}

" ~ navigation ~
nmap <silent> <leader>d :ALEGoToDefinition<CR>
nmap <silent> <leader>r :ALEFindReferences<CR>

" ==> Colorscheme <==
colorscheme srcery
