#!/bin/bash
# Script: FileDiff.sh
# Aufruf: FileDiff.sh file1 file2

file1="$1";
file2="$2";

good="√";
bad="x";

fileArray1=("")
fileArray2=("")

while IFS= read -r line
do
    fileArray1+=("$line")
done < "$file1"

while IFS= read -r line
do
    fileArray2+=("$line")
done < "$file2"

for index in "${!fileArray1[@]}" 
do
    line1="${fileArray1[$index]}"
    line2="${fileArray2[$index]}"
    if [ "$line1" = "$line2" ]; then
    echo "$good $line1 $line2"
    else
    echo "$bad $line1 $line2"
    fi
done