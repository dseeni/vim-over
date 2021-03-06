" ___vital___
" NOTE: lines between '" ___vital___' is generated by :Vitalize.
" Do not mofidify the code nor insert new lines before '" ___vital___'
function! s:_SID() abort
  return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze__SID$')
endfunction
execute join(['function! vital#_over#Over#Commandline#Modules#AsyncUpdate#import() abort', printf("return map({'make': '', '_vital_loaded': ''}, \"vital#_over#function('<SNR>%s_' . v:key)\")", s:_SID()), 'endfunction'], "\n")
delfunction s:_SID
" ___vital___
scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

function! s:_vital_loaded(V)
	let s:V = a:V
	let s:Base = s:V.import("Over.Commandline.Base")
endfunction


let s:module = {
\	"name" : "AsyncUpdate"
\}

function! s:module.on_enter(cmdline)
	function! a:cmdline.__update()
		call self.callevent("on_update")
		try
			if !getchar(1)
				return
			endif
			call self.__inputting()
		catch /^Vim:Interrupt$/
			call self.__input("\<C-c>")
		endtry

		call self.draw()
	endfunction
endfunction


function! s:make()
	return deepcopy(s:module)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
