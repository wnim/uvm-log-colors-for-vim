" Vim syntax file
" Language: UVM LOG FILES
" Maintainer: Nimrod Weinberg

if exists("b:current_syntax")
  finish
endif

"without setting the parameters below, vim will sometimes fail on 
"very long lines. Sometimes you will see the error message, but
"sometimes it will flash too quickly. I set these values based
"on the times I was able to see the error messge. I set them as an
"arbitrary multiplication of their default value.
"I will revisit these values if I see more failures in the future.
"by the way, if syntax does disappear at some point, I think ctrl+L
"brings it back.

"Maximum column in which to search for syntax items.
set synmaxcol=9000

"Maximum amount of memory (in Kbyte) to use for pattern matching.
set maxmempattern=5000

"The time in milliseconds for redrawing the display.
set redrawtime=5000

syn match uvm_info "UVM_INFO"
syn match uvm_warning "UVM_WARNING"
syn match uvm_error "UVM_ERROR"
syn match uvm_fatal "UVM_FATAL"

"file path - instead of this I decided to highlight the dirpath and the 
"file name separately. This is because I sometimes like to run a command
"that removes the dir path and leave only the file name.
"syn region filepath start="\/" end="[^\(]\+" conceal oneline

syn match dirpath '\v\/[\.a-zA-Z_\/0-9\-]+\/' conceal
"Some places don't start the filepath with / 
"syn match dirpath '\v[\.a-zA-Z_\/0-9\-]+\/' 
syn match filename "\v\w+\.[^(]+"  
syn region timestamp start="@" end="[fpnum]s:" oneline
syn region hier start="uvm_test_top" end=" " oneline
syn region id start="\[[A-Za-z]" end="] " oneline


syn match setenv_line "setenv\s\+[a-zA-Z_0-9]\+" contains=setenv_var
syn match setenv_var " [a-zA-Z_0-9]\+" contained

hi def link setenv_line Special
hi def link setenv_var Type

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"capturing the message by capturing everything after ID
"syn match msg '\( \[.*] \)\@<=.*$'
"
"This matches lines without UVM
"syn match msg_linebreak '^\(\(.*UVM_.*\)\@!.\)*$'

"A supposedly more efficient to capture the message
"This uses \zs to set the start of the match after the ID, which is generally more efficient than a lookbehind.
syn match msg '\[.*\].*$' contains=id

"This just colors anything that doesn't have a match, in bright yellow
"hi Normal ctermfg=221 guifg=#fac863

"This colors every line in yellow, except the parts that get their colors from some other definition (so a less efficient way to do the above)
"syn match uvm_line '^.*$' contains=uvm_info,uvm_warning,uvm_error,uvm_fatal,dirpath,filename,timestamp,hier,id
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"hi def link uvm_line type
" run :help group-name
hi def link uvm_info Comment
hi def link uvm_warning Identifier
hi def link uvm_error Number
hi def link uvm_fatal Boolean
hi def link dirpath Special
hi def link filename Special
hi def link timestamp Function
hi def link hier Conditional
hi def link id Boolean
hi def link msg type
hi def link msg_linebreak type


"gave this up because conceal works badly with linewrap
"set conceallevel=2
set concealcursor=ncv


let b:current_syntax = "log"


