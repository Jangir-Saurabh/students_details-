
							--	Basic Queries


-- Q1 Retrieve all details of students.
select * from students_details;

-- Q2 Select only the student_name and state columns.
select student_name, state from students_details;

-- Q3 Fetch records where the payment_status is "captured".
select * from students_details
where lower(payment_status) = 'captured' ;

-- Q4 Retrieve details of students who enrolled in the "SQL" course.
select * from students_details
where upper(course_name) = 'SQL' ;

-- Q5 Find students who paid more than 5000 for a course.
select * from students_details
where PRICE > 5000 ;

--Q6 Display distinct course_name values.
SELECT DISTINCT (COURSE_NAME ) FROM STUDENTS_DETAILS;


-- Q7 Find the number of distinct states represented in the dataset.
SELECT COUNT( DISTINCT (STATE )) AS TOTAL_STATE FROM STUDENTS_DETAILS;

-- Q8 Retrieve records where the payment_date is "01-07-23".
SELECT * FROM STUDENTS_DETAILS
WHERE PAYMENT_DATE = '2023-07-01'

-- Q9 Fetch details of students whose email ends with "outlook.com".
SELECT * FROM STUDENTS_DETAILS
WHERE EMAIL LIKE '%@outlook.com';

-- Q10 Find all students whose state starts with "K".
SELECT * FROM STUDENTS_DETAILS
WHERE STATE LIKE 'K%';


		                          		-- Aggregate Functions


-- Q11 Count the total number of records in the table.
SELECT COUNT(*) FROM STUDENTS_DETAILS;


-- Q12 Calculate the total revenue from all captured payments.
SELECT SUM(PRICE) FROM STUDENTS_DETAILS
WHERE UPPER(PAYMENT_STATUS) = 'CAPTURED' ;

-- Q13 SELECT SUM(PRICE) FROM STUDENTS_DETAILSFind the average price of courses.
SELECT AVG(PRICE)AS AVERAGES FROM STUDENTS_DETAILS


-- Q14 Get the maximum price of any course.
SELECT MAX(PRICE) FROM STUDENTS_DETAILS


--Q15 Find the minimum price of any course.
SELECT MIN(PRICE) FROM STUDENTS_DETAILS


-- Q16 Count how many students failed their payment.
SELECT COUNT(PAYMENT_STATUS) FROM STUDENTS_DETAILS
WHERE UPPER(PAYMENT_STATUS) = 'FAILED';


-- Q17 Group the data by course_name and calculate the total revenue for each course.
SELECT COURSE_NAME, SUM(PRICE) AS TOTAL_AMOUNT
FROM STUDENTS_DETAILS
GROUP BY COURSE_NAME;


-- Q18 Group by state and find the number of students from each state.
SELECT STATE, COUNT(ORDER_ID) AS TOTAL_ORDER
FROM STUDENTS_DETAILS
GROUP BY STATE 
ORDER BY COUNT(ORDER_ID) DESC;

--	Q19 Calculate the average payment amount for each payment_status.
SELECT PAYMENT_STATUS, AVG(PRICE) 
FROM STUDENTS_DETAILS
GROUP BY PAYMENT_STATUS;

-- Q20 Count the number of distinct students (student_name).
SELECT  COUNT( DISTINCT STUDENT_NAME)
FROM STUDENTS_DETAILS


									-- Filtering with WHERE

									

--Q21 	Find records where price is between 3000 and 6000.
SELECT * FROM STUDENTS_DETAILS
WHERE PRICE BETWEEN 3000 AND 6000;


-- Q22 Retrieve details of students who paid for either "Google Sheets" or "Advance Excel".
SELECT * FROM STUDENTS_DETAILS
WHERE   UPPER(COURSE_NAME) = 'ADVANCE EXCEL' OR  UPPER(COURSE_NAME) = 'GOOGLE SHEETS'

-- Q23 Fetch records where student_name contains "Kumar".
SELECT * FROM STUDENTS_DETAILS
WHERE UPPER(STUDENT_NAME) LIKE '% KUMAR %';


--Q24 Find all students from the state "Uttar Pradesh".
SELECT * FROM STUDENTS_DETAILS
WHERE state = 'Uttar Pradesh';

--Q25 Retrieve details where payment_status is not "captured".
SELECT * FROM STUDENTS_DETAILS
WHERE NOT UPPER(PAYMENT_STATUS) = 'CAPTURED'

--Q26 Find students whose price is greater than 8000.
SELECT * FROM STUDENTS_DETAILS
WHERE PRICE> 8000;

-- Q27	Fetch records where the payment_id starts with "tra_M8F".
SELECT * FROM STUDENTS_DETAILS
WHERE (PAYMENT_ID) LIKE '%tra_M8F%' ;

--Q28 Retrieve records where order_id contains the digit "8".
SELECT * FROM STUDENTS_DETAILS
WHERE ORDER_ID LIKE '%8%';

-- Q29 	Select all records where email contains ".com".
SELECT * FROM STUDENTS_DETAILS
WHERE EMAIL LIKE '%.com';

--Q30 Find students whose names have exactly 5 characters.
SELECT STUDENT_NAME FROM STUDENTS_DETAILS
WHERE length(STUDENT_NAME) = 5; 

	
					-- Sorting

--Q31 Retrieve all records sorted by payment_date in ascending order.
SELECT * FROM STUDENTS_DETAILS
ORDER BY PAYMENT_DATE ASC;



--Q32 Display records sorted by price in descending order.
SELECT * FROM STUDENTS_DETAILS
ORDER BY PRICE DESC;

-- Q33 Fetch records ordered by state, then by student_name.
SELECT STATE, STUDENT_NAME FROM STUDENTS_DETAILS
ORDER BY STATE  ASC, STUDENT_NAME ASC;

--Q34 Sort records by course_name alphabetically.
SELECT * FROM STUDENTS_DETAILS
ORDER BY COURSE_NAME ASC;


--Q35 List all students in descending order of their price.
SELECT STUDENT_NAME, PRICE,COURSE_NAME FROM STUDENTS_DETAILS
ORDER BY PRICE DESC;


			-- String Functions
--Q36 Extract the first 5 characters from student_name.
SELECT STUDENT_NAME FROM STUDENTS_DETAILS
WHERE LENGTH(student_name) = 5;

--Q37 Convert all student_name values to uppercase.
SELECT UPPER(STUDENT_NAME) FROM STUDENTS_DETAILS; 

--38 Find the length of the order_id for each record.
select order_id,length(order_id) as length from students_details

--Q39 Replace "Advance" with "Basic" in course_name.
SELECT course_name,replace(course_name, 'Advance', 'Basic') as update_course_name
FROM STUDENTS_DETAILS
where course_name= 'Advance Excel';
 
	 /*Note:- If you want to update the table permanently, 
	 use: 
	 UPDATE students_details
	 SET course_name = REPLACE(course_name, 'Advance', 'Basic')
	 WHERE course_name LIKE '%Advance%';*/


---	Q40 Concatenate student_name and state into a single column.
SELECT STUDENT_NAME, STATE, 
STUDENT_NAME || ', ' || STATE AS STUDEN_STATE
FROM STUDENTS_DETAILS;


--Q41  Extract the domain (e.g., "outlook.com") from email.
select email, substring(email from position('@' in email)+1)
from students_details;


-- Q42 Pad the order_id with leading zeroes up to 20 characters.
select order_id, Lpad(order_id, 20, '0')
from students_details;

--Q43 Remove all spaces from student_name.
Select Student_name, Replace(student_name, ' ','') as Rename
from students_details

-- Q44 Check if email ends with "gmail.com".
select email from students_details
where email like '%gmail.com' ;

-- Q45 Find how many students have "ra" in their names.
select count(student_name) as total_student from students_details
where student_name like '%ra%';


						-- Date Functions
--Q46 Extract the year, Month And Date from payment_date 
SELECT PAYMENT_DATE, 
	EXTRACT( 'Day' from payment_date),
	EXTRACT('MONTH' FROM PAYMENT_DATE), 
	EXTRACT('YEAR' FROM PAYMENT_DATE)
FROM STUDENTS_DETAILS;

	/* Note ;- Second Type You can use either one ( extract, Day_part)
	SELECT PAYMENT_DATE, 
	DATE_PART('YEAR',PAYMENT_DATE), 
	DATE_PART('MONTH',PAYMENT_DATE), 
	DATE_PART('Day',PAYMENT_DATE)
	FROM STUDENTS_DETAILS;*/

-- Q47 Find records where payment_date is in July.
SELECT * FROM STUDENTS_DETAILS
WHERE EXTRACT (MONTH FROM PAYMENT_DATE) = 7;

-- Q48 Calculate how many days have passed since payment_date.
SELECT PAYMENT_DATE, CURRENT_DATE, CURRENT_DATE - PAYMENT_DATE AS DAY_PASS
FROM STUDENTS_DETAILS;


-- Q49 Convert payment_date into a different format (e.g., "YYYY-MM-DD").
SELECT PAYMENT_DATE, TO_CHAR(PAYMENT_DATE, 'dd-mm-yyyy') AS FORMATTED_DATE
FROM STUDENTS_DETAILS;


--Q50  Retrieve records where payment_date is on a weekend.
SELECT * FROM STUDENTS_DETAILS
WHERE EXTRACT(DOW FROM PAYMENT_DATE) IN (0,6);

--Q51 Get the month name from payment_date.
SELECT PAYMENT_DATE, TO_CHAR(PAYMENT_DATE,'MONTH')
FROM STUDENTS_DETAILS

-- Q52 Add 7 days to each payment_date.
SELECT PAYMENT_DATE, PAYMENT_DATE + INTERVAL '7 DAYS' AS NEW_DATE
FROM STUDENTS_DETAILS;


--Q53 Find students who paid on the first day of any month.
SELECT * FROM STUDENTS_DETAILS
WHERE DATE_PART('DAY',PAYMENT_DATE) = 1

