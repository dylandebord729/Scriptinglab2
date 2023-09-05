#!/bin/sh
totalBytes=0
readcnt=0
writecnt=0
execcnt=0
for name in *
do
	totalBytes=$((totalBytes + `wc -c $name|cut -d' ' -f1`))
	if [ -r $name ] ; then
		readcnt=$((readcnt += 1))
	fi
	if [ -w $name ] ; then
		writecnt=$((writecnt += 1))
	fi
	if [ -x $name ] ; then
		execcnt=$((execcnt += 1))
	fi
done
echo Total size of all files in this Directory: $totalBytes bytes.
echo $readcnt of the files have read permissions.
echo $writecnt of the files have write permissions.
echo $execcnt of the files have execute permissions.
echo Estimated number of shell script files in this directory:
head -1 *|grep '#\!/bin/sh'|wc -l
