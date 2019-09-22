# Exercise 3: working with built-in data sets

# Load R's "USPersonalExpenditure" dataset using the `data()` function
# This will produce a data frame called `USPersonalExpenditure`

data("USPersonalExpenditure")

# The variable `USPersonalExpenditure` is now accessible to you. Unfortunately,
# it's not a data frame (it's actually what is called a matrix)
# Test this using the `is.data.frame()` function

print(paste("Is USPersonalExpenditure a data frame?", is.data.frame(USPersonalExpenditure)))

# Luckily, you can pass the USPersonalExpenditure variable as an argument to the
# `data.frame()` function to convert it a data farm. Do this, storing the
# result in a new variable

US_df <- data.frame(USPersonalExpenditure)

# What are the column names of your dataframe?

print(colnames(US_df))

## Consider: why are they so strange? Think about whether you could use a number 
## like 1940 with dollar notation!

# They are strange because R has added an X at the beginning of them.
# This is because R does not allow columns of dataframes to start with
# numbers.

# What are the row names of your dataframe?

print(rownames(US_df))

# Add a column "category" to your data frame that contains the rownames

US_df$category <- rownames(US_df)

# How much money was spent on personal care in 1940?

print(paste("In 1940,", US_df["Personal Care","X1940"],
            "billion USD (?) was spent on personal care."))

# How much money was spent on Food and Tobacco in 1960?

print(paste("In 1960,", US_df["Food and Tobacco", "X1960"],
            "billion USD (?) was spent on food and tobacco."))

# What was the highest expenditure category in 1960?

print(paste("The highest expenditure category in 1960 was",
            US_df[US_df$X1960 == min(US_df$X1960),"category"]))

# Define a function `lowest_category` that takes in a year as a parameter, and
# returns the lowest spending category of that year

lowest_category <- function(year){
  min_for_year <- (US_df[[year]] == min(US_df[[year]]))
  return(US_df[min_for_year,"category"])
}

# Using your function, determine the lowest spending category of each year
# Hint: use the `sapply()` function to apply your function to a vector of years

years <- colnames(US_df)[1:length(colnames(US_df))-1]
categories <- sapply(years, lowest_category)

for(i in 1:length(years)){
  print(paste("In the year",
              years[i],
              "the category with lowest expenditure was",
              categories[i]))
}