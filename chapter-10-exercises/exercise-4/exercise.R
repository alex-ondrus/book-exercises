# Exercise 4: external data sets: Gates Foundation Educational Grants

# Use the `read.csv()` functoin to read the data from the `data/gates_money.csv`
# file into a variable called `grants` using the `read.csv()`
# Be sure to set your working directory in RStudio, and do NOT treat strings as 
# factors!

setwd("~/Documents/book-exercises/chapter-10-exercises/exercise-4")
grants <- read.csv("data/gates_money.csv", stringsAsFactors = FALSE)

# Use the View function to look at the loaded data

View(grants)

# Create a variable `organization` that contains the `organization` column of 
# the dataset

organization <- grants$organization

# Confirm that the "organization" column is a vector using the `is.vector()` 
# function. 
# This is a useful debugging tip if you hit errors later!

print(paste("Is the 'organization' variable a vector?",
            is.vector(organization)))

## Now you can ask some interesting questions about the dataset

# What was the mean grant value?

print(paste("The mean grant value is",
            round(mean(grants$total_amount),2)))

# What was the dollar amount of the largest grant?

largest_grant <- max(grants$total_amount)
print(paste("The largest dollar amount was",
            largest_grant))

# What was the dollar amount of the smallest grant?

smallest_grant <- min(grants$total_amount)
print(paste("The smallest dollar amount was",
            smallest_grant))

# Which organization received the largest grant?

print(paste("The organization that received the largest grant was",
            grants[grants$total_amount == largest_grant,"organization"]))

# Which organization received the smallest grant?

print(paste("The organization that received the smallest grant was",
            grants[grants$total_amount == smallest_grant,"organization"]))

# How many grants were awarded in 2010?

print(paste("There were",
            sum(grants$start_year == 2010),
            "grants awarded in 2010"))
