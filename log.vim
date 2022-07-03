" Vim syntax file
" Language: UVM LOG FILES
" Maintainer: Nimrod Weinberg
" Latest Revision: June 27th 2022

if exists("b:current_syntax")
  finish
endif

syn match uvm_info "UVM_INFO"
syn match uvm_warning "UVM_WARNING"
syn match uvm_error "UVM_ERROR"
syn match uvm_fatal "UVM_FATAL"


"file path - instead of this I decided to highlight the dirpath and the 
"file name separately. This is because I sometimes like to run a command
"that removes the dir path and leave only the file name.
"syn region filepath start="\/" end="[^\(]\+" conceal oneline

syn match dirpath "\v\/[\.a-zA-Z_\/0-9\-]+\/" "conceal
syn match filename "\v\w+\.[^(]+"  
syn region timestamp start="@" end=" .s:" oneline
syn region hier start="uvm_test_top" end=" " oneline
syn region id start="\[[A-Za-z]" end="]" oneline
syn match msg "\( \[.*] \)\@<=.*$"
syn match msg_linebreak "^\(\(.*UVM_.*\)\@!.\)*$"

hi def link uvm_info Comment
hi def link uvm_warning Constant
hi def link uvm_error Identifier
hi def link uvm_fatal vimCommand 
hi def link dirpath Special
hi def link filename Special
hi def link timestamp function
hi def link hier Identifier
hi def link id vimCommand
hi def link msg type
hi def link msg_linebreak type

"gave this up because conceal works badly with linewrap
"set conceallevel=1
"set concealcursor=ncv

"each line will contain identifiers that have the same color in oceanicnext
"color scheme
"PreProc identifier - torqoise
"special  constant - purple
"Error - yellow
"statement - gray
"normal comment vimWarn- white
"underlines - white underlined
"type vimOption - yellow
