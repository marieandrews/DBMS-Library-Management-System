-- Creating Resources table

CREATE TABLE Resources (
resourceID int not null identity(1, 1),
title varchar(100) not null,
location varchar(100) not null,
acquisitionDate Date not null,
removalDate Date,
distributor varchar(100),
constraint Resources_pk1 primary key (resourceID)
);

ALTER TABLE Resources
add foreign key (title) references Books(title);