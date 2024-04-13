-- Creating Order table

CREATE TABLE Orders (
orderID int not null identity(1, 1),
id int not null,
timeStamp Datetime not null,
constraint Orders_pk1 primary key (timeStamp)
);

ALTER TABLE Orders
add foreign key (id) references Users(id);



