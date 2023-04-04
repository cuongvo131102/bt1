use QLBanHang
go
--cau 1--
create function cau_1(@tensp nvarchar(10))
returns nvarchar(20)
as
begin
declare @ten nvarchar(20)
set @ten= (select tenhang from hangsx join sanpham on hangsx.mahangsx=sanpham.mahangsx where @tensp=masp)
return @ten
end
go
select dbo.cau_1('SP02')

-- cau 2--
create function cau_2(@x int, @y int)
returns int
as
begin
declare @tong int
select @tong= sum(nhap.soluongN*nhap.dongiaN)
from nhap
where year(ngaynhap) between @x and @y
return @tong
end
go
select dbo.cau_2(2018,2020)

-- cau 3--
CREATE FUNCTION TongNhapXuat(@tensp nvarchar(20), @y int)
RETURNS int
AS
BEGIN 
	DECLARE @TongNhapXuat int
	SELECT @TongNhapXuat = soluongN - soluongX FROM Nhap INNER JOIN Xuat ON Nhap.masp = Xuat.masp INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
	WHERE Sanpham.tensp = @tensp AND YEAR(Ngaynhap) = @y AND YEAR(Ngayxuat) = @y
	RETURN @TongNhapXuat
END
GO
SELECT dbo.TongNhapXuat('GalaxyV21', 2020)

--cau 4-- 
create function cau_4(@x int, @y int)
returns int
as
begin
declare @tong int
select @tong= sum(nhap.soluongN*nhap.dongiaN)
from nhap
where day(ngaynhap) between @x and @y
return @tong
end
go
select dbo.cau_4(01,05)

-- cau 5--
CREATE FUNCTION cau_5(@tenhang nvarchar(20), @y int)
RETURNS int
AS
BEGIN 
	DECLARE @TongGiaTriXuat int
	SELECT @TongGiaTriXuat = SUM(soluongX*giaban) FROM Xuat INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
	WHERE Hangsx.Tenhang = @tenhang AND YEAR(Ngayxuat) = @y
	RETURN @TongGiaTriXuat
END
GO
SELECT dbo.cau_5('Samsung', 2020)
-- cau 6 --
create function cau_6(@p nvarchar(50))
returns nvarchar(50)
as
begin
declare @tong int
select @tong=count(nhanvien.manv)
from nhanvien
where @p=nhanvien.phong
return @tong
end
go
select dbo.cau_6('Kế toán')
-- cau 7 --
CREATE FUNCTION Cau_7(@tensp nvarchar(20),@y int)
RETURNS int
AS
BEGIN 
	DECLARE @Soluongxuattheongay int
	SELECT @Soluongxuattheongay = Sum(soluongX) FROM Xuat INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
	WHERE Sanpham.tensp = @tensp AND DAY(Ngayxuat) = @y
	RETURN @Soluongxuattheongay
END
GO
SELECT dbo.cau_7('GalaxyV21', 18)
-- cau 8--
CREATE FUNCTION cau_8(@x nchar(10))
RETURNS int
AS
BEGIN 
	DECLARE @Sodienthoainhanvienxuat int
	SELECT @Sodienthoainhanvienxuat = Sodt FROM Nhanvien INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv
	WHERE Xuat.Sohdx = @x
	RETURN @Sodienthoainhanvienxuat
END
GO
SELECT dbo.cau_8('X03')
-- cau 9--
CREATE FUNCTION cau_9(@tensp nvarchar(20), @y int)
RETURNS int
AS
BEGIN 
	DECLARE @TongNhapXuat int
	SELECT @TongNhapXuat = soluongN - soluongX FROM Nhap INNER JOIN Xuat ON Nhap.masp = Xuat.masp INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
	WHERE Sanpham.tensp = @tensp AND YEAR(Ngaynhap) = @y AND YEAR(Ngayxuat) = @y
	RETURN @TongNhapXuat
END
GO
SELECT dbo.cau_9('F1Plus', 2020)
-- cau 10 --
CREATE FUNCTION cau_10(@tenhang nvarchar(20))
RETURNS int
AS
BEGIN 
	DECLARE @Tongsoluongsanpham int
	SELECT @Tongsoluongsanpham = Count(tensp) FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx 
	WHERE Hangsx.Tenhang = @tenhang
	RETURN @Tongsoluongsanpham
END
GO
SELECT dbo.cau_10('Samsung')