# Homework 2: Unix shell

This homework will assess your ability to run commands in the shell and make a simple script.

Replace the lines specified in _italics_ with your answers and save as a text file.


## Problem 0

**60 points**

Complete the interactive tutorial.

I did not find the interactive tutorial frustrating. I feel like it was purposefully a bit vague which led me to researching what all the commands do on my own and learning. 


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

import os
import shutil
import requests
import getpass

github_username = "marygracelinsley"
repo_name = "tfcb_2024"
branch = "main"
directory = "lectures/lecture04"

url = f"https://api.github.com/repos/{github_username}/{repo_name}/contents/{directory}?ref={branch}"

response = requests.get(url)
if response.status_code == 200:
    files = response.json()
    contents_str = '\n'.join(file['name'] for file in files)
else:
    contents_str = "Directory does not exist or could not be fetched."

username = getpass.getuser() 
home_dir = os.path.expanduser('~')

with open('question01.txt', 'w') as file:
    file.write(f"My username is {username}\n")
    file.write(f"My home directory is {home_dir}\n")
    file.write("The contents of the tfcb_2024/lectures/lecture04/ directory are:\n")
    file.write(contents_str + "\n")

desktop_dir = os.path.join(home_dir, 'Desktop')
new_dir = os.path.join(desktop_dir, 'homework02')

print(f"Attempting to create directory at: {new_dir}")

os.makedirs(new_dir, exist_ok=True)
shutil.move('question01.txt', os.path.join(new_dir, 'question01.txt'))

with open(os.path.join(new_dir, 'question01.txt'), 'r') as file:
    print(file.read())

print(f"File question01.txt has been created and moved to '{new_dir}'.")


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



