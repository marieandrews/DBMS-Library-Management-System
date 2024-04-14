-- CREATING USER TABLE

CREATE TABLE Users (
uuid int not null identity(1, 1),
username varchar(20) not null,
password varchar(20) not null,
name varchar(200) not null,
email varchar(200),
phoneNumber varchar(20),
address varchar(100) not null,
role varchar(50) not null,
accountStatus varchar(50) not null,
isLoggedIn bit not null,
balance decimal(18,2),
constraint Users_pk1 primary key (uuid)
);

DROP TABLE USERS;

-- Some "dummy data" to test

INSERT INTO Users (username, password, name, email, phoneNumber, address, role, accountStatus, isLoggedIn, balance)
VALUES ('usernameAmelie', 'SECRETAGENT', 'Amelie', 'AMELIEPOULAIN@YAHOO.COM', '3662448724', '23 Cherry Tree Ln', 'member', 'on hold', 0, 10.62),
('usernameVishnu', 'SECRETAGENT', 'Vishnu', 'VISHNU222@GMAIL.COM', '2478886555', '123 Alphabet St', 'member', 'good', 0, 35.50);

