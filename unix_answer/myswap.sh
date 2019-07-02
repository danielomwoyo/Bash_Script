#!/bin/sh

dirName="$1"

#cd "$("$(readlink -f $dirName "$0")")"

#loop through directory listing all files if files are exactly two

count=$(find . -name "*.txt*" | wc -l)
echo $count
if [ "$count" -ne 2 ];
then
echo "Files are more/less than two !!!"
exit 0

else
for i in "$dirName"; do
echo "listing files in the directory"
ls "$i"
find . -name "*.txt*" -exec cat {} \;

done
fi


#dirName $1 is the first argument and  value $2 is the second arguement
#e.g. myswap.sh '~/value1.txt' and '~/value2.txt'

#function swap() that swaps the file contents

swap() {
touch $dirName/temp/temp.txt

#copy from file2 to tempfile

cat "$2"> $dirName/temp/temp.txt &&

#copy content from file1 to file2

cat "$1"> "$2" &&

#copy from tempfile to file1

cat $dirName/temp/temp.txt> "$1" &&
rm  $dirName/temp/temp.txt && echo "done"

find . -name "*.txt*" -exec cat {} \;
 
exit
}
find . -name "*.txt*" -exec cat {} \;

swap "$dirName/bye.txt" "$dirName/hello.txt"


fi

