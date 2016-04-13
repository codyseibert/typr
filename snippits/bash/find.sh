find .
find ./test
find ./test -name "abc.txt"
find ./test -name "*.php"
find ./test -iname "*.Php"
find ./test -maxdepth 2 -name "*.php"
find ./test -not -name "*.php"
find ./test -name 'abc*' ! -name '*.php'
find -name '*.php' -o -name '*.txt'
find ./test -type f -name "abc*"
find ./test -type d -name "abc*"
find ./test ./dir2 -type f -name "abc*"
find ~ -type f -name ".*"
find . -type f -perm 0664
find . -type f ! -perm 0777
find / -maxdepth 2 -perm /u=s 2>/dev/null
find /bin -maxdepth 2 -perm /a=x
find . -user bob
find /var/www -group developer
find / -mtime 50
find / -atime 50
find / -mtime +50 -mtime -100
find /home/bob -cmin -60
find / -mmin -60
find / -size 50M
find / -size +50M -size -100M
find . -type f -exec ls -s {} \; | sort -n -r | head -5
find /tmp -type f -empty
find . -exec ls -ld {} \;
find /tmp -type f -name "*.txt" -exec rm -f {} \;
