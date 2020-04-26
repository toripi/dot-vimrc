" Add My configure
" packloadall             " すべてのプラグインをロードする (~/.vim/pack/*/start 配下のみ)
" silent! helptags ALL    " すべてのプラグイン用にヘルプファイルをロードする syntax on filetype plugin indent on
" vim-plugがインストールされていなかったらインストール
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.github.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC 
endif

" プラグイン管理 vim-plug
call plug#begin()
Plug 'junegunn/vim-plug'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
let g:plug_timeout = 300        " YouCompleteMeはコンパイルに時間がかかるため
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py'}
Plug 'sjl/gundo.vim'
call plug#end()

" Gundo setting
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

set mouse=      " mouse無効
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set nobackup
set noundofile
set helplang=ja,en
set encoding=utf-8
set clipboard=unnamed,unnamedplus   " システムのクリップボードを使用
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
set belloff=all " ベル無効
" statuslineの表示設定
set statusline=[%F]%r%m%h%=[%{&fenc!=''?&fenc:&enc}][%{&ff}][%Y]%l,%L%8P
" statuslineの表示(0:表示しない　1:2以上ウィンドウがある時だけ表示
set laststatus=2
colorscheme murphy
set foldmethod=indent   " ファイル内容をインデンで折り畳む
set wildmenu            " 補完候補をstatuslineに出力 let NERDTreeShowBookmarks = 1   " Vim起動時にNERDTreeのブックマークを開く
autocmd VimEnter * NERDTree     " Vim起動時にNERDTreeを開く
autocmd VimEnter * wincmd p     " フォーカスを右に
" NERDTreeのウィンドウのみになった時にvimを閉じる
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && 
    \ b:NERDTree.isTabTree()) | q | endif
autocmd BufRead * normal zR
" set number              " 行番号の表示

" 対応する引用符、カッコを入力
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i

" マウスホイール無効
noremap <ScrollWheelUp> <nop>
noremap <ScrollWheelDown> <nop>

" YouCompleteMe キー設定
noremap <leader>] :YcmCompleter GoTo<cr>

" Gundo キー設定
noremap <f5> :GundoToggle<cr>
