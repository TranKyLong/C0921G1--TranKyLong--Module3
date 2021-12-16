/* 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”. */
use furama;
SELECT 
dvdk. ma_dich_vu_di_kem, 
ten_dich_vu_di_kem,
gia,
don_vi,
trang_thai,
ten_loai_khach,
dia_chi
from dich_vu_di_kem dvdk
 inner join hop_dong_chi_tiet hdct  on hdct.ma_dich_vu_di_kem = dvdk .ma_dich_vu_di_kem
 inner join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
 inner join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
  inner join  loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
 where ten_loai_khach = 'Diamond' and (dia_chi like '%Vinh'or dia_chi like '%Quảng Ngãi');
 
# 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
#(được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt 
#vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
# .
use furama;
select 
 hdct.ma_hop_dong,
 ho_ten_nhan_vien,
 kh.ho_va_ten,
 kh .so_dien_thoai ,
 dv.ten_dich_vu,
 sum(dvdk.ma_dich_vu_di_kem)'so_luong_dich_vu_di_kem',
 hd. tien_dat_coc,
 hd.ngay_lam_hop_dong
 from hop_dong_chi_tiet hdct
 inner join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
 inner join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
 inner join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
 inner join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
 inner join dich_vu dv on dv. ma_dich_vu = hd.ma_dich_vu
 GROUP BY hd.ma_hop_dong
 HAVING month(hd.ngay_lam_hop_dong) BETWEEN 10 and 12
 and year(hd.ngay_lam_hop_dong) = 2020
 and  not EXISTS ( SELECT hd.ngay_lam_hop_dong where month(hd.ngay_lam_hop_dong) BETWEEN 1 and 6 and
 year(hd.ngay_lam_hop_dong) = 2021 );
 

#13  .	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
# (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
use furama;

drop view if EXISTS so_lan_su_dung_max;
CREATE view so_lan_su_dung_max as
select hd.ma_hop_dong, 
ma_khach_hang,
count(hdct.ma_dich_vu_di_kem) 'so_lan_su_dung'

from hop_dong hd
inner join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
GROUP BY hd.ma_khach_hang 
ORDER BY so_lan_su_dung desc;
 
 select max(so_lan_su_dung), ma_khach_hang
 from so_lan_su_dung_max;

#14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, 
#ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hd.ma_hop_dong, 
ldv.ten_loai_dich_vu, 
dvdk.ten_dich_vu_di_kem,
count(hdct.ma_dich_vu_di_kem) 'so_lan_su_dung'
from hop_dong hd 
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY hd.ma_hop_dong
HAVING so_lan_su_dung =1;

#15.Hiển thi thông tin của tất cả nhân viên bao gồm 
#ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien,
ho_ten_nhan_vien,
ten_trinh_do, 
ten_bo_phan, 
so_dien_thoai, 
dia_chi,
hd.ngay_lam_hop_dong,
count(hd.ma_hop_dong) 'so_luong_hop_dong'
from nhan_vien nv
inner join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
inner join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
inner join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan

GROUP BY nv.ma_nhan_vien
HAVING year(hd.ngay_lam_hop_dong) BETWEEN 2021 and 2021 
and so_luong_hop_dong <=3;

#16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

SET SQL_SAFE_UPDATES = 0;
delete nv,hd
from nhan_vien nv
left join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where hd.ma_hop_dong is null;

#17. Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
# chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 1.000.000 VNĐ.

update khach_hang kh
left join loai_khach lk on lk.ma_loai_khach =  kh.ma_loai_khach 
left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
LEFT join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
set kh.ma_loai_khach = 1
where (ifnull(chi_phi_thue,0) + ifnull(so_luong,0)*ifnull(gia,0) )> 1000000 and year(hd.ngay_lam_hop_dong) = 2021 and kh.ma_loai_khach =2;

select ho_va_ten, ma_loai_khach from khach_hang where ma_loai_khach =1

