
#18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
use furama;
SET FOREIGN_KEY_CHECKS=0; -- to disable them
#SET FOREIGN_KEY_CHECKS=1; -- to re-enable them
DELETE kh,hd
      FROM khach_hang kh
    inner JOIN hop_dong hd  ON hd.ma_khach_hang = kh.ma_khach_hang where year(ngay_lam_hop_dong) < 2021;
     
     select * FROM khach_hang kh
     inner JOIN hop_dong hd  ON hd.ma_khach_hang = kh.ma_khach_hang where year(ngay_lam_hop_dong) = 2021;
     
 #19 Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
 use furama;
 update dich_vu_di_kem dvdk 
 left join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
 left join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
 set dvdk.gia = dvdk.gia*2
 where so_luong > 10 and year(ngay_lam_hop_dong) = 2020;
 
 select ma_dich_vu_di_kem, gia from dich_vu_di_kem;

#20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm 
#id (ma_nhan_vien, ma_khach_hang), ho_va_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
use furama;
select  kh.ma_khach_hang  'id' , kh.ho_va_ten 'ho_ten', kh.email 'email', kh.so_dien_thoai 'sdt', kh. ngay_sinh 'ngay_sinh', kh.dia_chi 'dia_chi', 'KH' `type`
from   khach_hang kh 
UNION all
select nv.ma_nhan_vien, nv.ho_ten_nhan_vien, nv.email, nv.so_dien_thoai, nv. ngay_sinh, nv.dia_chi, 'NV'
FROM nhan_vien nv;

     