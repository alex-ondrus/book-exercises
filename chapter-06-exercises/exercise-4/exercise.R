# Exercise 4: functions and conditionals

# Define a function `is_twice_as_long` that takes in two character strings, and 
# returns whether or not (e.g., a boolean) the length of one argument is greater
# than or equal to twice the length of the other.
# Hint: compare the length difference to the length of the smaller string

is_twice_as_long <- function(string_1,string_2){
  if(nchar(string_1) >= nchar(string_2)){
    long_string <- string_1
    short_string <- string_2
  } else {
    long_string <- string_2
    short_string <- string_1
  }
  return(nchar(long_string) >= 2*nchar(short_string))
}

# Call your `is_twice_as_long` function by passing it different length strings
# to confirm that it works. Make sure to check when _either_ argument is twice
# as long, as well as when neither are!

print(is_twice_as_long('a','ab'))
print(is_twice_as_long('abc','ab'))
print(is_twice_as_long('ab','a'))


# Define a function `describe_difference` that takes in two strings. The
# function should return one of the following sentences as appropriate
#   "Your first string is longer by N characters"
#   "Your second string is longer by N characters"
#   "Your strings are the same length!"

describe_difference <- function(string_1, string_2){
  diff <- nchar(string_1) - nchar(string_2)
  if(diff==0){return("Your strings are the same length!")}
  if(diff >0){
    return(paste("Your first string is longer by",diff,"characters"))
  } else {
    return(paste("Your second string is longer by",abs(diff),"characters"))
  }
}

# Call your `describe_difference` function by passing it different length strings
# to confirm that it works. Make sure to check all 3 conditions1

print(describe_difference('ab','a'))
print(describe_difference('ab','abc'))
print(describe_difference('abc','abc'))

