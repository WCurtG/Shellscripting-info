# Shell scripting 101
 basic info for working with shell scripts

## Make the file.sh executable

`chmod +x ./file.sh` 
This gives file.sh execution permission for any profile 

`chmod u+x ./file.sh`
This only gives user permission to execute file.sh

## ; to demo run ./semicolon.sh
; is like having a new line 
```
echo “hello there”
echo “this is Curt”
```
Results in 
```
hello there 
this is Curt
```
You can do the same thing like this 
```
`echo “hello there” ; echo “this is Curt”`
```
This gets the same result 

## && to demo run ./andand.sh
&& let’s you string together 2 commands but will only run the second command if the first is successful 
```
cat doesntexit.txt && echo "your file exist"
```
Results in 
`cat: doesntexit.txt: No such file or directory` 
If you use `;` the second command will still run
```
cat doesntexit.txt ; echo "your file exist"
```
Results in 
```
cat: doesntexit.txt: No such file or directory
your file exist
```

## & to demo run ./andand.sh
This is totally different than `&&` because it doesn’t wait for the first command to finish running, it runs them in order but right away. 
```
sleep 5 & echo "All done." 
```
Results in 
```
sleep 5 & echo "All done."
[1] 6019
All done.
~
[1]  + 6019 done       sleep 5
~
```
Instead of 
```
sleep 5 ; echo "All done." 
```
This will wait 5 seconds then run the second command resulting in 
`All done.`

## || to demo run ./pipepipe.sh
This is the opposite of `&&`  also referred to as “or or” 
```
cat doesntexit.txt || echo "your file doesn't exist"
```
Results in 
```
cat: doesntexit.txt: No such file or directory
your file doesn't exist
```

## \ to demo run ./slash.sh
Use a `\` to print a `!` 
```
echo "This is Curt\!"  
```
Results in 
`This is Curt!`
Instead of 
`dquote> `  To exit this you just need to run `“` enter, if you don’t want to use the `\` set a variable for the string with the `!` and put it in single quotes ( ‘ )
```
pw='password!' ; echo "this is my ${pw}"
```

## Working smarter with variables to demo run ./vars.sh and see more examples including ##, %%, and learn what * does

### #
Use # to delete from the beginning of the string 
```
var="apple orange"
echo "${var#a}"
```
Results in 
`pple orange`

### %
Use # to delete from the end of the string 
```
var="apple orange"
echo "${var%a}"
```
Results in 
`pple orange`

## sed command is used as a stream editor it doesn't modify the file perminatly by default. Demo found here https://www.youtube.com/watch?v=QaGhpqRll_k

### The most common use is similar to find/replace in word 
Stucture your sed `s` command 
```
sed "s/what to replace/replace with/(g)global or (black)one per line resticted" .file-to-edit
```
Get rid of comments not including trailing whitespace 
```
sed "s/#.*//g" .file-to-edit
```
Get rid of comments including trailing whitespace 
```
sed "s/\s*#.*//g" .file-to-edit
```
Get rid of comments including trailing whitespace & run an additional command to replace c with C globally
```
sed "s/\s*#.*//g;s/c/C/g" .file-to-edit
```
How to delete any lines with pattern cf
```
sed " /cf/ d" .file-to-edit
```
How to print any lines with pattern cf again
```
sed " /cf/ p" .file-to-edit
```
How to quit running the file at first line with pattern cf 
```
sed " /cf/ q" .file-to-edit
```
How to quit running the file at the 8th
```
sed " 8 q" .file-to-edit
```
How to remove the blank lines 
`^` indicates begging of a line
`$` indicates end of a line
`^$` indicates blank line
```
sed " /^$/ d" .file-to-edit
```
### To edit a file you need to run it with sed -i 

How to remove the blank lines and create a new edited file
```
sed " /^$/ d" .file-to-edit > .tmp && mv .tmp .file-to-edit-2
```
How to remove the blank lines and create a new edited file in a different directory and overwirte the exiting file 
```
sed " /^$/ d" .file-to-edit > .tmp && 
mv .tmp .file-to-edit-2 &&
mv .file-to-edit-2 diff-dir
```
How to remove the blank lines and create a new edited file in a different directory and ask if you want to overwirte the exiting file use `-i` in line 3. If you say no the new file will remain in the exiting dir
```
sed " /^$/ d" .file-to-edit > .tmp && 
mv .tmp .file-to-edit-2 &&
mv -i .file-to-edit-2 diff-dir
```