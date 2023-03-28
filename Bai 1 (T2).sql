create database QLBanHang
go
use QLBanHang
go
create table sanpham
(
masp nchar(10) primary key,
mahangsx nchar(10),
tensp nvarchar(10),
soluong int,
mausac nvarchar(20),
giaban money,
donvitinh nchar(10),
mota nvarchar(max)
)

create table hangsx
(
mahangsx nchar(10) primary key,
tenhang nvarchar(20),
diachi nvarchar(30),
sodt nvarchar(20),
email nvarchar(30)
)

create table nhanvien
(
manv nchar(10) primary key,
tennv nvarchar(20),
gioitinh nchar(10),
diachi nvarchar(10),
sodt nvarchar(20),
email nvarchar(30),
phong nvarchar(30)
)

create table nhap
(
sohdn nchar(10),
masp nchar(10),
manv nchar(10),
ngaynhap date,
soluongN int,
dongiaN money,
primary key (sohdn,masp)
)

create table xuat
(
sohdx nchar(10),
masp nchar(10),
manv nchar(10),
ngayxuat date,
soluongX int,
primary key (sohdx,masp)
)


alter table sanpham
add constraint sanpham_mahangsx_FK FOREIGN KEY (mahangsx) REFERENCES hangsx(mahangsx)

alter table nhap
add constraint nhap_masp_fk foreign key (masp) references sanpham(masp),
	constraint nhap_manv_fk foreign key(manv) references nhanvien(manv)

alter table xuat
add constraint xuat_masp_fk foreign key (masp) references sanpham(masp),
	constraint xuat_manv_fk foreign key (manv) references nhanvien(manv)


insert into hangsx
values('H01','Samsung','Korea','011-08271717','ss@gmail.com.kr')
insert into hangsx
values('H02','OPPO','China','081-08626262','oppo@gmail.com.cn')
insert into hangsx
values('H03','Vinfone','Việt Nam','084-098262626','vf@gmail.com.vn')

insert into nhanvien
values('NV01','Nguyễn Thị Thu','Nữ','Hà Nội','0982626521','thu@gmail.com','Kế toán')
insert into nhanvien
values('NV02','Lê Văn Nam','Nam','Bắc Ninh','0972525252','nam@gmail.com','Vật tư')
insert into nhanvien
values('NV03','Trần Hoà Bình','Nữ','Hà Nội','0328388388','hb@gmail.com','Kế toán')

insert into sanpham
values('SP01','H02','F1 Plus',100,'Xám',7000000,'Chiếc','Hàng cận cao cấp')
insert into sanpham
values('SP02','H01','Note 11',50,'Đỏ',19000000,'Chiếc','Hàng cao cấp')
insert into sanpham
values('SP03','H02','F3 lite',200,'Nâu',3000000,'Chiếc','Hàng phổ thông')
insert into sanpham
values('SP04','H03','Vjoy3',200,'Xám',1500000,'Chiếc','Hàng phổ thông')
insert into sanpham
values('SP05','H01','Galaxy V21',500,'Nâu',8000000,'Chiếc','Hàng cận cao cấp')

insert into nhap
values('N01','SP02','NV01','2019-02-05',10,17000000)
insert into nhap
values('N02','SP01','NV02','2020-04-07',30,6000000)
insert into nhap
values('N03','SP04','NV02','2020-05-17',20,1200000)
insert into nhap
values('N04','SP01','NV03','2020-03-22',20,6200000)
insert into nhap
values('N05','SP05','NV01','2020-07-07',20,7000000)

insert into xuat
values ('X01','SP03','NV02','2020-06-14',5)
insert into xuat
values ('X02','SP01','NV03','2019-03-05',3)
insert into xuat
values ('X03','SP02','NV01','2020-12-12',1)
insert into xuat
values ('X04','SP03','NV02','2020-06-02',2)
insert into xuat
values ('X05','SP05','NV01','2020-05-18',1)