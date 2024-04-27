# Solutions to generally easy but tricky problems in pandas

# DataFrame customers
# +-------------+--------+
# | Column Name | Type   |
# +-------------+--------+
# | customer_id | int    |
# | name        | object |
# | email       | object |
# +-------------+--------+
# There are some duplicate rows in the DataFrame based on the email column.

# Write a solution to remove these duplicate rows and keep only the first occurrence.


import pandas as pd

def dropDuplicateEmails(customers: pd.DataFrame) -> pd.DataFrame:
    return customers.drop_duplicates(subset=['email'])


# DataFrame students
# +-------------+--------+
# | Column Name | Type   |
# +-------------+--------+
# | student_id  | int    |
# | name        | object |
# | age         | int    |
# +-------------+--------+
# There are some rows having missing values in the name column.

# Write a solution to remove the rows with missing values.

# The result format is in the following example.

def dropMissingData(students: pd.DataFrame) -> pd.DataFrame:
    students.dropna(subset=['name'], inplace=True)
    return students


# DataFrame weather
# +-------------+--------+
# | Column Name | Type   |
# +-------------+--------+
# | city        | object |
# | month       | object |
# | temperature | int    |
# +-------------+--------+
# Write a solution to pivot the data so that each row represents temperatures for a specific month, and each city is a separate column.

def pivotTable(weather: pd.DataFrame) -> pd.DataFrame:
    return pd.pivot_table(weather, index='month', columns='city', values='temperature', aggfunc='max')


# DataFrame report
# +-------------+--------+
# | Column Name | Type   |
# +-------------+--------+
# | product     | object |
# | quarter_1   | int    |
# | quarter_2   | int    |
# | quarter_3   | int    |
# | quarter_4   | int    |
# +-------------+--------+
# Write a solution to reshape the data so that each row represents sales data for a product in a specific quarter.

# The result format is in the following example.

 

# Example 1:

# Input:
# +-------------+-----------+-----------+-----------+-----------+
# | product     | quarter_1 | quarter_2 | quarter_3 | quarter_4 |
# +-------------+-----------+-----------+-----------+-----------+
# | Umbrella    | 417       | 224       | 379       | 611       |
# | SleepingBag | 800       | 936       | 93        | 875       |
# +-------------+-----------+-----------+-----------+-----------+
# Output:
# +-------------+-----------+-------+
# | product     | quarter   | sales |
# +-------------+-----------+-------+
# | Umbrella    | quarter_1 | 417   |
# | SleepingBag | quarter_1 | 800   |
# | Umbrella    | quarter_2 | 224   |
# | SleepingBag | quarter_2 | 936   |
# | Umbrella    | quarter_3 | 379   |
# | SleepingBag | quarter_3 | 93    |
# | Umbrella    | quarter_4 | 611   |
# | SleepingBag | quarter_4 | 875   |
# +-------------+-----------+-------+

def meltTable(report: pd.DataFrame) -> pd.DataFrame:
    return pd.melt(report, id_vars='product', var_name='quarter', value_name='sales')


# DataFrame animals
# +-------------+--------+
# | Column Name | Type   |
# +-------------+--------+
# | name        | object |
# | species     | object |
# | age         | int    |
# | weight      | int    |
# +-------------+--------+
# Write a solution to list the names of animals that weigh strictly more than 100 kilograms.

# Return the animals sorted by weight in descending order.

# The result format is in the following example.

 

# Example 1:

# Input: 
# DataFrame animals:
# +----------+---------+-----+--------+
# | name     | species | age | weight |
# +----------+---------+-----+--------+
# | Tatiana  | Snake   | 98  | 464    |
# | Khaled   | Giraffe | 50  | 41     |
# | Alex     | Leopard | 6   | 328    |
# | Jonathan | Monkey  | 45  | 463    |
# | Stefan   | Bear    | 100 | 50     |
# | Tommy    | Panda   | 26  | 349    |
# +----------+---------+-----+--------+
# Output: 
# +----------+
# | name     |
# +----------+
# | Tatiana  |
# | Jonathan |
# | Tommy    |
# | Alex     |
# +----------+

def findHeavyAnimals(animals: pd.DataFrame) -> pd.DataFrame:
    return animals[animals['weight'] > 100].sort_values('weight', ascending=False)[['name']]
