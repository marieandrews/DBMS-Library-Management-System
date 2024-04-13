-- Creating Books table

CREATE TABLE Books (
title varchar(100) not null,
author varchar(200) not null,
ISBN varchar(50) not null,
type varchar(30) not null,
isCheckedOut bit not null,
lastCheckedOutDate Date not null,
isAvailable bit not null,
resourceID int not null,
constraint Books_pk1 primary key (title)
);


ALTER TABLE Books
add foreign key (resourceID) references Resources(resourceID);