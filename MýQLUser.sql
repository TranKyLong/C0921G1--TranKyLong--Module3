drop DATABASE if EXISTS demo;

CREATE DATABASE demo;
USE demo;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');
insert into users(name, email, country) values('Apache','Apache@che.uk','USA');
insert into users(name, email, country) values('Behemoth','Behemoth@che.uk','England');
insert into users(name, email, country) values('Calgar','Calgar@che.uk','UK');
insert into users(name, email, country) values('Diaa','Diaa@che.uk','Germany');
insert into users(name, email, country) values('Elisa','Elisa@che.uk','England');
insert into users(name, email, country) values('Fabius Bile','Fabius@che.uk','Germany');
insert into users(name, email, country) values('Giang','Giang@che.vi','Viet Nam');