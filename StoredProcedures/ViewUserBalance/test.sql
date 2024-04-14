drop table users;

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

insert into users values
('testuser2', '123456', 'test user 1', 'test1@test.com', '+1 438 855 8480', '12345 street 2', 'sub', 'in-active', 0, 25.62),
('testuser', 'abcd', 'test user', 'test@test.com', '+1 438 855 8478', '12345 street', 'super', 'active', 1, 10.65 )

select * from users