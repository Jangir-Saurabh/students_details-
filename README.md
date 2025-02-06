# Students Details Analysis SQL Project

## Project Overview
**Level**: Beginner  
**Database**: `Classes`

This project focuses on managing student details, payments, and courses using PostgreSQL. The dataset contains information about students, their states, email IDs, course prices, payment details, and order IDs. Various SQL queries were performed to extract insights and transform data efficiently.

## Key Tasks Completed:

# 1. Database Setup
- **Database Creation**: The project starts by creating a database named `classes`.
  
  `create database classes;`
  
- **Table Creation**:
  
 `create table students_details (
create table student_details (srno INT,
order_id varchar(30) PRIMARY KEY,
student_name varchar(30),
payment_date date,
course_name varchar(20),
price money,
payment_status varchar(20),
payment_id varchar(30),
email varchar(100),
state varchar(20)
);`

- import student_details Csv File

# 2. Data Exploration

#Basic Queries

--Q1- Retrieve all details of students.

`select * from students_details;`

-- Q2 Select only the student_name and state columns.

`select student_name, state from students_details;`

-- Q3 Retrieve details of students who enrolled in the "SQL" course.

`select * from students_details
where upper(course_name) = 'SQL';`

---Q 4 Fetch details of students whose email ends with "outlook.com".

`SELECT * FROM STUDENTS_DETAILS
WHERE EMAIL LIKE '%@outlook.com';`

#Aggregate Functions

Q5  Count the number of distinct students (student_name).

`SELECT  COUNT( DISTINCT STUDENT_NAME)
FROM STUDENTS_DETAILS;`

-- Q6 Group by state and find the number of students from each state.

`SELECT STATE, COUNT(ORDER_ID) AS TOTAL_ORDER
FROM STUDENTS_DETAILS
GROUP BY STATE;`

#Filtering with WHERE

--Q7	Find records where price is between 3000 and 6000.

`SELECT * FROM STUDENTS_DETAILS
WHERE PRICE BETWEEN 3000 AND 6000;`

--Q8 Find students whose names have exactly 5 characters.

`SELECT STUDENT_NAME FROM STUDENTS_DETAILS
WHERE length(STUDENT_NAME) = 5;`

#String Functions

--Q9 Replace "Advance" with "Basic" in course_name.

`SELECT course_name, replace(course_name, 'Advance', 'Basic') as update_course_name
FROM STUDENTS_DETAILS
where course_name= 'Advance Excel';`
 
📜	 /*Note:- If you want to update the table permanently, 
	 use: 
	 UPDATE students_details
	 SET course_name = REPLACE(course_name, 'Advance', 'Basic')
	 WHERE course_name LIKE '%Advance%';*/

#Date Functions

--Q10  Retrieve records where payment_date is on a weekend.

`SELECT * FROM STUDENTS_DETAILS
WHERE EXTRACT(DOW FROM PAYMENT_DATE) IN (0,6);`

📜 Note Sunday  = 0, Saturday = 6 code use

--Q11 Find students who paid on the first day of any month.

`SELECT * FROM STUDENTS_DETAILS
WHERE DATE_PART('DAY',PAYMENT_DATE) = 1`


--Q46 Extract the year, Month And Date from payment_date.

`SELECT PAYMENT_DATE, 
	EXTRACT( 'Day' from payment_date),
	EXTRACT('MONTH' FROM PAYMENT_DATE), 
	EXTRACT('YEAR' FROM PAYMENT_DATE)
FROM STUDENTS_DETAILS;`

📜	/* Note ;- Second Type You can use either one ( extract, Day_part)
	SELECT PAYMENT_DATE, 
	DATE_PART('YEAR',PAYMENT_DATE), 
	DATE_PART('MONTH',PAYMENT_DATE), 
	DATE_PART('Day',PAYMENT_DATE)
	FROM STUDENTS_DETAILS;*/

# 📊 Summary of Learnings & Impact:

Through this project, I enhanced my skills in:

✅ Writing complex SQL queries (Filtering, Aggregation, Joins, Date & String Functions). more than 100 type of question cowered.

✅ Data Cleaning & Transformation in PostgreSQL.

✅ Extracting useful insights from raw student data.

✅ Managing real-world datasets using relational databases.


# 📌 How to Use This Project?

🖍️ Import the dataset into PostgreSQL.

🖍️ Run SQL queries from the queries/ folder.

🖍️ Modify queries as per your requirement for better insights.































