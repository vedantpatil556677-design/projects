create database libraryDB;
use libraryDB;

#create table publisher
create table Publisher(Pub_id int primary key,
Name varchar(100),
Address varchar(200));
desc Publisher;

#create table books
create table books(Book_id int primary key,
Title varchar (200),
Author varchar (200),
Price decimal (8,2),
available boolean,
Pub_id int ,
foreign key (Pub_id) references Publisher(Pub_id));
desc books;

#create member table
create table Member (Memb_id int primary key,
Name varchar(100),
Address varchar(200),
Memb_date date ,
Expiry_date date);
desc Member;

#creating borrow table
create table Borrow(Issue int primary key,
Book_id int,
Memb_id int,
due_date date,
Return_date date,
foreign key (Book_id)references Books(Book_id),
foreign key (Memb_id) references Member(Memb_id));

#inserting values in Publisher table
insert into Publisher values(1,'Kunal Shinare', 'karjat'),
(2,'nitesh Tupe','panvel'),
(3,'Amar murbe','alibag'); 
select * from Publisher;

#inserting values in Books table 
insert into Books values(101,'java basics','john doe',349.90,true,1),
(102,'Python for beginners','Alice Green',399.20,true,2),
(103,'SQL Mastary','Bob Smith',500.50,false,1),
(104,'web devlopment','Eve Adams',550.83,true,3),
(105,'data strcture','Carol White',450.30,false,2),
(106,'machine kearning','devide clurk',699.56,true,1),
(107,'operating system','Grace Lee',560.90,true,3),
(108,'computer netwirking','Liam Brown',340.56,false,3),
(109,'C Programming','Isaac Newton',299.30,true,1),
(110,'database design','Henry Frd',295.00,false,2);
select * from Books;

#inserting values in Member table 
insert into Member values(1001,'Aman Gupta','Ghatkopar','2024-12-01','2025-05-15'),
(1002,'Chetan Virle', 'neral','2024-08-16','2025-09-01'),
(1003,'Dipesh Kadam', 'badlapur','2024-07-12','2025-12-01'),
(1004,'Ashish Rane ','Khpoli','2025-01-2','2026-01-01'),
(1005,'Rohit Tupe','Mumbai','2025-02-14','2025-06-19');
select * from Member;

#inserting values who borrowed by
insert into Borrow values (1,101,1001,'2024-12-12','2025-01-30'),
(2,103,1002,'2024-08-17',null),
(3,102,1003,'2024-12-16','2025-02-12'),
(4,105,1004,'2025-01-01',null),
(5,109,1002,'2024-09-29','2025-03-29'),
(6,110,1005,'2025-02-14',null),
(7,108,1001,'2024-12-31',null),
(8,106,1002,'2025-01-09','2025-04-15');
select * from Borrow;
select Borrow.Issue,Member.Name AS Member_Name,
Books.Title AS Book_Title,
Borrow.due_date from Borrow JOIN Member on Borrow.Memb_id = Member.Memb_id
JOIN Books on Borrow.Book_id = Books.Book_id where Borrow.Return_date IS NULL;publishermemberbooksmemberpublisherbooks