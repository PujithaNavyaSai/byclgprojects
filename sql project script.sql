CREATE DATABASE IF NOT EXISTS Online_Book_Publishing_1;
USE Online_Book_Publishing_1;

CREATE TABLE publisher_1 (
    PublisherID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contactDetails VARCHAR(250)
);

CREATE TABLE book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    ISBN VARCHAR(20) NOT NULL,
    Edition INT NOT NULL,
    PublicationYear INT,
    Price DECIMAL(10,2),
    PublisherID INT,
    FOREIGN KEY (PublisherID) REFERENCES publisher_1(PublisherID)
);

CREATE TABLE Genre_1 (
    GenreID INT PRIMARY KEY,
    GenreName VARCHAR(100) NOT NULL
);

CREATE TABLE BookGenre_1 (
    BookID INT,
    GenreID INT,
    PRIMARY KEY (BookID, GenreID),
    FOREIGN KEY (BookID) REFERENCES book(BookID),
    FOREIGN KEY (GenreID) REFERENCES Genre_1(GenreID)
);

CREATE TABLE Author_1 (
    AuthorID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    Biography TEXT
);

CREATE TABLE BookAuthor_1 (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES book(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Author_1(AuthorID)
);

CREATE TABLE Customer_1 (
    CustomerID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Address_1 (
    AddressID INT PRIMARY KEY,
    CustomerID INT,
    Street VARCHAR(100),
    City VARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customer_1(CustomerID)
);

CREATE TABLE Wishlist_1 (
    CustomerID INT,
    BookID INT,
    PRIMARY KEY (CustomerID, BookID),
    FOREIGN KEY (CustomerID) REFERENCES Customer_1(CustomerID),
    FOREIGN KEY (BookID) REFERENCES book(BookID)
);

CREATE TABLE Order_1 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customer_1(CustomerID)
);

CREATE TABLE OrderItem_1 (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    BookID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Order_1(OrderID),
    FOREIGN KEY (BookID) REFERENCES book(BookID)
);

CREATE TABLE Review_1 (
    ReviewID INT PRIMARY KEY,
    CustomerID INT,
    BookID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    ReviewText TEXT,
    ReviewDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer_1(CustomerID),
    FOREIGN KEY (BookID) REFERENCES book(BookID)
);

CREATE TABLE Payment_1 (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Order_1(OrderID)
);

CREATE TABLE Employee_1 (
    EmployeeID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    Role VARCHAR(100),
    Salary DECIMAL(10,2),
    HireDate DATE
);

INSERT INTO publisher_1 VALUES
(1, 'Pearson', 'pearson@example.com'),
(2, 'Penguin', 'contact@penguin.com'),
(3, 'HarperCollins', 'info@harpercollins.com');

INSERT INTO book VALUES
(101, 'Learn SQL', '123-ABC', 1, 2023, 299.99, 1),
(102, 'Python Basics', '456-DEF', 2, 2022, 399.00, 1),
(103, 'The Silent Patient', '789-GHI', 1, 2019, 250.75, 2),
(104, 'AI for Beginners', '101-JKL', 1, 2024, 499.50, 3),
(105, 'Database Design', '202-MNO', 3, 2021, 350.00, 1);

INSERT INTO Genre_1 VALUES
(1, 'Technology'),
(2, 'Education'),
(3, 'Fiction'),
(4, 'Psychology'),
(5, 'Science');

INSERT INTO BookGenre_1 VALUES
(101, 1), (101, 2),
(102, 1), (102, 2),
(103, 3), (103, 4),
(104, 1), (104, 5),
(105, 1), (105, 2);

INSERT INTO Author_1 VALUES
(1, 'John Doe', 'Expert in Databases'),
(2, 'Jane Smith', 'Python Developer and Trainer'),
(3, 'Alex Michaelides', 'Psychologist turned novelist'),
(4, 'Sam Wilson', 'AI researcher and author'),
(5, 'Priya Sharma', 'Educator and Tech Writer');

INSERT INTO BookAuthor_1 VALUES
(101, 1),
(102, 2),
(103, 3),
(104, 4),
(105, 1),
(105, 5);

INSERT INTO Customer_1 VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO Address_1 VALUES
(1, 1, '123 Main St', 'Mumbai'),
(2, 2, '456 Park Lane', 'Delhi'),
(3, 3, '789 Tech Road', 'Bangalore');

INSERT INTO Wishlist_1 VALUES
(1, 101),
(1, 104),
(2, 102),
(2, 105),
(3, 103),
(3, 104);

INSERT INTO Order_1 VALUES
(1, 1, '2025-06-01', 549.99),
(2, 2, '2025-06-02', 750.75);

INSERT INTO OrderItem_1 VALUES
(1, 1, 101, 1, 299.99),
(2, 1, 104, 1, 250.00),
(3, 2, 102, 1, 400.00),
(4, 2, 105, 1, 350.75);

INSERT INTO Review_1 VALUES
(1, 1, 101, 5, 'Excellent book on SQL basics!', '2025-06-05'),
(2, 2, 102, 4, 'Very helpful for Python beginners.', '2025-06-06'),
(3, 3, 103, 3, 'Good read but a bit slow.', '2025-06-07');

INSERT INTO Payment_1 VALUES
(1, 1, '2025-06-01', 549.99, 'Credit Card'),
(2, 2, '2025-06-02', 750.75, 'UPI');

INSERT INTO Employee_1 VALUES
(1, 'Rahul Verma', 'Manager', 50000, '2024-01-01'),
(2, 'Neha Singh', 'Customer Support', 30000, '2024-03-15'),
(3, 'Amit Patel', 'Delivery Executive', 25000, '2024-05-20');
