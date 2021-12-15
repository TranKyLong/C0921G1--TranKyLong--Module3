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
 and hd.ngay_lam_hop_dong not in ( SELECT hd.ngay_lam_hop_dong where month(hd.ngay_lam_hop_dong) BETWEEN 1 and 6 and
 year(hd.ngay_lam_hop_dong) = 2021 );
 

#13  .	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
# (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
use furama;
select 
hd.ma_khach_hang,
count(hdct.ma_dich_vu_di_kem) 'so_lan_su_dung'
from hop_dong hd
inner join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
GROUP BY hd.ma_khach_hang
ORDER BY so_lan_su_dung DESC
limit 1;

#14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

#15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

