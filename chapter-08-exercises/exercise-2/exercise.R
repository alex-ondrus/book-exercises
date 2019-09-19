# Exercise 2: using `*apply()` functions

# Create a *list* of 10 random numbers. Use the `runif()` function to make a 
# vector of random numbers, then use `as.list()` to convert that to a list

list_of_randoms <- as.list(runif(10))

# Use `lapply()` to apply the `round()` function to each number, rounding it to 
# the nearest 0.1 (one decimal place)

rounded_randoms <- lapply(list_of_randoms, round,1)

# Create a variable 'sentence' that contains a sentence of text (something 
# longish). Make the sentence lowercase; you can use a function to help.

sentence <- tolower("Writing a list of random sentences is harder than I initially thought it would be.")

# Use the `strsplit()` function to split the sentence into a vector of letters.
# Hint: split on `""` to split every character
# Note: this will return a _list_ with 1 element (which is the vector of letters)

list_of_letters <- strsplit(sentence, split = "")

# Extract the vector of letters from the resulting list

vector_of_letters <- list_of_letters[[1]]

# Use the `unique()` function to get a vector of unique letters

unique_letters <- unique(vector_of_letters)

# Define a function `count_occurrences` that takes in two parameters: a letter 
# and a vector of letters. The function should return how many times that letter
# occurs in the provided vector.
# Hint: use a filter operation!

count_occurrences <- function(letter, vector_of_letters){
  letter_matches <- vector_of_letters[vector_of_letters == letter]
  return(length(letter_matches))
}

# Call your `count_occurrences()` function to see how many times the letter 'e'
# is in your sentence.

print(count_occurrences('e',vector_of_letters))

# Use `sapply()` to apply your `count_occurrences()` function to each unique 
# letter in the vector to determine their frequencies.
# Convert the result into a list (using `as.list()`).

list_of_frequencies <- as.list(sapply(unique_letters, 
                              count_occurrences, 
                              vector_of_letters))

# Print the resulting list of frequencies
print(list_of_frequencies)
