-- Simple SELECT query
SELECT 
   CustomerName,
   Country 
FROM tutoring.customers;

# Single Line Comment
-- This is also single line comment
-- SELECT everything FROM table
SELECT * FROM tutoring.customers;

/* This is a multiline comment
 * Below query retrieves DISTINCT countries
 */
 SELECT
    DISTINCT Country 
FROM tutoring.customers;

-- LIMIT Clause
SELECT * FROM tutoring.customers LIMIT 4;

-- WHERE Clause
SELECT * FROM tutoring.customers
WHERE Country = 'Mexico';

-- WHERE Clause Multiple Conditions
SELECT * FROM tutoring.customers
WHERE NOT(Country = 'Germany' OR City = 'Berlin')
LIMIT 4;
