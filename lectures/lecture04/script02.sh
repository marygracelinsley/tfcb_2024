#to run: bash script02.sh

#Set the base directory
base_dir="../../lectures/lecture04/homework02"

# Create the new directory 'question02' inside 'homework02'
mkdir -p "$base_dir/question02"

# Read numbers from list.txt
list_file="../../homeworks/homework02/list.txt"
while IFS= read -r number; do
  # Create files named file###.txt using numbers from list.txt
  file_name="file${number}.txt"
  echo "This is the exciting contents of file${number}" > "$base_dir/question02/$file_name"
done < "$list_file"
