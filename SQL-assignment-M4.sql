CREATE DATABASE MarketCO ;
use MarketCO ;


-- Q-1 --
CREATE TABLE Contact (
    CONTACT_ID INT PRIMARY KEY,
    COMPANY_ID INT,
    FIRST_NAME VARCHAR(45),
    LAST_NAME VARCHAR(45),
    STREET VARCHAR(45),
    CITY VARCHAR(45),
    STATE VARCHAR(2),
    ZIP VARCHAR(10),
    ISMAIN BOOLEAN,
    EMAIL VARCHAR(45),
    PHONE VARCHAR(12),
    FOREIGN KEY (COMPANY_ID) REFERENCES Company(COMPANY_ID)
);




-- Q-2 --
CREATE TABLE Employee (
    EMPLOYEE_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(45),
    LAST_NAME VARCHAR(45),
    SALARY DECIMAL(10,2),
    HIRE_DATE DATE,
    JOB_TITLE VARCHAR(25),
    EMAIL VARCHAR(45),
    PHONE VARCHAR(12)
);




-- Q-3--
CREATE TABLE ContactEmployee (
    CONTACTEMPLOYEE_ID INT PRIMARY KEY,
    CONTACT_ID INT,
    EMPLOYEE_ID INT,
    CONTACT_DATE DATE,
    DESCRIPTION VARCHAR(100),
    FOREIGN KEY (CONTACT_ID) REFERENCES Contact(CONTACT_ID),
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES Employee(EMPLOYEE_ID)
);

-- Q-NO.4 --
UPDATE Employee
SET PHONE = '215-555-8800'
WHERE FIRST_NAME = 'Lesley' AND LAST_NAME = 'Bland';


-- Q-NO.5--
UPDATE Company
SET COMPANY_NAME = 'Urban Outfitters, Inc.'
WHERE COMPANY_NAME = 'Urban Outfitters';




-- Q-NO.6 --
DELETE FROM ContactEmployee
WHERE CONTACTEMPLOYEE_ID = (
    SELECT ce.CONTACTEMPLOYEE_ID
    FROM ContactEmployee ce
    JOIN Contact c ON ce.CONTACT_ID = c.CONTACT_ID
    JOIN Employee e ON ce.EMPLOYEE_ID = e.EMPLOYEE_ID
    WHERE c.FIRST_NAME = 'Dianne' AND c.LAST_NAME = 'Connor'
      AND e.FIRST_NAME = 'Jack' AND e.LAST_NAME = 'Lee'
);



-- Q-NO.7 --
SELECT e.FIRST_NAME, e.LAST_NAME
FROM Employee e
JOIN ContactEmployee ce ON e.EMPLOYEE_ID = ce.EMPLOYEE_ID
JOIN Contact c ON ce.CONTACT_ID = c.CONTACT_ID
JOIN Company co ON c.COMPANY_ID = co.COMPANY_ID
WHERE co.COMPANY_NAME = 'Toll Brothers';





-- Q-NO-8 --
/* In SQL, the '%' and '_' operators are used with the LIKE statement to perform pattern matching in string comparisons. 
Here's what each operator signifies:

%....
The % wildcard represents zero or more characters. It can be used to match any sequence of characters in a string.
Example:
WHERE column_name LIKE 'A%' will match any string that starts with "A" (e.g., "Apple," "Almond").
WHERE column_name LIKE '%B' will match any string that ends with "B" (e.g., "Bob," "Cab") */




-- Q-NO.9 --

/* Normalization in the context of databases is a systematic process of organizing data to reduce redundancy and improve data integrity.
 The main goals of normalization are to:

1. *Eliminate Redundant Data*: By structuring data properly, normalization reduces duplication.
 For example, instead of storing the same customer information multiple times in different tables, you can store it in one place and reference it.

2. *Ensure Data Dependencies*: Normalization ensures that data dependencies make sense, meaning that each piece of data is stored logically. 
This helps maintain the accuracy and consistency of the data.

3. *Improve Data Integrity*: By reducing redundancy and organizing data into related tables,
 normalization helps maintain the integrity of the database.
 Changes to data only need to occur in one location, reducing the risk of inconsistencies. */





-- Q-NO.10 --
/*  In MySQL, a join is a SQL operation that combines rows from two or more tables based on a related column between them. 
Joins allow you to retrieve data that is spread across multiple tables, enabling more complex queries and relationships between data.*/





-- Q-NO.11 --
/*  DDL COMMAND 
DDL commands are used to define and manage all aspects of the database structure.
 These commands affect the schema of the database and its objects (like tables, indexes, and views).
 
 TYPES OF DDL COMMAND 
 1).CREATE
 2).DROP
 3).ALTER
 4).TRUNCATE
 
 DML COMMAND 
 DML commands are used to manipulate the data stored in the database. These commands allow users to insert, update, delete, and retrieve data.
 
 TYPES OF DML COMMAND
 1).INSERT
 2).UPDATE
 3).DELETE


DCL CPMMAND
DCL commands are used to control access to the data in the database. They are essential for managing permissions and security.

 TYPES OF DCL COMMAND
 1).GRANT
 2).REVOKE   */
 


 
 -- Q-NO.12 --
/*  Combining Data: The primary role of the JOIN clause is to combine rows from different tables based on a specified condition,
 typically involving primary and foreign keys.

Enhancing Queries: Joins allow for more comprehensive data retrieval,
 enabling you to get related information in a single query instead of multiple separate queries.

Defining Relationships: Joins help define and explore relationships between tables, such as one-to-one, one-to-many, and many-to-many. 

COMMON TYPES OF OF JOINS
1).INNER JOIN
2).LEFT JOIN
3).RIGHT JOIN
4).FULL OUTER JOIN
5).CROSS JOIN */
