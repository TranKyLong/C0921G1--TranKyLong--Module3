
-- 3.	Hiển thị thông tin của tất cả khách hàng
-- có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

SELECT *
FROM
    furama.khach_hang
WHERE
    DATEDIFF(CURDATE(), ngay_sinh) * 0.002738 BETWEEN 18 AND 50
        AND (dia_chi LIKE '%Đà Nẵng' OR dia_chi LIKE ' %Quảng Trị');


 -- ===============================================================================
 -- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
 -- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
 -- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
 
SELECT 
    COUNT(*) AS so_lan,
    ma_loai_khach,
    ho_va_ten,
    khach_hang.ma_khach_hang
    
FROM
    furama.khach_hang
        INNER JOIN
    furama.hop_dong ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
    WHERE ma_loai_khach =1
    GROUP BY khach_hang.ma_khach_hang
;
    
   -- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
  --  (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá,
   -- với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
   -- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
use furama;
 SELECT 
    khach_hang.ma_khach_hang,
    ho_va_ten,
    khach_hang.ma_loai_khach,
    hop_dong.ma_hop_dong,
    ten_dich_vu,
    ngay_lam_hop_dong,
    ngay_ket_thuc
    ,sum(ifnull(dich_vu.chi_phi_thue,0) + ifnull(dich_vu_di_kem.gia,0)* ifnull(hop_dong_chi_tiet.so_luong,0) ) AS tong_tien

FROM
khach_hang
left join  hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
left join  hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong 
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem =dich_vu. ma_dich_vu
GROUP BY ma_khach_hang;

/*6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
 chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).*/
 use furama;
 select dich_vu.ma_dich_vu,
 ten_dich_vu,
 dien_tich,
 chi_phi_thue,
 ten_loai_dich_vu,
 ngay_lam_hop_dong
 from dich_vu 
 left join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
 LEFT join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
 having not EXISTS (SELECT ngay_lam_hop_dong where month(ngay_lam_hop_dong) BETWEEN 1 and 3
 and year(ngay_lam_hop_dong) = 2021) ;
 
 /* 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
 của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng 
 trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.*/
use furama;
 select dich_vu.ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da,chi_phi_thue, ten_loai_dich_vu,ngay_lam_hop_dong
 from dich_vu 
 left join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
 LEFT join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
 having  not EXISTS (SELECT ngay_lam_hop_dong where year(ngay_lam_hop_dong)= 2021) ;
 
 /* 9.	Thực hiện thống kê doanh thu theo tháng,
 nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng. */
 
 use furama;
 select ngay_lam_hop_dong, count(ma_khach_hang) 'so_khach_hang_dat_phong'
 from hop_dong
 GROUP BY month(ngay_lam_hop_dong);
 
 /*10 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
 Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
 (được tính dựa trên việc sum so_luong ở dich_vu_di_kem). */
 
 use furama;
 select hop_dong. ma_hop_dong, 
 ngay_lam_hop_dong, 
 ngay_ket_thuc, 
 tien_dat_coc,
 sum(ifnull(so_luong,0))' so_luong_dich_vu_di_kem '
 from hop_dong 
 LEFT join hop_dong_chi_tiet on hop_dong_chi_tiet. ma_hop_dong = hop_dong.ma_hop_dong
GROUP BY (ma_hop_dong)
 


