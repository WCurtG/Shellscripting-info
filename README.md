# Shellscripting info
 basic info for working with shellscripts

## ;
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

## &&
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

## ||
This is the opposite of `&&`  also referred to as “or or” 
```
cat doesntexit.txt || echo "your file doesn't exist"
```
Results in 
```
cat: doesntexit.txt: No such file or directory
your file doesn't exist
```

## &
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

## \
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

## Working smarter with variables
### #
Use this to delete from the beginning of the string 
```
#!/bin/bash

var="apple orange"
echo "${var#a}"
```
Results in 
`pple orange`

### %