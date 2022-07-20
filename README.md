# uvm-log-colors-for-vim

uvm session log coloring

Coloring the different parts of a UVM message in vim.

I find UVM logs to be difficult to read due to how long each line is, coupled with the fact that each line holds 7 different constructs.

```<msg type> <path>(<line number>) @ <simulation time>: <hierarchy> [<id>] <message>```

For components, and

```<msg type> <path>(<line number>) @ <simulation time>: <reporter> [<id>] <message>```

for objects.

This length causes multiple wraps for each line and it's not clear where one should look to read the parts that are actually important.

![image](https://user-images.githubusercontent.com/22510874/179869700-72a1930a-7816-4128-8ec6-06705b63161a.png)

To solve this, I defined a vim syntax file that colors each construct in a different color.

![image](https://user-images.githubusercontent.com/22510874/179869653-f1dad225-6bac-474b-982b-6a40ddb6859a.png)

Now it is easy to find whichever part in the UVM message you want to read most, because they are all distinct.

# installation
download the log.vim file and put into ~/.vim/syntax/log.vim

Then add this to your ~/.vimrc configuration file:

```
syntax on

augroup filetypedetect
  autocmd BufNewFile,BufRead <something that matches your UVM log file names> setf log 
augroup END
```
for \<something that matches your UVM log file names> you can use wildcard with *.

  
Cheers
