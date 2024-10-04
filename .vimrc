filetype plugin on
setlocal tabstop=2 shiftwidth=2 expandtab
set ts=2 sw=2 sts=2 et

let mapleader=","

" Define os caracteres especiais e suas representações
set list

" Space Char
set listchars=tab:»\ ,eol:¬,extends:>,precedes:<,nbsp:_,space:∙,multispace:∙
syntax on

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

vnoremap <Leader>[ :m '<-2<CR>gv=gv
nnoremap <Leader>[ :m .-2<CR>==
nnoremap <Leader>] :m .+1<CR>==
vnoremap <Leader>] :m '>+1<CR>gv=gv
inoremap <Leader>] <Esc>:m .+1<CR>==gi
inoremap <Leader>[ <Esc>:m .-2<CR>==gi

" nnoremap <Leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" Mantenha o texto depois da indentation.
vnoremap < <gv
vnoremap > >gv

" Remap ESC and save on pinky travel time :)
" inoremap kk <esc>

" Map <Leader>, to save
nnoremap <C-s> :w<CR>


" PLUGIN: FZF
nnoremap <C-p> :FzfGFiles<CR>
nnoremap <Leader>pf :FzfFiles<CR>
nnoremap \ :FzfRg<CR>

nnoremap <Leader>gs :Git<CR>

if filereadable(expand("~/.vimrc.plugs"))
  call plug#begin('~/.vim/plugged')
  source ~/.vimrc.plugs
  call plug#end()
endif

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

"
" Config Plugins
"


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

" Notice you'll have to delete the :'<,'> prompt in visual mode before typing
" this command's name.

command! CapitalizeSelection :'<,'>s/\(\w\)\(\w*\)/\u\1\L\2/g

let g:fzf_vim = {}
let g:fzf_vim.command_prefix = 'Fzf'

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Search'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Visual'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'StatusLineNC'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Overwrite :Rg from fzf.vim
" Hit '?' to toggle the preview
command! -bang -nargs=* Rg call fzf#vim#grep(
  \   'rg
  \ --column
  \ --line-number
  \ --no-heading
  \ --fixed-strings
  \ --ignore-case
  \ --hidden
  \ --follow
  \ --glob "!.git/*"
  \ --color "always" '.shellescape(<q-args>),
  \   fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)



set background=dark
colorscheme rosepine_moon 
hi Normal guibg=NONE ctermbg=NONE
" hi NormalFloat guibg=NONE ctermbg=NONE

" configure comments in vimcript
autocmd FileType vimscript setlocal commentstring="\ %s


" Source Vim configuration file and install plugins
" via https://pragmaticpineapple.com/ultimate-vim-typescript-setup/
nnoremap <silent><leader>r :source ~/.vimrc \| :PlugInstall<CR> \| :PlugUpdate<CR>

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" COC  Use <c-space> to trigger completion
inoremap <silent><expr> <c-@> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make Enter <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
