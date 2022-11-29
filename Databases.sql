
CREATE TABLE librarians(
lib_id VARCHAR(6) NOT NULL,
fname VARCHAR(10) NOT NULL,
lname VARCHAR(10) NOT NULL,
email_address VARCHAR(30) NOT NULL UNIQUE,
telephone_no VARCHAR(10) NOT NULL UNIQUE,	
Shift_id VARCHAR(12) NOT NULL,
CONSTRAINT librarians_acnumber_pk PRIMARY KEY(lib_id),
CONSTRAINT account_librarians_fk FOREIGN KEY(shift_id) REFERENCES shifts(shift_id)	
);


--SHIFTS RELATION
CREATE TABLE shifts(
shift_id VARCHAR(8) NOT NULL,
shift_name VARCHAR(12) NOT NULL,
CONSTRAINT shifts_acnumber_pk PRIMARY KEY(shift_id)	
);



--BOOKS RELATION
CREATE TABLE books(
book_id VARCHAR(8) NOT NULL,
title VARCHAR(20) NOT NULL UNIQUE,
price REAL NOT NULL,
description VARCHAR(20) NOT NULL,	
isbn_number VARCHAR(13),
CONSTRAINT books_acnumber_pk PRIMARY KEY(book_id));

--AUTHORS RELATION
CREATE TABLE authors(
author_id VARCHAR(8) NOT NULL,
fname VARCHAR(12) NOT NULL,
lname VARCHAR(12) NOT NULL,
email_address VARCHAR(30) NOT NULL UNIQUE,
biography VARCHAR(25) NOT NULL UNIQUE,
contact VARCHAR(10) NOT NULL UNIQUE,
book_id VARCHAR(12) NOT NULL,	
CONSTRAINT authors_acnumber_pk PRIMARY KEY(author_id),
CONSTRAINT account_fk_authors FOREIGN KEY(book_id) REFERENCES books(book_id));

--PUBLISHING COMPANIES RELATION
CREATE TABLE pubcompanies(
pubcompany_id VARCHAR(8) NOT NULL,
company_name VARCHAR(12) NOT NULL,
author_id  VARCHAR(12) NOT NULL,
book_id VARCHAR(12) NOT NULL,
when_puplished VARCHAR(20),	
CONSTRAINT pubcompanies_acnumber_pk PRIMARY KEY(pubcompany_id),
CONSTRAINT account_pubcompanies_fk FOREIGN KEY(author_id) REFERENCES authors(author_id),
CONSTRAINT account_fk_pubcompanies FOREIGN KEY(book_id) REFERENCES books(book_id));

--BORROWER DETAILS RELATION
CREATE TABLE borrower_details(
borrower_id VARCHAR(10) NOT NULL,
book_id VARCHAR(8) NOT  NULL,
issued_books INT,
lib_id VARCHAR(12),	
available_books INT,	
borrowed_from DATE,
return_date DATE,
books_returned INT,
not_returned INT,	
CONSTRAINT account_borrower_details_pk PRIMARY KEY(borrower_id),
CONSTRAINT account_borrower_details_fk FOREIGN KEY(book_id) REFERENCES books(book_id),	
CONSTRAINT issued_by FOREIGN KEY(lib_id) REFERENCES librarians(lib_id));

--USERS/STUDENTS RELATION
CREATE TABLE students(
student_id VARCHAR(8) NOT NULL,
student_names VARCHAR(30) NOT NULL,
contact VARCHAR(10) NOT NULL UNIQUE,
email_address VARCHAR(30) NOT NULL,
borrower_id VARCHAR(8),
book_id VARCHAR(8),
CONSTRAINT students_account_pk PRIMARY KEY(student_id),
CONSTRAINT student_borrower_fk FOREIGN KEY(borrower_id) REFERENCES borrower_details(borrower_id),
CONSTRAINT student_books_fk FOREIGN KEY(book_id) REFERENCES books(book_id));

--INSERTING VALUES INTO THE RELATIONS
--INSERTING INTO THE LIBRARIANS RELATION
INSERT INTO librarians VALUES('L2001','Atim', 'Sarah', 'sarahatim@gmail.com', '0706661661', 'S1001');
INSERT INTO librarians VALUES('L2002','Adee', 'Suzan', 'suzanadee@gmail.com', '0706661662', 'S1001');
INSERT INTO librarians VALUES('L2003','Amongin', 'Sharon', 'sharonamongin@gmail.com', '0706661663', 'S1002');
INSERT INTO librarians VALUES('L2004','Asiimwe', 'Doreen', 'doreenasiimwe@gmail.com', '0706661664', 'S1001');
INSERT INTO librarians VALUES('L2005','Otim', 'James', 'jamesotim@gmail.com', '0706661665', 'S1002');
INSERT INTO librarians VALUES('L2006','Mugabe', 'Timothy', 'timothymugabe@gmail.com', '0706661666', 'S1002');
INSERT INTO librarians VALUES('L2007','Mutonyi', 'Elsa', 'elsamutonyi@gmail.com', '0706661667', 'S1001');
INSERT INTO librarians VALUES('L2008', 'Wabusa', 'Ceasar', 'ceasarwabusa@gmail.com', '0706661668', 'S1002');
INSERT INTO librarians VALUES('L2009','Muzaki', 'Tracy', 'tracymuzaki@gmail.com', '0706661669', 'S1001');
INSERT INTO librarians VALUES('L2010','Bagambe', 'Joel', 'joelbagambe@gmail.com', '0706661660', 'S1002');

--showing all the available columns
SELECT * FROM librarians;

--INSERTING INTO SHIFTS
INSERT INTO shifts VALUES('S1001', 'Morning');
INSERT INTO shifts VALUES('S1002', 'Evening');

--showing all the available columns
SELECT * FROM shifts;

--INSERTING INTO BOOKS
INSERT INTO books VALUES('B001', 'Real Python',100,'Programming','0123456789012');
INSERT INTO books VALUES('B002', 'Mathematics',100.45,'Computing','0123456789013');
INSERT INTO books VALUES('B003', 'Hardware',103.2,'Development','0123456789014');
INSERT INTO books VALUES('B004', 'HTML_CSS',102,'Web Development','0123456789015');
INSERT INTO books VALUES('B005', 'Data Science',340,'Analysis','0123456789016');
INSERT INTO books VALUES('B006', 'Python II',450,'Programming','0123456789011');
INSERT INTO books VALUES('B007', 'Core Grapphics',111,'Designing','0123456789017');
INSERT INTO books VALUES('B008', 'Databases',112,'SQLs','0123456789019');
INSERT INTO books VALUES('B009', 'Javascript',113,'Front_end','0123456789018');
INSERT INTO books VALUES('B010', 'Reactjs',114,'Framework','0123456789010');

--showingall columns 
SELECT * FROM books;

--INSERTING INTO AUTHORS RELATION
INSERT INTO authors VALUES('A001', 'Nganda', 'Gladys','ngandagladys@gmail.com','lecturer', '0745674532','B001');
INSERT INTO authors VALUES('A002', 'Ampaire', 'Phemia','phemiaampaire@gmail.com','PHD maths', '0745674533','B002');
INSERT INTO authors VALUES('A003', 'Wakabala','Kenneth','kennethwakabala@gmail.com','Software Engineer', '0745674531','B003');
INSERT INTO authors VALUES('A004', 'Nabatanzi', 'Gorret','gorretnabantanzi@gmail.com','Developer', '0745674534','B004');
INSERT INTO authors VALUES('A005', 'Muhame', 'Alon','alonmuhame@gmail.com','Data Analyst', '0745674535','B005');
INSERT INTO authors VALUES('A006', 'Amongin', 'Sharon','sharonamongin@gmail.com','Pythonista', '0745674536','B006');
INSERT INTO authors VALUES('A007', 'Kabahinda', 'Rovence','rovencekabahinda@gmail.com','Graphics Designer', '0745674537','B007');
INSERT INTO authors VALUES('A008', 'Namaganda', 'Miriam','miriamnamanganda@gmail.com','Backend Developer', '0745674538','B008');
INSERT INTO authors VALUES('A009', 'Kyampeire', 'Hadijah','hadijahkyampeire@gmail.com','Frontend Developer', '0745674539','B009');
INSERT INTO authors VALUES('A010', 'Nabullo', 'Vivian','viviannabullo@gmail.com','React Guru', '0745674542','B010');

--SHOWING ALL THE COLUMNS
SELECT * FROM authors;

--SELECT ALL AUTHORS WITH THEIR PUBLISHING COMPANIES
SELECT company_name,author_id FROM pubcompanies;

---PUBLISHING COMPANIES RELATION
INSERT INTO pubcompanies VALUES('P001','Macmillan','A001','B001', '1990-12-27');
INSERT INTO pubcompanies VALUES('P002','Cornerston','A002','B002', '1999-10-13');
INSERT INTO pubcompanies VALUES('P003','Aristock','A003','B003', '1998-09-16');
INSERT INTO pubcompanies VALUES('P004','Fountain','A004','B004', '1991-08-07');
INSERT INTO pubcompanies VALUES('P005','Moran','A005','B005', '2000-07-17');
INSERT INTO pubcompanies VALUES('P006','Vision','A006','B006', '2001-06-21');
INSERT INTO pubcompanies VALUES('P007','MK','A007','B007', '2002-05-23');
INSERT INTO pubcompanies VALUES('P008','MTK','A008','B008', '2003-04-25');
INSERT INTO pubcompanies VALUES('P009','Picfare','A009','B009', '2006-03-23');
INSERT INTO pubcompanies VALUES('P010','Bazaar','A010','B010', '2007-01-20');


SELECT COUNT(pubcompany_id) FROM pubcompanies WHERE book_id = 'B001';
SELECT COUNT(pubcompany_id) FROM pubcompanies WHERE book_id = 'B001';
SELECT COUNT(pubcompany_id) FROM pubcompanies WHERE book_id = 'B001';
SELECT COUNT(pubcompany_id) FROM pubcompanies WHERE book_id = 'B001';
--SHOWING ALL THE AVAILABLE COLUMNS
SELECT * FROM pubcompanies;

---INSERTING  VALUES INTO BORROWER DETAILS
INSERT INTO borrower_details VALUES('D001','B002',2,'L2001', 100,'22/09/2022','22/10/2022',1,1);
INSERT INTO borrower_details VALUES('D002','B001',4,'L2001', 90,'20/08/2022','20/08/2022',1,3);
INSERT INTO borrower_details VALUES('D003','B007',6,'L2010', 24,'21/07/2022','21/07/2022',2,4);
INSERT INTO borrower_details VALUES('D004','B010',7,'L2008', 36,'19/06/2022','19/06/2022',3,4);
INSERT INTO borrower_details VALUES('D005','B008',10,'L2007', 37,'07/05/2022','07/05/2022',10,0);
INSERT INTO borrower_details VALUES('D006','B005',9,'L2006', 38,'06/04/2022','06/04/2022',4,5);
INSERT INTO borrower_details VALUES('D007','B004',8,'L2005', 40,'22/09/2022','22/10/2022',0,8);
INSERT INTO borrower_details VALUES('D008','B003',3,'L2003', 110,'22/09/2022','22/10/2022',2,1);
INSERT INTO borrower_details VALUES('D009','B006',1,'L2004', 95,'22/09/2022','22/10/2022',1,0);
INSERT INTO borrower_details VALUES('D0010','B009',5,'L2002', 85,'22/09/2022','22/10/2022',5,0);

--SELECTING ALL THE COLUMNS
SELECT * FROM borrower_details;

--INSERTING INTO THE STUDENT RELATION
INSERT INTO students VALUES('U9001','Kemigisha Ritah','0751234567','ritahkemigisha@gmail.com','D003','B007');
INSERT INTO students VALUES('U9002','Mwesigwa Nelson','0751234566','nelsonmwesigwa@gmail.com','D004','B010');
INSERT INTO students VALUES('U9003','Abbo Flumera','0751234557','flumeraabbo@gmail.com','D005','B008');
INSERT INTO students VALUES('U9004','Orishaba Brenda','0751236567','brendaorisaba@gmail.com','D006','B005');
INSERT INTO students VALUES('U9005','Magara Collins','0751237567','collinsmagara@gmail.com','D007','B004');
INSERT INTO students VALUES('U9006','Mukama Kenneth','0751238568','kennethmukama@gmail.com','D008','B003');
INSERT INTO students VALUES('U9007','Soobi Timothy ','0751239567','timothysoobi@gmail.com','D009','B006');
INSERT INTO students VALUES('U9008','Nambi Gorret','0751234561','nambigorret@gmail.com','D0010','B009');
INSERT INTO students VALUES('U9009','Nyakato Daisy','0751234562','daisynyakato@gmail.com','D001','B002');
INSERT INTO students VALUES('U9010','Nyangoma Doreen','0751234563','doreennyangoma@gmail.com','D002','B001');

--SELECTING ALL THE COLUMNS
SELECT * FROM students;
--SELECTING ALL STUDENTS WHO HAVENT RETURNED THE BOOKS
SELECT * FROM borrower_details WHERE books_returned = 0;

--SELECT ALL LIBRARIANS THAT WORK IN THE MORNING
SELECT * FROM librarians WHERE shift_id = 'S1001';
--TOTAL NUMBER OF BOOKS EACH AUTHOR HAS PRODUCED IN A YEAR
SELECT COUNT(*) FROM authors WHERE book_id = 'B007';
--TOTAL NUMBER OF TIMES A STUDENT BORROWED A CERTAIN BOOK




