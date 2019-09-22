# Exercise 5: large data sets: Baby Name Popularity Over Time

# Read in the female baby names data file found in the `data` folder into a 
# variable called `names`. Remember to NOT treat the strings as factors!

setwd("~/Documents/book-exercises/chapter-10-exercises/exercise-5/")
names <- read.csv("data/female_names.csv", stringsAsFactors = FALSE)

# Create a data frame `names_2013` that contains only the rows for the year 2013

names_2013 <- names[names$year == 2013,]

# What was the most popular female name in 2013?

highest_prop_2013 <- max(names_2013$prop)
print(paste("The most popular name in 2013 was",
            names_2013[names_2013$prop == highest_prop_2013,"name"]))

# Write a function `most_popular_in_year` that takes in a year as a value and 
# returns the most popular name in that year

most_popular_in_year <- function(year){
  year_df <- names[names$year == year,c("name","prop")]
  highest_prop_in_year <- max(year_df$prop)
  return(year_df[year_df$prop == highest_prop_in_year,"name"])
}

# What was the most popular female name in 1994?

print(paste("The most popular name in 1994 was",
            most_popular_in_year(1994)))

# Write a function `number_in_million` that takes in a name and a year, and 
# returns statistically how many babies out of 1 million born that year have 
# that name. 
# Hint: get the popularity percentage, and take that percentage out of 1 million.

number_in_million <- function(name, year){
  popularity_percentage <- names[names$name == name & names$year == year, "prop"]
  return(popularity_percentage * 1e6)
}

# How many babies out of 1 million had the name 'Laura' in 1995?

print(paste("There were",
            round(number_in_million("Laura", 1995)),
            "babies out of 1 million named Laura in 1995"))

# How many babies out of 1 million had your name in the year you were born?

print(paste("There were",
            round(number_in_million("Maureen", 1961)),
            "babies out of 1 million named Maureen in 1961"))

## Consider: what does this tell you about how easy it is to identify you with 
## just your name and birth year?
