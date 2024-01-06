" Vim syntax file
" Language: UVM LOG FILES
" Maintainer: Nimrod Weinberg

if exists("b:current_syntax")
  finish
endif

"without setting the parameters below, vim will sometimes fails on 
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

syn match dirpath "\v\/[\.a-zA-Z_\/0-9\-]+\/" "conceal
"syn match dirpath "\v[\.a-zA-Z_\/0-9\-]+\/" "Some places don't start the filepath with / 
syn match filename "\v\w+\.[^(]+"  
syn region timestamp start="@" end=" .s:" oneline
syn region hier start="uvm_test_top" end=" " oneline
syn region id start="\[[A-Za-z]" end="]" oneline
syn match msg "\( \[.*] \)\@<=.*$"
syn match msg_linebreak "^\(\(.*UVM_.*\)\@!.\)*$"

hi def link uvm_info Comment
hi def link uvm_warning Identifier
hi def link uvm_error Constant
hi def link uvm_fatal Statement
hi def link dirpath Special
hi def link filename Special
hi def link timestamp Function
hi def link hier Conditional
hi def link id Debug
hi def link msg type
hi def link msg_linebreak type

"gave this up because conceal works badly with linewrap
"set conceallevel=1
"set concealcursor=ncv


