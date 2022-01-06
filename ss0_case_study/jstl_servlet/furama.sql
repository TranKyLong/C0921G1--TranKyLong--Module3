DROP DATABASE   IF EXISTS resortfurama;
CREATE database resortfurama;
use resortfurama;
create table `position`( delete_flag int (1)   default  (1),
position_id int PRIMARY key ,
  position_name varchar(45));

  CREATE table education_degree( delete_flag int (1) default  (1),
 education_degree_id int PRIMARY key ,
 education_degree_name varchar(45)
 );
  CREATE table division ( delete_flag int (1)  default (1),
  division_id int PRIMARY key ,
  division_name varchar(45));
  
  CREATE table `role`( delete_flag int (1)  default (1) ,
  role_name varchar(45));
  
  CREATE table attach_service ( delete_flag int (1)  default  (1),
  attach_service_id int PRIMARY key AUTO_INCREMENT,
  attach_service_name varchar(45),
  attach_service_cost double,
  attach_service_unit int,
  attach_service_status  varchar(45)
  );
  CREATE table rent_type( delete_flag int (1)  default  (1),
  rent_type_id int PRIMARY key ,
  rent_type_name varchar(45),
  rent_type_cost double
  );
  CREATE table service_type( delete_flag int (1)  default  (1),
  service_type_id int PRIMARY key ,
  service_type_name varchar(45));
  
 
  CREATE table customer_type( delete_flag int (1)  default(1),
  customer_type_id int PRIMARY key ,
  customer_type_name varchar(45));

  CREATE table user_role( delete_flag int (1)   default(1),
  role_id INT PRIMARY key ,
  username varchar(255));
  
  CREATE table `user` ( delete_flag int (1)   default(1),
  username varchar(255) primary key ,
  `password` VARCHAR(255));
  

--   delete from customer;
--   drop table if EXISTS customer;
  CREATE table customer( delete_flag int (1)  default(1),
  customer_id int  PRIMARY key AUTO_INCREMENT,
  customer_type_id int,
  customer_name varchar(45),
  customer_birthday DATE,
  customer_gender int (1)  default (1) default  (1),
  customer_id_card varchar(45),
  customer_phone varchar(45), 
  customer_email varchar(45),
  customer_address varchar(45),
   FOREIGN KEY (customer_type_id) REFERENCES customer_type(customer_type_id)
  );
  
  CREATE table service( delete_flag int (1)  default (1) ,
  service_id int PRIMARY key AUTO_INCREMENT,
  service_name varchar(45),
  service_arena int,
  service_cost double,
  service_max_people int,
  rent_type_id int,
  service_type_id int,
  standard_rom varchar(45),
  description_other_convenience varchar(45),
  pool_area double,
  number_of_floors int,
   FOREIGN KEY (rent_type_id) REFERENCES rent_type(rent_type_id),
   FOREIGN KEY (service_type_id) REFERENCES service_type(service_type_id));
   

  
 
  CREATE table employee(
  delete_flag int (1)  default (1),
  employee_id int PRIMARY key AUTO_INCREMENT,
  employee_name varchar(45),
  employee_birthday Date,
  employee_id_card varchar(45),
  employee_salary double,
  employee_phone varchar(45),
  employee_email varchar(45),
  employee_adress varchar(45),
  position_id int,
  education_degree_id int,
  division_id int,
  username varchar(255),
   FOREIGN KEY (position_id) REFERENCES `position`(position_id) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (education_degree_id) REFERENCES education_degree(education_degree_id) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (division_id) REFERENCES division(division_id) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (username) REFERENCES `user`(username) ON UPDATE CASCADE ON DELETE CASCADE);
   
     CREATE table contract( delete_flag int (1)  default (1),
  contract_id int PRIMARY key AUTO_INCREMENT,
  contract_start_date Datetime,
  contract_end_date Datetime,
  contract_doposit double,
  contract_total_money double,
  employee_id int,
  customer_id int,
  service_id int,
   FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
   FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
   FOREIGN KEY (service_id) REFERENCES service(service_id)
  );
  
     CREATE table contract_detail( delete_flag int (1)  default (1),
  contract_detail_id int PRIMARY key AUTO_INCREMENT,
  contract_id int,
  attach_service_id int,
  quantity int,
    FOREIGN KEY (contract_id) REFERENCES contract(contract_id),
    FOREIGN KEY (attach_service_id) REFERENCES attach_service(attach_service_id)
  );


delimiter $$
CREATE PROCEDURE updatecustomer(
in  customertypeid int,
in  customername varchar(45) ,
in  customerbirthday    date ,
in  customergender     INT ,
in  customeridcard    varchar(45),
in  customerphone    varchar(45),
in  customeremail    varchar(45) ,
in  customeraddress  varchar(45) )
begin
update customer 
set 

	 customer_type_id = `customertypeid, 
	,customer_name    customername ,   
	,customer_birthdaycustomerbirthday,
	,customer_gender  customergender,  
	,customer_id_card customeridcard ,
	,customer_phone   customerphone  , 
	,customer_email   customeremail  , 
	,customer_address customeraddress);
    VALUES  (
	  customertypeid, 
      customername ,   
      customerbirthday,
      customergender,  
      customeridcard ,
      customerphone  , 
      customeremail  , 
      customeraddress);
      end $$
      delimiter ;
      
      
drop PROCEDURE if EXISTS displayAllCustomer;
delimiter $$
CREATE PROCEDURE displayAllCustomer()
begin
select     
customer_id ,
customer.customer_type_id , 
customer_type_name , 
customer_name ,
customer_birthday ,
customer_gender ,
customer_id_card,
customer_phone ,
customer_email ,
customer_address,
customer.delete_flag
from customer join customer_type ON customer.customer_type_id = customer_type.customer_type_id 
where customer.delete_flag = 1;
end $$
delimiter ;

call displayAllCustomer();

select * from  customer join customer_type ON customer.customer_type_id = customer_type.customer_type_id 
where customer.delete_flag = 1 and customer.customer_id = 1;