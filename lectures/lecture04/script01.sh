# to run type bash script01.sh

# get username and home directory
username=$(whoami)
homedir=$HOME

# create the question01 file
output="question01.txt"
echo "My username is $username" > $output
echo "My home directory is $homedir" >> $output

# add contents of lecture04 to question01 file
target_dir="../../lectures/lecture04"
echo "The contents of the $target_dir directory are" >> $output
ls "$target_dir" >> $output

# create the homework02 directory
mkdir -p homework02

# move question01 to homework02 directory
mv $output homework02/

# outut the contents of quesiton01
cat homework02/question01.txt
