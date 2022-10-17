#!/bin/bash

crtsh(){
	curl -s https://crt.sh/?Identity=%.$1 | grep ">*.$1" | sed 's/<[/]*[TB][DR]>/\n/g' | grep -vE "<|^[\*]*[\.]*$1" | sort -u | awk 'NF'
}

if [ -z $1 ]
then
	echo "Usage: getsubs FileName"

else
	while read p;
	do
		p=$(echo $p | grep "*" | sed "s/\*.//")
		if [ ! -z "$p" ]
		then
			crtsh $p
		fi
	done < $1

fi

