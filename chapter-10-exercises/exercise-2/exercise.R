# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"

employees <- paste("Employee", 1:100)

# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000

salary_2017 <- round(runif(100, 40000, 50000),2)

# Create a vector of 100 annual salary adjustments between -5000 and 10000.
# (A negative number represents a salary decrease due to corporate greed)
# Again use the `runif()` function to pick 100 random numbers in that range.

salary_adjustments <- round(runif(100, -5000, 10000),2)

# Create a data frame `salaries` by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!

salaries <- data.frame(employees, salary_2017, salary_adjustments,
                       stringsAsFactors = FALSE)

# Add a column to the `salaries` data frame that represents each person's
# salary in 2018 (e.g., with the salary adjustment added in).

salaries$salary_2018 <- salaries$salary_2017 + salaries$salary_adjustments

# Add a column to the `salaries` data frame that has a value of `TRUE` if the 
# person got a raise (their salary went up)

salaries$increase <- (salaries$salary_adjustments >0)

### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of Employee 57

print(paste("The 2018 salary of employee 57 was", salaries[57,"salary_2018"]))

# How many employees got a raise?

print(paste(sum(salaries$increase), "employees received a raise in 2018"))

# What was the dollar value of the highest raise?

print(paste("The highest dollar value raise received was", max(salaries$salary_adjustments)))

# What was the "name" of the employee who received the highest raise?

largest_increase <- max(salaries$salary_adjustments)
lucky_name <- salaries[salaries$salary_adjustments == largest_increase, "employees"]
print(paste("The employee with the largest increase was", lucky_name))

# What was the largest decrease in salaries between the two years?

print(paste("The largest decrease in salaries between the two years was",min(salaries$salary_adjustments)))

# What was the name of the employee who recieved largest decrease in salary?

largest_decrease <- min(salaries$salary_adjustments)
unlucky_name <- salaries[salaries$salary_adjustments == largest_decrease, "employees"]
print(paste("The employee with the largest decrease was", unlucky_name))

# What was the average salary change?

print(paste("The average salary change was",round(mean(salaries$salary_adjustments),2)))

# For people who did not get a raise, how much money did they lose on average?

print(paste("The average salary change among those who did not get a raise was",
            round(mean(salaries[salaries$increase == FALSE,"salary_adjustments"]),2)))

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?

# Yes. The first average is approximately equal to the midpoint of the two endpoints
# that we used to define the salaries, and the second average is the midpoint of 0 and
# -5000 (which were the endpoints of the range we considered for that average)

# Write a .csv file of your salary data to your working directory

colnames(salaries)[1] <- "name"
write.csv(salaries, "salaries.csv", row.names = FALSE)
