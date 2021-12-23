# grep 
global regular expressions

search for pattern in the file

Note that single or double quotes are required around the text if it is more than one word.

You can also use the wildcard (*) to select all files in a directory.

> grep "search word" filename

case sensitive command by defaul

user flag -i for case insensitive

-n for printing the line number

> grep -n "search word" filename

> grep -v "search word" * 
invert match, only those files that do NOT contain the words in the search

# Use Cases

$ grep -wr -i Kimiko *
- search for a full word "Kimiko" in this dir and subdir 

# To Show Lines That Exactly Match a Search String
The grep command prints entire lines when it finds a match in a file. To print only those lines that completely match the search string, add the -x option.

$ grep -x “phoenix number3” *

# Include number of lines before and after the search 

$ grep -n -C 2 Phoenix sample

Preferable Syntax

Also
-n to include the line numbers

$ grep -wrin -C 2 Kimiko *

# To exclude a word use
$ grep -v "word"

# Combine to include and exclude words with a pipe

$ grep -wrin -C 2 Kimiko * | grep -iv "dima"
include Kimiko but excelude dima 

# Grep exclude directory

Grep exclude directories, we can use the grep –exclude-dir option, which needs to be used with the grep -R option.

Grep –exclude-dir excludes directories matching the given file name pattern from the search.

–exclude-dir
If -R is specified, it excludes directories matching the given filename pattern from the search.
-R, -r, –recursive
Recursively search subdirectories listed.

# grep exclude a directory
➜  grep --exclude-dir "directory" -R "keyword" .

# grep exclude multiple directories
➜  grep --exclude-dir "directory1" --exclude-dir "directory2" -R "keyword" .

Grep exclude file
Grep exclude file, as with excluding directories, we can use the grep –exclude option, which will exclude files matching the given file name pattern from the search.

grep — exclude syntax

# grep exclude a file
➜  grep --exclude "file" "keyword" files

# grep exclude multiple files
➜  grep --exclude "file1" --exclude "file1" "keyword" files

grep — exclude examples
In the following example, we will use the grep –exclude option to exclude one or more files during pattern search.

➜ grep --exclude "test.log" "grep" *.log
...

➜ grep --exclude "test.log" --exclude "m.log" "grep" *.log
...

Grep exclude binary files
When we use the grep command pattern search, we often find some binary files, these are not what we need, so we need to exclude these binary files.

Grep exclude binary files, we can use grep -I option, it can ignore binary files when searching.

-I Ignore binary files.
grep -I syntax
➜ grep -I "keyword" .
grep -I examples
In the following example, we will use the grep -I option to ignore the binary file search content.

➜ grep -RI "grep" .

# Use colors after piping
--color=aways

just add this to the begining of the grep command

# List file online once in the search
option -m1


# Best Example for my searches

$ grep -wrinI -C 2 "kimiko" *

$ grep --color=always -wrinI -C 2 "kimiko" * | grep -i birthday
include other search while piping and in color

$ grep --color=always --include="*.md" -wrinI "kimiko" | grep -i "AND search another word or phrase"

$ grep --color=always --include="*.md" -wrinI -m1 "kimiko" | grep -i "AND search another word or phrase"
online list file once with option -m1





