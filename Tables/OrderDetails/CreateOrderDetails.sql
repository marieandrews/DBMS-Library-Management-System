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
