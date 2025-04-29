set noswapfile

setlocal tabstop=2 shiftwidth=2 expandtab
set ts=2 sw=2 sts=2 et

set keyprotocol=alacritty:kitty
set keyprotocol+=xterm:mok2

" Define os caracteres especiais e suas representações
set list

" Space Char
set listchars=tab:»\ ,eol:¬,extends:>,precedes:<,nbsp:_,space:∙,multispace:∙

"" Disable vi compatible
set nocompatible

" Allow file renames from Netrw Directory Listing
set modifiable

" Enable project-specific vimrc
" See https://andrew.stwrt.ca/posts/project-specific-vimrc/
set exrc

" Destaca os caracteres correspondentes á medida que você os digita durante uma busca.
set incsearch
set hlsearch
set showcmd
set showmode

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
let mapleader = "\<Space>"
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Consulte http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
" Não tenho certeza sobre esse combo pelo que li com a ajuda das configurações individuais, mas ei, 
" a resposta tinha 740 upvodes no momento em que este artigo foi escrito
" filetype plugin indent on
set tabstop=2 shiftwidth=2 expandtab

" allow backspacing over everything in insert mode
" set bs=indent,eol,start

" Type-based indentation
set autoindent
set smartindent

autocmd FileType make setlocal noexpandtab

set textwidth=80

" Números de linha relativos, line_number na linha atual, 1 para acima e abaixo, e assim por diante
set relativenumber

" Remova isto para mostrar 0 em vez de line_number na linha atual
set number

filetype plugin on
syntax on

" This will make relative line numbers work on Netrw too
" let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" If the color scheme won't work for some reason, these settings will be applied
" Highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=darkgray
" Highlight extra whitespace(s) at the end of a line
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" Visual mode selection color
hi Visual term=NONE cterm=NONE ctermbg=NONE

" Show page guide at column 80
set colorcolumn=80
"let &colorcolumn=join(range(81,999),",")
"highlight ColorColumn ctermbg=235 guibg=#2c2d27
highlight ColorColumn ctermbg=darkgray

"
" MAPEAMENTO
"
" Mode lines using Option + Cmd + []
let mapleader=" "

vnoremap g[ :m '<-2<CR>gv=gv
vnoremap g] :m '>+1<CR>gv=gv
nnoremap g[ :m .-2<CR>==
nnoremap g] :m .+1<CR>==
" inoremap g] <Esc>:m .+1<CR>==gi
" inoremap g[ <Esc>:m .-2<CR>==gi

" nnoremap <Leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" Mantenha o texto depois da indentation.
vnoremap < <gv
vnoremap > >gv

" Remap ESC and save on pinky travel time :)
" inoremap kk <esc>
" Map <Leader>, to save
nnoremap <C-s> :w<CR>

" -- Move remaps
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Exit insert mode with Ctrl+C
 inoremap <C-c> <Esc>

" Replace text
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Source current file
nnoremap <Leader>r :so<CR>

 "Black hole" register delete
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Greatest remap ever - visual replace without overwriting the clipboard
xnoremap <leader>p "_dP

" Copy visual mode to system clipboard with Ctrl+C
vnoremap <C-c> "+y

" Undotree toggle
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <Leader>gs :Git<CR>

" FZF Maps
nnoremap <silent><leader>l :Buffers<CR>
nnoremap <silent><leader>p :GFiles<CR>
nnoremap <silent><leader>e :Files<CR>
nnoremap <leader>f :Rg<Cr>

 " Comment function to reselect last visual selection and comment
function! ReselectAndComment()
  :Commentary
endfunction

nnoremap g/ :call ReselectAndComment()<CR>
" inoremap g/ <Esc>:call ReselectAndComment()<CR>i
vnoremap g/ :Commentary<Bar>normal! gv<CR>

call plug#begin()
Plug 'junegunn/vim-plug'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'arzg/vim-colors-xcode'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'tpope/vim-fugitive'
" Install latest fzf as part of installing/updating the plugin
" See https://github.com/junegunn/fzf.vim/issues/1134#issuecomment-2186171167
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Languages
" Plug 'vim-ruby/vim-ruby'

call plug#end()

"
" Spell checking settings
"
" Custom words list. Quite useful when working in tech because Vim doesn't
" know a lot of the names we use.
set spellfile=$HOME/.vim/spell/custom-spell.utf-8.add
" I haven't figured out a way to have good spell checking for code, so for now
" only check spelling on 'text' files
"
" TODO: extract lang value in a constant
au BufRead,BufNewFile *.md setlocal spell spelllang=en_us
" Check spelling on commit messages too
au BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us

" Complete for insertion mode CTRL-Nou CTRL-P
set complete+=kspell

"
" Files Type
"
" Highlight Podfile, Fatfile, etc. as a Ruby file
au BufRead,BufNewFile Podfile,Fastfile,AppFile,Deliverfile,Matchfile,Snapfile,Pluginfile,Dangerfile set filetype=ruby
" Highlight Pods.WORKSPACE as a Starlark file
au BufRead,BufNewFile Pods.WORKSPACE set filetype=starlark

" Prettier formatter configuration
"autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

" Netrw settings
"
" no banner
let g:netrw_banner=0
" tree style
let g:netrw_liststyle=3

"
" Custom Commands
"
com! FormatJSON %!python -m json.tool

" configure comments in vimcript
" autocmd FileType vimscript setlocal commentstring="\ %s

"
" Theme
"
" set∙background=dark
hi Normal guibg=NONE ctermbg=NONE
colorscheme xcodedarkhc
