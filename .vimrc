call plug#begin()
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

call plug#end()

"" Configura o sourcekit-lsp"
"if executable('/Applications/Xcode-14.0.1-Release.Candidate.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'sourcekit-lsp',
"        \ 'cmd': {server_info->['sourcekit-lsp']},
"        \ 'whitelist': ['swift'],
"        \ })
"endif

"Tipo de arquivo swift"

augroup filetype
  au! BufRead,BufNewFile *.swift set ft=swift
augroup END

"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Auto Complete 
"autocmd FileType swift setlocal omnifunc=lsp#complete
