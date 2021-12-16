drop database if exists demo;
CREATE DATABASE demo;
use demo;

CREATE table product_demo(
Id int PRIMARY key AUTO_INCREMENT,
productCode VARCHAR(45),
productName VARCHAR(45),
productPrice double,
productAmount int,
productDescription VARCHAR(145),
productStatus VARCHAR(145));

INSERT into product_demo(Id, productCode , productName , productPrice,  productAmount,  productDescription , productStatus) values
(1, '125','nokia', 15.5, 10, 'bulletproof', 'still usable' ),
(2, '1025','samsung', 6.5, 17, 'unbroken', 'still usable' ) ; 

select * 
from product_demo;

alter table demo.product_demo add unique  index_id(Id);
select * from product_demo
where id =1;

alter table demo.product_demo add index  comps_index(productName,productPrice);
explain select * from product_demo
where id =1;

#Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
#Tiến hành sửa đổi view
#Tiến hành xoá view

create view demo_view as
select productCode, productName, productPrice, productStatus
from demo.product_demo;

use demo;
create or replace view demo_view as
select  productCode, productName, productDescription, productAmount
from product_demo;

select * from demo_view;
drop view demo_view;

/* Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
Tạo store procedure thêm một sản phẩm mới
Tạo store procedure sửa thông tin sản phẩm theo id
Tạo store procedure xoá sản phẩm theo id */

delimiter //
create procedure get_all_info()
begin 
select *
from demo.product_demo;
end;//

call get_all_info;

#Thêm một sản phẩm mới 
drop procedure if exists add_new_product;
delimiter //
create procedure add_new_product( p_code varchar(50), p_name varchar(100), p_price double, p_amount int, p_desc varchar(100), p_stt varchar(150))
begin 
	insert into demo.product_demo( productCode, productName , productPrice,  productAmount,  productDescription , productStatus) values 
	(p_code, p_name, p_price ,p_amount  , p_desc  ,p_stt );
end;// 

call add_new_product(156, 'tele_phone', 16.3, 5, 'very_solid', 'fixing');
select * from demo.product_demo;

#sửa thông tin sản phẩm theo id
drop procedure if exists update_product;
delimiter //
create procedure update_product( p_id int,p_code varchar(50), p_name varchar(100), p_price double, p_amount int, p_desc varchar(100), p_stt varchar(150) )
begin 
	UPDATE demo.product_demo
SET productCode =p_code,
productName =p_name,
productPrice = p_price,
productAmount = p_amount,
productDescription = p_desc,
productStatus = p_stt
WHERE product_demo.Id = p_id;
end;// 

call update_product(1,186, 'metal_phone', 26.3, 15, 'iron clad', 'useable');
call update_product(2,56, 'samsung',10.3, 5, 'iron clad', 'old but still useable');
select * from demo.product_demo;

#xoá sản phẩm theo id
delimiter //
create procedure delete_product( p_id int)
begin 
delete 
from demo.product_demo 
where product_demo.Id = p_id;
end;// 

call delete_product(1);

select * from demo.product_demo;