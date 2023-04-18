use QLBanHang
go
--- cau 1 ----
create trigger cau9_1
on nhap for insert 
as 
begin
declare @masp nvarchar(10), @manv nvarchar(10), @sln int, @dgn float
select @masp=masp, @manv=manv, @sln=soluongN, @dgn=dongiaN
from inserted
if (not exists(select* from sanpham where masp =@masp))
	begin
		raiserror(N'Không tồn tại sản phẩm trong danh mục sản phẩm',16,1)
		rollback tran
	end
else
	if(not exists(select* from nhanvien where manv=@manv))
		begin
			raiserror(N'Không tồn tại mã này',16,1)
			rollback tran
		end
	else
	if(@sln<=0 or @dgn<=0)
	begin
		raiserror(N'Nhập sai số lượng hoặc đơn giá',16,1)
		rollback tran
	end
	else
		update sanpham set soluong=soluong + @sln
		from sanpham where masp=@masp
end

insert into nhap 
values('nh01','sp01','nv01','3/7/2018',300,1500000)
--- cau 2 ---
go
create trigger cau9_2
on xuat for insert 
as 
begin
declare @masp nvarchar(10), @manv nvarchar(10), @slx int, @sol int
select @masp=sanpham.masp, @manv=manv, @slx=soluongx, @sol=soluong
from inserted, sanpham
if (not exists(select* from sanpham where masp =@masp))
	begin
		raiserror(N'Không tồn tại sản phẩm trong danh mục sản phẩm',16,1)
		rollback tran
	end
else
	if(not exists(select* from nhanvien where manv=@manv))
		begin
			raiserror(N'Không tồn tại mã này',16,1)
			rollback tran
		end
	else
	if(@slx<@sol)
	begin
		raiserror(N'Nhập sai số lượng hoặc đơn giá',16,1)
		rollback tran
	end
	else
		update sanpham set soluong=soluong - @slx
		from sanpham where masp=@masp
end

--- cau 3 ---
go
create trigger cau9_3 
on xuat
for delete as
begin
update sanpham set soluong=soluong + (select soluongX from deleted)
from sanpham
join deleted on sanpham.masp=deleted.masp
end
--- cau 4 ---
GO
CREATE TRIGGER CAU9_4
ON Xuat
FOR UPDATE AS
BEGIN 
DECLARE @masp nvarchar(10), @slx int
SELECT @masp = masp, @slx = soluongX FROM inserted
UPDATE Sanpham SET soluong = soluong - @slx WHERE masp = @masp
IF @slx > (SELECT TOP 1 Soluong FROM Sanpham)
	BEGIN
		RAISERROR (N'Số lượng xuất nhiều hơn trong kho',16,1)
		ROLLBACK TRAN
	END
END
--- cau 5 -----
GO
CREATE TRIGGER CAU9_5 
ON Nhap
FOR UPDATE AS
BEGIN 
DECLARE @masp nvarchar(10), @sln int, @dgn money
SELECT @masp = masp, @sln = soluongN, @dgn = dongiaN FROM inserted
UPDATE Sanpham SET soluong = soluong + @sln WHERE masp = @masp
IF @sln <=0 OR @dgn <= 0
	BEGIN
		RAISERROR (N'Số lượng nhập và đơn giá nhập sai',16,1)
		ROLLBACK TRAN
	END
END
----- cau 6 -----
go
create trigger cau9_6 
on xuat
for delete as
begin
update sanpham set soluong=soluong - (select soluongX from deleted)
from sanpham
join deleted on sanpham.masp=deleted.masp
end