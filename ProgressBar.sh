#!/bin/bash

commands=("echo 1" "echo 2" "echo 3" "echo 4" "echo 5" "echo hello")

ignore_errors=0

function printCharNTimes () {
	#Appends a character to the string for a certain number of times
	for j in $(seq 0 $1)
	do
		progressbar=${progressbar}"$2"
	done
}

while getopts 'i' PARAMS; do
  case "$PARAMS" in
    i)
      ignore_errors=1
      ;;

    ?)
      echo "script usage: $(basename $0) [-i]" >&2
      exit 1
      ;;
  esac
done

let blocks=${#commands[@]}
let barsize=($(tput cols) - 20)
let blocksize=($barsize+$blocks-1)/$blocks

for i in $(seq 0 $(($blocks-1)));
do
	# Create progress bar and update it every iteration
    
    let hashes=($blocksize*$i - 1)
    let dots=($barsize-$hashes-1)
    
    progressbar=""
    printCharNTimes $hashes "#"
    printCharNTimes $dots "."
    
    let percentage=($i*100)/$blocks
    printf "Progress: [%3d%%] [%s]\r" "$percentage" "$progressbar"
    sleep 0.3;
    
    # Run each command in array and redirect all output to progressbar.log file in current directory
    $(${commands[$i]} >> progressbar.log 2>&1)

    retval=$?
    
    #Check for errors and exit in case of failure
    if [ $retval -ne 0 ]
    then
    	echo -ne "\033[2K"
    	
    	echo -ne "The command: "${commands[$i]}" has failed with error code $retval. Check progressbar.log for details."
    	# The script has failed at "$percentage"% due to 
    	if [ $ignore_errors -eq 1 ]
    	then
    		echo -e " Continuing regardless...\n"
    	else
    		echo " Stopping immediately!"
    		exit 1
    	fi
    fi
done

progressbar=""
percentage=100
printCharNTimes $barsize "#"
printf "Progress: [%3d%%] [%s]\n" "$percentage" "$progressbar"
echo Done.


