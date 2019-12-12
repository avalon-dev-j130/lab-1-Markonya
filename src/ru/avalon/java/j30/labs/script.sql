/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */
-- DDL / Data Definition Laguage
drop table users;
create table users
(
    id int not null unique 
       generated always as 
       identity(start with 1, increment by 1),
    email varchar(25) not null primary key,
    password varchar(25) not null
);
create table user_info
(
    user_id int not null primary key 
            references users(id),
    name varchar(50) not null,
    lastname varchar(50) not null,
    is_customer boolean not null default false
);
alter table user_info add column birth_date date;
-- DML / Data Manipulation Language
insert into users(email, password) 
       values('ivanov@mail.ru', '12345');

insert into user_info(user_id, name, lastname)
       values(2, 'Фёдор', 'Иванов');

delete from user_info where user_id = 2;

update user_info 
set is_customer = true,
    birth_date = '1941-01-01'
where user_id = 2;

update user_info
set birth_date = null
where user_id = 2;
-- DQL / Data Query Language

select EMAIL, "NAME", LASTNAME
from USERS, USER_INFO