-- Basic level --

# Fetch all employees:
select * from employee;

# Find employees from a specific city ( Mumbai):
SELECT *
FROM employee
WHERE City = 'New Delhi';


# List employees who are above 30 years old:
SELECT * 
FROM employee 
WHERE Age > 30;

# Get the count of employees who have never been benched:
SELECT COUNT(*) 
FROM employee 
WHERE EverBenched = 'No';
 
# Find the youngest employee:
SELECT * 
FROM employee 
ORDER BY Age ASC 
LIMIT 1;

# List employees who joined after 2015:
SELECT * 
FROM employee 
WHERE JoiningYear > 2015;

# Find all employees in Payment Tier 3:
SELECT * 
FROM employee 
WHERE PaymentTier = 3;

# Get the total number of employees:
SELECT COUNT(*) 
FROM employee;

-- List employees who left the company:
SELECT * 
FROM employee 
WHERE LeaveOrNot = 1;

 -- Fetch employees by gender (Male):
SELECT *
FROM employee 
WHERE Gender = 'Male';


-- Intermediate level --


--  Find the oldest employee(s) who have never been benched:
SELECT * 
FROM employee
WHERE EverBenched = 'No'
ORDER BY Age DESC
LIMIT 1;


--  Get the average experience in each city:
SELECT City, AVG(ExperienceInCurrentDomain) AS AvgExperience
FROM employee
GROUP BY City;


--  List employees who are in the top 5 oldest employees in the company:
SELECT * 
FROM employee
ORDER BY Age DESC
LIMIT 5;


--  Find employees who have more than 15 years of experience and are not in Payment Tier 3:
SELECT * 
FROM employee
WHERE ExperienceInCurrentDomain > 15 AND PaymentTier != 3;


--  List the top 3 cities with the highest average experience:
SELECT City, AVG(ExperienceInCurrentDomain) AS AvgExperience
FROM employee
GROUP BY City
ORDER BY AvgExperience DESC
LIMIT 3;


--  Identify the gender distribution across each payment tier:
SELECT PaymentTier, count(Gender) , Gender
FROM employee
GROUP BY PaymentTier, Gender;


-- Compare Salary Based on Experience in Current Domain for Same Gender:
SELECT e.Education, e.ExperienceInCurrentDomain, s.Salary
FROM employee e
JOIN salary s
ON e.Gender = s.Gender
WHERE e.ExperienceInCurrentDomain > 5 AND s.Salary < 60000
ORDER BY e.ExperienceInCurrentDomain DESC, s.Salary ASC;


-- Identify Employees with High Salary and Higher Payment Tier
SELECT e.City, e.PaymentTier, s.Salary, s.FirstName
FROM employee e
JOIN salary s
ON e.Gender = s.Gender
WHERE e.PaymentTier = 3 AND s.Salary > 80000
ORDER BY s.Salary DESC;


-- Senior Management vs Non-Senior Management Salary Comparison
SELECT s.SeniorManagement, AVG(s.Salary) AS Avg_Salary
FROM salary s
JOIN employee e
ON e.Gender = s.Gender
GROUP BY s.SeniorManagement
ORDER BY Avg_Salary DESC;

