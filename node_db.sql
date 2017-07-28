create database node_db;
use node_db;

create table user (
	id integer not null auto_increment,
    username varchar(50) not null,
    password varchar(50) not null,
    enabled  tinyint not null,
    primary key(id)
);

alter table user add column email varchar(255);
alter table user add column firstname varchar(50);
alter table user add column lastname varchar(50);
alter table user add column aboutme text;
alter table user add column image_url varchar(50);
alter table user add column gender varchar(50);
alter table user add column address varchar(50);
desc user;

create table roles (
	id integer not null auto_increment,
    user_role varchar(255),
    primary key(id)
);

create table user_roles (
	id integer not null auto_increment,
    user_id integer not null,
    role_id integer not null,
    primary key(id)
);

insert into user (username, password, enabled) values("user", "user123", 1);
insert into user (username, password, enabled) values("admin", "admin123", 1);

insert into roles (user_role) values("USER");
update roles set user_role = "USER" where id = 1;

select * from user;
select * from roles;
select * from user_roles;

delete from user where id = 6;
delete from user_roles where user_id = 6;

insert into user_roles (user_id, role_id) values(1, 1);
insert into user_roles (user_id, role_id) values(2, 1);
select * from user_roles;

select u.username, u.password, r.user_role from user_roles ur
inner join user u on ur.user_id = u.id
inner join roles r on ur.role_id = r.id where u.enabled = 1;

select u.username, r.user_role from user_roles ur
inner join user u on ur.user_id = u.id
inner join roles r on ur.role_id = r.id where u.enabled = 1;


drop table user;
drop table user_roles;
drop table roles;

show tables;
desc user_roles;