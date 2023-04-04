use QLBanHang
go
-- câu 1 --
select tenhang, count(masp) as soluongsp
from sanpham
join hangsx on sanpham.mahangsx =hangsx.mahangsx
group by tenhang

-- câu 2 --
select nhap.masp, sum(nhap.soluongN*nhap.dongiaN) as tong
FROM Nhap INNER JOIN Sanpham ON Nhap.Masp=Sanpham.masp 
WHERE YEAR(ngaynhap)=2020
GROUP BY Nhap.Masp

-- câu 3 --
select tensp, sum(soluongX) as tong
FROM Xuat
JOIN Sanpham ON Xuat.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngayxuat) = 2018 AND soluongX>10000 AND Tenhang = 'Samsung'
group by tensp

-- câu 4 --
select nhanvien.phong , count(gioitinh) as gt
from nhanvien
where gioitinh='Nam'
group by nhanvien.phong

-- câu 5 --
select mahangsx, sum(soluongN) as slnhap
from nhap
join sanpham on nhap.masp=sanpham.masp
where year(ngaynhap) =2018
group by mahangsx

-- câu 6 -- 
select tennv, sum(sanpham.giaban*xuat.soluongX) as tong
from xuat 
join sanpham on xuat.masp=sanpham.masp
join nhanvien on xuat.manv=nhanvien.manv
where year(ngayxuat)=2018
group by tennv

-- câu 7 --
select tennv, sum(soluongN*dongiaN) as tong
from nhap
join nhanvien on nhap.manv=nhanvien.manv
where year(ngaynhap)=2018 and month(ngaynhap)=08 and soluongN*dongiaN>100000
group by tennv

-- cau 8 --
SELECT *
FROM Nhap 
WHERE Nhap.Masp NOT IN(SELECT Xuat.Masp FROM Xuat)

-- cau 9--
SELECT Nhap.Masp, Ngaynhap, Ngayxuat, dongiaN
FROM Nhap INNER JOIN Xuat ON Nhap.Masp = Xuat.Masp
WHERE YEAR(Ngaynhap) = 2018 AND YEAR(Ngayxuat) = 2018

-- cau 10 --
SELECT Manv, Tennv 
FROM Nhanvien
WHERE EXISTS(SELECT *FROM Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)

-- cau 11 --
SELECT Manv, Tennv 
FROM Nhanvien
WHERE NOT EXISTS(SELECT *FROM Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)