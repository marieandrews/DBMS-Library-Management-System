-- Creating OrderDetails table

CREATE TABLE OrderDetails (
detailID int not null identity(1, 1),
orderID int not null,
resourceID int not null,
dueDate Datetime not null,
constraint OrderDetails_pk1 primary key (detailID)
);

ALTER TABLE OrderDetails
add foreign key (resourceID) references Resources(resourceID),
	foreign key (orderID) references Orders(orderID);

INSERT INTO OrderDetails 
VALUES (1, 1, '2024-05-02 23:59:59'),
(1, 2, '2024-05-03 23:59:059')
