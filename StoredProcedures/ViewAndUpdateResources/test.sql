
CREATE TABLE Resources (
resourceID int not null identity(1, 1),
title varchar(100) not null,
location varchar(100) not null,
acquisitionDate Date not null,
removalDate Date,
distributor varchar(100),
constraint Resources_pk1 primary key (resourceID)
);

insert into Resources values
('The Knights of Favonious', 'Shelf 6, Rack 2', '23-Nov-2010', '23-Nov-2025', 'Mihoyo' ),
('The Arabian Nights', 'Shelf 2, Rack 8', '23-Nov-2010', '23-Nov-2025', 'Alladin' )

update Users
set role = 'head-employee'
where username = 'usernameAmelie';

select * from users;