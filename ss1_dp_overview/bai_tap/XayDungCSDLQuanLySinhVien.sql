USE TAO_TABLE;
create table CLASS(
ID INT PRIMARY KEY,
`NAME` VARCHAR(100)
);

insert INTO CLASS VALUES
(1, 'C01'), (2,'C02'),(3,'C03');


create table teacher(
ID INT PRIMARY KEY,
`NAME` VARCHAR(100),
age int,
COUNTRY VARCHAR(100)
);

insert INTO teacher values (1,'Ba',40,'Viet Nam'),
 (2,'Bon',41,'Viet Nam'),
 (3,'Nam',42,'Viet Nam')