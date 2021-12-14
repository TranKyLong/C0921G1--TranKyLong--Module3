use quan_ly_sinh_vien;
/* Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
Hiển thị các thông tin môn học có điểm thi lớn nhất.
Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần */
select * from `subject` 
ORDER BY Credit limit 1 ;

select * from `subject` sb 
inner join mark m on m.SubId = sb.SubId
order by Mark limit 1;

select * ,avg(mark)' trung_binh' from student s
inner join mark m on m.StudentId = s.StudentId
GROUP BY s.StudentId
ORDER BY  trung_binh DESC;