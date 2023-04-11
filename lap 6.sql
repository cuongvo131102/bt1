use QLBanHang
go
-- cau 1---
go
create function tensanpham1 (@Tenhang nvarchar(20))
returns
table
return
     select tensp,masp from Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
	 where tenhang = @Tenhang
go
select * from dbo .tensanpham1('OPPO')
-- cau 2 ----
go
create function danhsachsanpham (@x int ,@y int)
returns
table
return
     select tensp, Sanpham.masp, tenhang from Hangsx inner join Sanpham ON Sanpham.mahangsx = Hangsx.mahangsx inner join Nhap ON Sanpham.masp = Nhap.masp
	 WHERE DAY(NGAYNHAP) BETWEEN @x and @y
go
select * from dbo.danhsachsanpham(1,10)
-- cau 3----
go
CREATE FUNCTION LuaChon(@luachon int)
RETURNS @bang TABLE (tensp nvarchar(20), masp nvarchar(10),tenhang nvarchar(20), Soluong int)
AS
BEGIN
	IF @luachon = 0
	BEGIN
		INSERT INTO @bang 
			SELECT tensp, Sanpham.masp, tenhang, Soluong FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
			WHERE soluong < 0
	END
	IF @luachon = 1
	BEGIN
		INSERT INTO @bang
			SELECT tensp, Sanpham.masp, tenhang, Soluong FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
			WHERE soluong > 0
	END
	RETURN
END
--- cau 4 ----
go
CREATE FUNCTION ThongTinNV (@Phong nvarchar(30))
RETURNS TABLE RETURN
SELECT Tennv FROM Nhanvien
WHERE Nhanvien.Phong = @Phong
GO
SELECT *FROM ThongTinNV ('Kế toán')
-- cau 5--
go
create function  kiemtrahsx(@diachi nvarchar(30))
returns
table
return
     select tenhang, mahangsx, diachi from Hangsx 
	 where diachi = @diachi
go
select * from dbo.kiemtrahsx('China')
-- cau 6 --
go
CREATE FUNCTION DSXuat (@x int, @y int)
RETURNS TABLE RETURN
SELECT Tenhang, tensp, soluongX
FROM Xuat INNER JOIN Sanpham ON Xuat.Masp = Sanpham.masp INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngayxuat) BETWEEN @x AND @y
GO
SELECT * FROM DSXuat(2019, 2020)
-- cau 7 ---
go
CREATE FUNCTION dsluachon(@luachon int, @tenhang nvarchar(50))
RETURNS @bang TABLE (tensp nvarchar(20))
AS
BEGIN
	IF @luachon = 0
	BEGIN
		INSERT INTO @bang 
		SELECT tensp FROM sanpham 
		inner join nhap on sanpham.masp=nhap.masp	
		inner join hangsx on sanpham.mahangsx=hangsx.mahangsx
		where tenhang=@tenhang
	END
	IF @luachon = 1
	BEGIN
		INSERT INTO @bang  
			SELECT tensp FROM sanpham 
			inner join xuat on sanpham.masp=xuat.masp
			inner join hangsx on sanpham.mahangsx=hangsx.mahangsx
			where tenhang=@tenhang
	END
	RETURN
END
go
select* from dsluachon(1,'Samsung')
-- cau 8 --
go
create function dsnhap(@ngay int)
returns table
return
select tennv, ngaynhap
from nhap
inner join nhanvien on nhap.manv=nhanvien.manv
where day(ngaynhap)=@ngay
go
select* from dsnhap(22)
-- cau 9 --
go
create function bansanpham (@x money, @y money, @tenhang nvarchar(20))
returns
table
return
     select tensp,tenhang, giaban from Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
	 where tenhang = @tenhang and @x <= giaban and giaban <=@y
go
select * from dbo.bansanpham(7000000, 15000000, 'OPPO')
-- cau 10---
go
create function KhongCoBien ()
returns 
table 
return
	select tensp, masp, Tenhang from Sanpham INNER JOIN Hangsx on Sanpham.mahangsx = Hangsx.mahangsx
go
select * from dbo.KhongCoBien()
order by Tenhang
go
