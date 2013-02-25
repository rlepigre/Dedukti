" Vim syntax file
" Language: Dedukti
" Maintainer: Ronan Saillard
" Latest Revision: 17/01/2013
"
if exists("b:current_syntax")
	finish
endif

syn keyword dkType Type
syn keyword dkTodo TODO FIXME

syn match dkLongArrow 	'-->' 
syn match dkArrow 	'->'
syn match dkFatArrow 	'=>'
syn match dkColon 	'\:'
syn match dkDef 	'\:=' 
syn match dkDummy 	'_' 

syn match dkParL 	'('
syn match dkParR 	')'

syn match dkId		'[A-Za-z][A-Za-z0-9_]*\(\.[A-Za-z][a-zA-Z0-9_]*\)\?'
syn match dkDep		'#[A-Za-z][A-Za-z0-9_]*'

syn region dkComment	start="(;" 	end=";)" fold
syn region dkEnv 	start='\['	end='\]' contains=rien 

hi def link dkComment	Comment
hi def link dkTodo    	Todo
hi def link dkId	Identifier
hi def link dkDep	PreProc
hi def link dkType	Type

hi def link dkEnv	Statement
hi def link dkLongArrow	Special

hi def link dkFatArrow	Special
hi def link dkArrow	Special

hi def link dkColon	Constant
hi def link dkDef	Constant
hi def link dkDummy	Constant

hi def link dkParR	PreProc
hi def link dkParL	PreProc