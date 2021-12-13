
DROP DATABASE IF EXISTS quan_ly_ban_hang;
create DATABASE quan_ly_ban_hang;
use quan_ly_ban_hang;

CREATE TABLE customer (
cID int PRIMARY key,
`Name` varchar (25),
Age tinyint
); 


CREATE TABLE `Order` (
oID  int PRIMARY key,
cID int,
oDate date ,
oTotalPrice  int,
FOREIGN KEY (cID) REFERENCES customer(cID)
);

CREATE TABLE Product (
pID   int PRIMARY key,
pName varchar (25),
pPrice   int
);


CREATE TABLE OrderDetail (
oID    int,
pID  int,
odQTY    int,
  FOREIGN KEY (oID) REFERENCES `Order`(oID),
   FOREIGN KEY (pID) REFERENCES Product(pID)
);


INSERT into customer values 
( 1,'Minh Quan',	10),
( 2	,'Ngoc Oanh',	20),
( 3,'Hong Ha',	50);

INSERT into `Order` values 
 (1,1,'2006/03/21',Null),
 (2,2,'2006/03/23',Null),
 (3,1,'2006/03/16',Null);
 
INSERT into product values 
(1,	'May Giat',	3),
(2,	'Tu Lanh'	,5),
(3,'	Dieu Hoa',	7),
(4,'	Quat'	,1),
(5,	'Bep Dien',	2);
 
INSERT into OrderDetail values
( 1,1,3),
( 1,3,7),
( 1,4,2),
( 2,1,1),
( 3,1,8),
( 2,5,4),
( 2,3,3);

/*Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
*/
 
 SELECT oID,oDate, oTotalPrice from `Order`;
 
# Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT 
    cID, Customer.`Name`, Product.pID, pName
FROM
OrderDetail
INNER JOIN Customer ON Customer.cID = OrderDetail.oID
INNER JOIN Product ON Product.pID = OrderDetail.pID;
    
 #Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
 
SELECT  `Order`.oID, oDate, sum(OrderDetail.odQTY * pPrice) AS oTotalPrice
FROM
    OrderDetail
        INNER JOIN
    Product ON Product.pID = OrderDetail.pID
        INNER JOIN
    `Order` ON OrderDetail.oID = `Order`.oID
   GROUP BY   `Order` .oID;
   
   #Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
   
SELECT * , count(oID) 'so_lan_mua_hang'
FROM
Customer
left  JOIN `Order` ON Customer.cID  = `Order`.cID 
GROUP BY oID
HAVING so_lan_mua_hang =0;


