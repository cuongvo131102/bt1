create database quanlydean2
on primary 
(
  size = 20MB
  ,filegrowth = 1MB
  ,maxsize = 500MB
  ,filename = 'c:\D\New folder (3)\quanlydean2_data.mdf'
  ,name = quanlydean2_data
)
log on 
(
  size = 2MB
  ,filegrowth = 10%
  ,maxsize = 48mb
  ,filename = 'c:\D\New folder (3)\quanlydean2_log.ldf'
  ,name = quanlydean2_log
)
use quanlydean2
go
create table nhanvien
(
manv varchar(9) primary key,
honv nvarchar(15),
tenlot nvarchar(30) ,
tennv nvarchar(30) ,
ngsinh smalldatetime ,
diachi nvarchar(150) ,
phai nvarchar(3) ,
luong numeric(18,0) ,
phong varchar(2) 
)

create table phancong
(
manv varchar(9),
mada varchar(2),
thoigian numeric(18,0) 
primary key (manv,mada)
)
create table dean
(
mada varchar(2) primary key,
tenda nvarchar(50) ,
ddiemda varchar(20) 
)
create table phongban
(
maphg varchar(2) primary key,
tenphg nvarchar(20) 
)
create table thannhan
(
manv varchar(9),
tentn varchar(20),
ngaysinh smalldatetime ,
phai varchar(3),
quanhe varchar(15) ,
primary key (manv,tentn)
)


alter table phancong
add constraint phancong_manv_FK FOREIGN KEY (manv) REFERENCES nhanvien(manv),
constraint phancong_mada_FK FOREIGN KEY (mada) REFERENCES dean(mada)

alter table nhanvien
add constraint nhanvien_phong_FK FOREIGN KEY (phong) REFERENCES phongban(maphg)

alter table thannhan
add constraint thannhan_manv_FK FOREIGN KEY (manv) REFERENCES nhanvien(manv)


alter table phongban
alter column tenphg nvarchar(30)

alter table dean
alter column ddiemda nvarchar(20)

alter table thanhnhan
alter column tentn nvarchar(20)

alter table thannhan
alter column phai nvarchar(3)

alter table thannhan
alter column quanhe nvarchar(15)

alter table nhanvien
add sodienthoai varchar(15)

alter table nhanvien
drop column sodienthoai

insert into nhanvien
values ('123','Đinh','Bá','Tiến','1982/02/27','Mộ Đức','Nam',null,'4')
insert into nhanvien
values('234','Nguyễn','Thanh','Tùng','1956/08/12','Sơn Tịnh','Nam',null,'5')
insert into nhanvien
values('345','Bùi','Thúy','Vũ',null,'Tư Nghĩa','Nữ',null,'4')
insert into nhanvien
values('456','Lê','Thị','Nhàn','1962/7/12','Mộ Đức','Nữ',null,'4')
insert into nhanvien
values('567','Nguyễn','Mạnh','Hùng','1985/03/25','Sơn Tịnh','Nam',null,'5')
insert into nhanvien
values('678','Trần','Hồng','Quan',null,'Bình Sơn','Nam',null,'5')
insert into nhanvien
values('789','Trần','Thanh','Tâm','1972/06/17','TP Quảng Ngãi','Nam',null,'5')
insert into nhanvien
values('890','Cao','Thanh','Huyền',null,'Tư Nghã','Nữ',null,'1')
insert into nhanvien
values('901','Vương','Ngọc','Quyền','1987/12/12','Mộ Đức','Nam',null,'1')

insert into phongban
values('1','Quản lý')
insert into phongban
values('4','Điều hành')
insert into phongban
values('5','Nghiên cứu')

insert into dean
values('1','Nâng cao chất lượng muối','Sa Huỳnh')
insert into dean
values('10','Xây dựng nhà máy chế biến thủy sản','Dung Quất')
insert into dean
values('2','Phát triển hạ tầng mạng','TP Quảng Ngãi')
insert into dean
values('20','Truyền tải cáp quang','TP Quảng Ngãi')
insert into dean
values('3','Tin học hóa trường học','Ba tơ')
insert into dean
values('30','Đào tạo nhân lực','Tịnh Phong')

insert into phancong
values('123','1','33')
insert into phancong
values('123','2','8')
insert into phancong
values('345','10','10')
insert into phancong
values('345','20','10')
insert into phancong
values('345','3','10')
insert into phancong
values('456','1','20')
insert into phancong
values('456','2','20')
insert into phancong
values('678','3','40')
insert into phancong
values('789','10','35')
insert into phancong
values('789','20','30')
insert into phancong
values('789','30','5')

insert into thannhan
values('123','Châu','2005/10/30','Nữ','Con gái')
insert into thannhan
values('123','Duy','2001/10/25','Nam','Con trai')
insert into thannhan
values('123','Phương','1985/10/30','Nữ','Vợ chồng')
insert into thannhan
values('234','Thanh','1980/04/05','Nữ','Con gái')
insert into thannhan
values('345','Dương','1950/10/30','Nam','Vợ chồng')
insert into thannhan
values('345','Khang','1982/10/25','Nam','Con trai')
insert into thannhan
values('456','Hùng','1987/01/01','Nam','Con trai')
insert into thannhan
values('901','Thương','1989/04/05','Nữ','Vợ chồng')