# vim_UVM_log_syntax
Coloring the different parts of a UVM message in vim.


I find UVM logs to be difficult to read due to how long each line is. 
This length causes multiple wraps for each line and it's not clear where one should look to read the parts that are actually important.

![image](https://user-images.githubusercontent.com/22510874/176796330-a5091c9b-3b58-42fe-8a86-cf6cfc2b105e.png)

But with the syntax highlighting, you will know where to focus regardless of how the line is wrapping:

![image](https://user-images.githubusercontent.com/22510874/176796415-c2e51a4b-bd90-4d86-9b00-7346b5060177.png)


# installation
download the file and put into ~/.vim/syntax/log.vim

Then add this to your ~/.vimrc configuration file:

augroup filetypedetect
  autocmd BufNewFile,BufRead <something that matches your UVM log file names> setf log 
augroup END

for <something that matches your UVM log file names> you can use wildcard with *.
  
  
Cheers
