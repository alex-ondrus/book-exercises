# Exercise 1
This exercise is a brief review of terminal commands.

Open up your command-line terminal, and perform the following tasks (no need to fork or download this repository):

```bash
# Navigate to your "Documents" directory
# Changed exercise: navigate to "exercise-1" directory

cd ~/Documents/book-exercises/chapter-02-exercises/exercise-1/

# Create a new folder called "quick-exercise"

mkdir quick-exercise

# Navigate into the "quick-exercise" folder you just created

cd quick-exercise

# Using the text-edit of your choice (e.g., Atom), create a new (empty) file
# called "constitution.txt" inside the "quick-exercise" folder you made


# List the contents of the folder to verify the new file is there

ls

# Search online for the text of the US Constitution and paste it into the 
# "constitution.txt" file you created. Save your changes through the editor.



# Display the contents of the "constitution.txt" file in the terminal
# Hint: use the `less` command so you can easily scroll up and down.

less Constitution.txt

# Navigate to the "Desktop" folder for your machine

cd ~/Desktop

# Display the contents of the "Documents/quick-exercise/constitution.txt" file in the Terminal
# *without changing directories again!*

less ~/Documents/book-exercises/chapter-02-exercises/exercise-1/quick-exercise/Constitution.txt

# Bonus: Create 10 files with one single command in your terminal. Then delete them all!

for i in {1..10}; do touch "file $i.txt"; done

```
