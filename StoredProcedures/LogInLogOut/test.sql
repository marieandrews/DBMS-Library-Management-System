-- this is a sample table to test the SP associated within this folder
create database library;

use library;

create table users(
	email nvarchar(50) primary key,
	[password] nvarchar(50),
	isLoggedIn bit,
);

insert into users values
('vishnu222@gmail.com',	'secretAgent', 0),
('ameliepoulain@yahoo.com', 'yetAnotherAgent', 0)

select * from users;

drop table users;