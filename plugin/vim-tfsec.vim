""
" @usage {}
" Run tfsec against the current directory and populate the QuickFix list
command! Tfsec call s:tfsec()

""
" @usage {}
" Install the latest version of tfsec to %GOPATH/bin/tfsec
command! TfsecInstall call s:tfsecInstall()

""
" @usage {}
" Updates tfsec to the latest version, requires tfsec to be on the path
command! TfsecUpdate call s:tfsecUpdate()


" tfsec runs tfsec and prints adds the results to the quick fix buffer
function! s:tfsec() abort
  try
		" capture the current error format
		let errorformat = &g:errorformat

 		" set the error format for use with tfsec
		let &g:errorformat = '%f\,%l\,%m'

		" get the latest tfsec comments and open the quick fix window with them
		cgetexpr system('tfsec --format csv --force-all-dirs --exclude-downloaded-modules 2>/dev/null | grep -v ''file,start_line,'' | awk -F, ''{print $1","$2",["$5"] " $6}'' | sort ') | cw
		call setqflist([], 'a', {'title' : ':Tfsec'})
	finally
		" restore the errorformat value
		let &g:errorformat = errorformat
  endtry
endfunction

" tfsecInstall runs the go install command to get the latest version of tfsec
function! s:tfsecInstall() abort
	try 
		echom "Downloading the latest version of tfsec"
    let installResult = system('go install github.com/aquasecurity/tfsec/cmd/tfsec@latest')
		if v:shell_error != 0
    	echom installResult
		else
			echom "tfsec downloaded successfully"
		endif
	endtry
endfunction

" tfsecUpdate will update existing tfsec 
function! s:tfsecUpdate() abort
	try 
		echom "Updating to the latest version of tfsec"
    echom system('tfsec --update')
	endtry
endfunction
