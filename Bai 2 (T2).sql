use QLBanHang
go
select* from hangsx

select* from nhanvien

select* from nhap

select* from sanpham

select* from xuat

-- Cau 2 --
select masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota
from sanpham, hangsx
where giaban>0
order by giaban DESC

-- Cau 3 --
select*
from sanpham, hangsx
where (tenhang='samsung') 

-- Cau 4 --
select*
from nhanvien
where gioitinh='N?' and phong='K? toán'

-- Cau 5 --
select sohdn, sanpham.masp, tensp, tenhang, soluongN, dongiaN, soluongN*dongiaN as tiennhap, mausac, donvitinh, ngaynhap, tennv,phong 
from nhap
join sanpham on nhap.masp = sanpham.masp
join hangsx on sanpham.mahangsx =hangsx.mahangsx
join nhanvien on nhap.manv = nhanvien.manv
order by nhap.sohdn ASC

-- Cau 6 --
select sohdx, sanpham.masp, tensp, tenhang, soluongx, giaban, tienxuat=soluongx*giaban, mausac, donvitinh, ngayxuat,tennv, phong
from xuat
inner join sanpham on xuat.masp = sanpham.masp
inner join hangsx on sanpham.mahangsx = hangsx.mahangsx
inner join nhanvien on xuat.manv = nhanvien.manv
where month(xuat.ngayxuat)= 10 and year(xuat.ngayxuat)= 2018
order by xuat.sohdx desc

-- Cau 7 --
select sohdn, sanpham.masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong,tenhang
from nhap 
join sanpham on nhap.masp= sanpham.masp
join hangsx on sanpham.mahangsx=hangsx.mahangsx
join nhanvien on nhap.manv = nhanvien.manv
where year(ngaynhap)= 2017 and hangsx.tenhang='Samsung'

-- Cau 8 --
select top 10 *
from xuat 
order by soluongX DESC

-- Cau 9 --
select top 10 *
from sanpham
order by giaban DESC

-- Cau 10 --
select *
from sanpham
where giaban between '100000' and '500000'

-- Cau 11 --
select sanpham.tensp, count(soluongN*dongiaN) as tongdoanhthu
from nhap, sanpham
where tensp= 'Samsung'
group by tensp

-- cau 12 --
select COUNT(*) as N'tong tien'
from xuat 
where year(ngayxuat)=2020 and month(ngayxuat)=06 and day(ngayxuat)=14

-- cau 13 --
select top 1 dongiaN,sohdn,ngaynhap 
from Nhap 
where Year(ngaynhap)=2018
--cau 14--
select top 10 soluongN,manv,tensp
from Nhap,Sanpham 
order by soluongN DESC

--cau 15-- 
select masp,tensp,manv,tenhang
from Sanpham,Nhanvien,Hangsx
where tenhang='SAMSUNG' AND manv='NV01'

-- cau 16--
select sohdn,masp,soluongN,ngaynhap,manv
from Nhap
where masp='SP02' AND manv='NV02'

--cau 17--
select tennv, manv 
from Nhanvien join Xuat on nhanvien.manv=xuat.manv
where year(ngayxuat)=2020 AND month(ngayxuat)=3 AND masp='SP02'