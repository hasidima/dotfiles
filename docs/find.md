# Find command

> find /dir -name filename

> find /dir -mtime -1 
created within 1 day 

always up to date (vs locate), does not use database

find / "list every single file and folder on the computer

## How to control the depth of search?

normally search on infinite depth 
$ find

$ find . -maxdepth 1
"to search only 1 folder depth from the current folder 

$ find . -type f
" to search for files only

$ find . -type d
" find folders only

$ find . -maxdepth 1 -type d
"put maxdepth first

## Find by file name
$ find . -name "filename"

cannot do brace expansion with find command

## Not case sensitive

$ find . -iname "filename" 
" search for filename case insensitive

## Find by file size 

$ find / -type f -size +100k -size -5M
"find files greater than 100k but less than 5Mb

-o " OR

$ find / -type f -size +100k -o -size -5M
"more than 100k OR less than 5Mb

- "less than
+ "more than
-o "OR

## Find and execute a command

$ sudo 
find / -type f -size +100 -size -5M -exec
"execute on this command

the result will be in {}

$ find / -type f -size +100 -size -5M -exec cp {} /directory \; 

"find and execute the command on {} results

instead of -exec use -ok 

will ask you to proceed. It is safer if you use destructive commands 

$ find / -type f -size +100 -size -5M -ok cp {} /directory \; 

$ find . -iname "kimiko*" -exec vim {} \; 
$ find . -iname "kimiko*" -ok vim {} \; 

mkdir folder{1..500} 
"to create 500 folders



