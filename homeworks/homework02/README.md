# Homework 2: Unix shell

This homework will assess your ability to run commands in the shell and make a simple script.

Replace the lines specified in _italics_ with your answers and save as a text file.


## Problem 0

**60 points**

The main problem I had was at the beginning I clicked on a link from the 01-firststeps folder (https://github.com/FredHutch/tfcb_2021/tree/main/lectures/lecture03#tutorial) that led me to the 2021 course page I and accidentally did most of the tutorial from there (which was slightly different). In the future, I would update this link so it doesn't do this anymore. Otherwise I thought the tutorial was helpful. 


## Problem 1

**20 points**

**Write a script that outputs some user and location data and moves that output to a newly created directory** 

#ToRun: bash script01.sh

username=$(whoami)

homedir=$HOME

output="question01.txt"

echo "My username is $username" > $output

echo "My home directory is $homedir" >> $output

target_dir="../../lectures/lecture04"

echo "The contents of the $target_dir directory are" >> $output

ls "$target_dir" >> $output

mkdir -p homework02

mv $output homework02/

cat homework02/question01.txt


## Problem 2

**20 points**

**Write a script that uses a loop to output files with specific names**

#to run: bash script02.sh

base_dir="../../lectures/lecture04/homework02"

mkdir -p "$base_dir/question02"

list_file="../../homeworks/homework02/list.txt"

while IFS= read -r number; do
  
  file_name="file${number}.txt"
  
  echo "This is the exciting contents of file${number}" > "$base_dir/question02/$file_name"

done < "$list_file"



