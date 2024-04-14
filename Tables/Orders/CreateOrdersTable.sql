-- Creating Order table

CREATE TABLE Orders (
orderID int not null identity(1, 1),
id int not null,
timeStamp Datetime not null,

constraint Orders_pk1 primary key (orderID)
);

drop table orders;

ALTER TABLE Orders
add foreign key (id) references Users(uuid);

INSERT INTO Orders
VALUES (1, '2024-04-12 11:04:10'),
(2, '2024-04-13 12:56:02')

select * from orders;




