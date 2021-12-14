/* Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
*/
use quan_ly_sinh_vien;
SELECT 
*
FROM student
       where StudentName like 'h%';
       
      /* Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.*/ 
SELECT 
    *
FROM
    class
WHERE
    MONTH(StartDate) >= 12;
    
   /*    Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.*/ 
SELECT 
    *
FROM
    `subject`
WHERE
    Credit BETWEEN 3 AND 5;
    
    #Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
    SET SQL_SAFE_UPDATES = 0;
UPDATE student,
    class 
SET 
    student.ClassID = 2
WHERE
    StudentName = 'Hung';

# Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
use quan_ly_sinh_vien;
insert into mark

SELECT StudentName, `subject`.SubName,Mark 
from student
  inner join mark on student.StudentId = mark.StudentId
inner join `subject` on mark.SubId = `subject`.SubId
ORDER BY mark desc, StudentName asc;
