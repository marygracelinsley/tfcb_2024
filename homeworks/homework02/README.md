# Homework 2: Unix shell

This homework will assess your ability to run commands in the shell and make a simple script.

Replace the lines specified in _italics_ with your answers and save as a text file.


## Problem 0

**60 points**

Complete the interactive tutorial.

The main problem I had was at the beginning I clicked on a link from the 01-firststeps folder (https://github.com/FredHutch/tfcb_2021/tree/main/lectures/lecture03#tutorial) that led me to the 2021 course page I and accidentally did most of the tutorial from there (which was slightly different). In the future, I would update this link so it doesn't do this anymore. Otherwise I thought the tutorial was helpful. 


## Problem 1

**20 points**

**Write a script that outputs some user and location data and moves that output to a newly created directory**

Make a single script that prints out a file called question01.txt. 

This file should contain the following text:

  My username is (your username, but the script needs to work for anyone, not just you)

  My home directory is (your home directory, but the script needs to work for anyone, not just you)

  The contents of the tfcb_2023/lectures/lecture04/ directory are

  (prints the contents of that directory)

This script should also create a directory called homework02, and move question01.txt into the homework02 directory.

An example output answer should be:

My username is campbellm <br>
My home directory is /Users/melody <br>
The contents of the tfcb_2023/lectures/lecture04/ directory are<br>
01-first-steps.md<br>
02-directories<br>
03-redirection<br>
04-vim<br>
05-history<br>
06-scripting<br>
07-more-interactive-shell<br>
README.md<br>
quickref.md<br>
sequence.gb<br>
slides<br>
vader.txt<br>


Here is my script: 

#!/bin/bash

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


Make a single script that does the following:

Makes a new directory in homework02 called question02

In that directory, your script should make 25 new files called
file###.txt

the ### should be the numbers from a list you can find here:

tfcb_2023/homeworks/homework02/list.txt

You can make the contents of those files whatever you want (hint: slide 9... )

import os

home_dir = os.path.expanduser('~')
base_dir = os.path.join(home_dir, 'Desktop', 'tfcb_2023-main', 'homeworks', 'homework02')
list_file_path = os.path.join(base_dir, 'list.txt')
new_dir = os.path.join(base_dir, 'question02')

os.makedirs(new_dir, exist_ok=True)

with open(list_file_path, 'r') as list_file:
    numbers = [line.strip() for line in list_file.readlines()]

for number in numbers:
    file_name = f"file{number}.txt"
    file_path = os.path.join(new_dir, file_name)
    with open(file_path, 'w') as file:
        file.write(f"This is the content of {file_name}.\n")
        file.write("You can customize this content as needed.\n")

print(f"Created {len(numbers)} files in {new_dir}.")



