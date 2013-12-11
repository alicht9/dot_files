filetype plugin indent on
syntax on
set autoindent
colorscheme ron


set noswapfile

"save multiline angers
nmap k gk
nmap j gj

"Create a paste mode so that indenting doesn't get screwed up
set pastetoggle=<F2>
map <F3> :set nonumber! <CR>

"map F9 to be a runner
map <F4> :! %<cr>

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

"shells
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_CWInsert = 0
let g:ConqueTerm_TERM = 'xterm'
let g:ConqueTerm_ExecFileKey = '<F11>'

map <F5> :ConqueTermVSplit bash <cr>
map <F6> :ConqueTermSplit bash <cr>


function! RenameFile()
	let old_name = expand('%')
	let new_name = input('New file name: ', expand('%'), 'file')
	if new_name != '' && new_name != old_name
		exec ':saveas ' . new_name
		exec ':silent !rm ' . old_name
		redraw!
	endif
endfunction
map <leader>n :call RenameFile()<cr>

"Show in a new window the Subversion blame annotation for the current file.
" Problem: when there are local mods this doesn't align with the source file.
" To do: When invoked on a revnum in a Blame window, re-blame same file up to previous rev.
:function s:svnBlame()
   let line = line(".")
   setlocal nowrap
   aboveleft 18vnew
   setlocal nomodified readonly buftype=nofile nowrap winwidth=1
   NoSpaceHi
   " blame, ignoring white space changes
   %!svn blame -x-w "#"
   " find the highest revision number and highlight it
   "%!sort -n
   "normal G*u
   " return to original line
   exec "normal " . line . "G"
   setlocal scrollbind
   wincmd p
   setlocal scrollbind
   syncbind
:endfunction
:map gb :call <SID>svnBlame()<CR>
:command Blame call s:svnBlame() 

"make comments readable and not this
"dark blue that xterm defaults to
:highlight Comment ctermfg=blue

"Fix where an apple keyboard won't work 
"using the numberpad in xterm or uxvrt
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Op 0
imap <Esc>On .
imap <Esc>OR *
imap <Esc>OQ /
imap <Esc>Ol +
imap <Esc>OS -

map <Esc>Oq 1
map <Esc>Or 2
map <Esc>Os 3
map <Esc>Ot 4
map <Esc>Ou 5
map <Esc>Ov 6
map <Esc>Ow 7
map <Esc>Ox 8
map <Esc>Oy 9
map <Esc>Op 0
map <Esc>On .
map <Esc>OR *
map <Esc>OQ /
map <Esc>Ol +
map <Esc>OS -
