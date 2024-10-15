Create database Library;
Use Library;

Create table Branch(Branch_no INT PRIMARY KEY,
Manager_Id INT,
Branch_Address VARCHAR(50),
Contact_NO BIGINT);

Create table Employee( Emp_Id INT PRIMARY KEY,
  Emp_name VARCHAR(100),
  Position VARCHAR(50),
  Salary DECIMAL(10, 2),
  Branch_no INT,
  FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE Books (ISBN VARCHAR(20) PRIMARY KEY,
  Book_title VARCHAR(100),
  Category VARCHAR(50),
  Rental_Price DECIMAL(10, 2),
  Status VARCHAR(3) CHECK(Status IN ('yes', 'no')),
  Author VARCHAR(100),
  Publisher VARCHAR(100)
);

CREATE TABLE Customer (
  Customer_Id INT PRIMARY KEY,
  Customer_name VARCHAR(50),
  Customer_address VARCHAR(50),
  Reg_date DATE);
  
  CREATE TABLE IssueStatus (
  Issue_Id INT PRIMARY KEY,
  Issued_cust INT,
  Issued_book_name VARCHAR(50),
  Issue_date DATE,
  Isbn_book VARCHAR(20),
  FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
  Return_Id INT PRIMARY KEY,
  Return_cust INT,
  Return_book_name VARCHAR(50),
  Return_date DATE,
  Isbn_book2 VARCHAR(20),
  FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
desc branch;
desc employee;
desc books;
desc customer;
desc issuestatus;
desc returnstatus;

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, '123 Main St, New York', '9856321467'),
(2, 102, '456 Elm St, Chicago', '7563215687'),
(3, 103, '789 Oak St, Los Angeles', '8654796321'),
(4, 104, '321 Pine St, Houston', '9986472348'),
(5, 105, '901 Maple St, Phoenix', '8854761258'),
(6, 106, '234 Cedar St, Dallas', '9744555631'),
(7, 107, '567 Cypress St, San Francisco', '7566641238'),
(8, 108, '890 Walnut St, Seattle', '9965411175'),
(9, 109, '345 Spruce St, Miami', '8866541237'),
(10, 110, '678 Fir St, Boston', '9654123756');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(1, 'David John', 'Manager', 60000, 1),
(2, 'Jane Andrews', 'Assistant', 40000, 1),
(3, 'Bob Johnson', 'Librarian', 50000, 2),
(4, 'Maria Rodriguez', 'Clerk', 35000, 3),
(5, 'Jhon Leo', 'IT Specialist', 70000, 1),
(6, 'Francis Chen', 'Librarian', 45000, 1),
(7, 'Kevin Peter', 'Manager', 65000, 6),
(8, 'Sarah Taylor', 'Assistant', 38000, 7),
(9, 'Farhana Musthafa', 'Clerk', 32000, 1),
(10, 'Laura Davis', 'Librarian', 42000, 9),
(11, 'Muhammad Riyas', 'IT Specialist', 50000, 10),
(12, 'Jancy Rani', 'Manager', 48000, 4),
(13, 'Michael Roy', 'Clerk', 52000, 2),
(14, 'Abraam Qureshi', 'Assistant', 60000, 8),
(15, 'Kenzie Tylor', 'Librarian', 55000, 1);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('555631463', 'To Kill a Mockingbird', 'Fiction', 15.50, 'yes', 'Harper Lee', 'Penguin'),
('987654321', 'The Great Gatsby', 'History', 26.25, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('447932155', 'The Hunger Games', 'Young Adult', 30.99, 'No', 'Suzanne Collins', 'Scholastic'),
('111136547', 'Pride and Prejudice', 'Romance', 18.50, 'yes', 'Jane Austen', 'Penguin'),
('997846314', 'The Catcher in the Rye', 'Classic', 10.40, 'yes', 'J.D. Salinger', 'Little, Brown'),
('449874522', 'The Alchemist', 'Fantasy', 27.60, 'No', 'Paulo Coelho', 'HarperCollins'),
('255576300', 'The Handmaid\'s Tale', 'Dystopian', 25.99, 'yes', 'Margaret Atwood', 'Houghton Mifflin'),
('004560576', 'The Nightingale', 'History', 32.50, 'yes', 'Kristin Hannah', 'St. Martin\'s Press'),
('778900014', 'The Immortal Life', 'Non-Fiction', 20.00, 'yes', 'Rebecca Skloot', 'W.W. Norton'),
('800367788', 'The Power', 'Science Fiction', 10.99, 'No', 'Naomi Alderman', 'Little, Brown');

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(1, 'Anney Joy', '123 Main St, New York', '2022-03-01'),
(2, 'Steve Smith', '456 Elm St, Chicago', '2020-02-22'),
(3, 'Ben Johnson', '789 Oak St, Los Angeles', '2021-12-15'),
(4, 'Maria Eyob', '321 Pine St, Houston', '2019-04-09'),
(5, 'Stan Lee', '901 Maple St, Phoenix', '2023-05-01'),
(6, 'Thomas Cook', '234 Cedar St, Dallas', '2021-06-30'),
(7, 'Kevin Debryn', '567 Cypress St, San Francisco', '2021-11-05'),
(8, 'Cathy Heaven', '890 Walnut St, Seattle', '2020-08-03'),
(9, 'Sheena Ryder', '345 Spruce St, Miami', '2021-11-11'),
(10, 'Lauren Philiph', '678 Fir St, Boston', '2019-10-01');

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1, 3, 'To Kill a Mockingbird', '2021-01-01', '555631463'),
(2, 2, 'The Great Gatsby', '2020-01-15', '987654321'),
(3, 3, 'The Hunger Games', '2022-02-20', '447932155'),
(4, 4, 'Pride and Prejudice', '2020-03-05', '111136547'),
(5, 2, 'The Catcher in the Rye', '2022-04-30', '997846314'),
(6, 5, 'The Alchemist', '2019-05-14', '449874522'),
(7, 7, 'The Handmaid\'s Tale', '2023-06-23', '255576300'),
(8, 2, 'The Nightingale', '2022-07-10', '004560576'),
(9, 9, 'The Immortal Life', '2023-06-25', '778900014'),
(10, 4, 'The Power', '2021-10-12', '800367788');

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(1, 3, 'To Kill a Mockingbird', '2021-01-15', '555631463'),
(2, 2, 'The Great Gatsby', '2020-02-10', '987654321'),
(3, 3, 'The Hunger Games', '2022-03-07', '447932155'),
(4, 4, 'Pride and Prejudice', '2020-04-10', '111136547'),
(5, 2, 'The Catcher in the Rye', '2022-05-25', '997846314'),
(6, 5, 'The Alchemist', '2019-06-01', '449874522'),
(7, 7, 'The Handmaid\'s Tale', '2023-07-15', '255576300'),
(8, 2, 'The Nightingale', '2022-08-05', '004560576'),
(9, 9, 'The Immortal Life', '2023-09-20', '778900014'),
(10, 4, 'The Power', '2021-11-15', '800367788');

-- Retrieve the book title, category, and rental price of all available books
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

--  List the employee names and their respective salaries in descending order of salary
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

-- Retrieve the book titles and the corresponding customers who have issued those books
SELECT B.Book_title, C.Customer_name
FROM Books B
JOIN IssueStatus I ON B.ISBN = I.Isbn_book
JOIN Customer C ON I.Issued_cust = C.Customer_Id;

-- Display the total count of books in each category
SELECT Category, COUNT(*) AS Book_Count
FROM Books
GROUP BY Category;

-- Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

--  List the customer names who registered before 2022-01-01 and have not issued any books yet
SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- Display the branch numbers and the total count of employees in each branch
SELECT Branch_no, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_no;

--  Display the names of customers who have issued books in the month of June 2023
SELECT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE MONTH(Issue_date) = 6 AND YEAR(Issue_date) = 2023;

--  Retrieve book_title from book table containing history
SELECT Book_title
FROM Books
WHERE category LIKE '%history%';

-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_no, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

-- Retrieve the names of employees who manage branches and their respective branch addresses
SELECT E.Emp_name, B.Branch_address
FROM Employee E
JOIN Branch B ON E.Branch_no = B.Branch_no
WHERE E.Position = 'Manager';

-- Display the names of customers who have issued books with a rental price higher than Rs 25
SELECT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
JOIN Books B ON I.Isbn_book = B.ISBN
WHERE B.Rental_Price > 25;





























