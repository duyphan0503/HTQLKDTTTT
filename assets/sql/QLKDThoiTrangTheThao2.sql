/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     11/23/2023 12:59:56 AM                       */
/*==============================================================*/
CREATE DATABASE HTKDThoiTrangTheThao
GO
USE HTKDThoiTrangTheThao

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ChiTietDonHang') and o.name = 'FK_CHITIETD_BAOGOM_DONHANG')
alter table ChiTietDonHang
   drop constraint FK_CHITIETD_BAOGOM_DONHANG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ChiTietDonHang') and o.name = 'FK_CHITIETD_MOTA_SANPHAM')
alter table ChiTietDonHang
   drop constraint FK_CHITIETD_MOTA_SANPHAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DanhMuc') and o.name = 'FK_DANHMUC_LACONCUA_DANHMUC')
alter table DanhMuc
   drop constraint FK_DANHMUC_LACONCUA_DANHMUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DanhMucSanPham') and o.name = 'FK_DANHMUCS_THUOCVE_SANPHAM')
alter table DanhMucSanPham
   drop constraint FK_DANHMUCS_THUOCVE_SANPHAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DanhMucSanPham') and o.name = 'FK_DANHMUCS_THUOCVE2_DANHMUC')
alter table DanhMucSanPham
   drop constraint FK_DANHMUCS_THUOCVE2_DANHMUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DonHang') and o.name = 'FK_DONHANG_DATHANG_KHACHHAN')
alter table DonHang
   drop constraint FK_DONHANG_DATHANG_KHACHHAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DonHang') and o.name = 'FK_DONHANG_XULY_NHANVIEN')
alter table DonHang
   drop constraint FK_DONHANG_XULY_NHANVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('GiaSP') and o.name = 'FK_QLKDTHOI_DUOCDINHG_QLKDTHOI2')
alter table GiaSP
   drop constraint FK_QLKDTHOI_DUOCDINHG_QLKDTHOI2
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('GiaSP') and o.name = 'FK_GIASP_DUOCDINHG_GIA')
alter table GiaSP
   drop constraint FK_GIASP_DUOCDINHG_GIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KhachHang') and o.name = 'FK_KHACHHAN_SOHUU_TAIKHOAN')
alter table KhachHang
   drop constraint FK_KHACHHAN_SOHUU_TAIKHOAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MauSP') and o.name = 'FK_MAUSP_COMAU_SANPHAM')
alter table MauSP
   drop constraint FK_MAUSP_COMAU_SANPHAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MauSP') and o.name = 'FK_MAUSP_COMAU2_MAU')
alter table MauSP
   drop constraint FK_MAUSP_COMAU2_MAU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NhaCungCapSP') and o.name = 'FK_QLKDTHOI_CUNGCAPBO_QLKDTHOI2')
alter table NhaCungCapSP
   drop constraint FK_QLKDTHOI_CUNGCAPBO_QLKDTHOI2
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NhaCungCapSP') and o.name = 'FK_NHACUNGC_CUNGCAPBO_NHACUNGC')
alter table NhaCungCapSP
   drop constraint FK_NHACUNGC_CUNGCAPBO_NHACUNGC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SizeSP') and o.name = 'FK_SIZESP_COSIZE_SANPHAM')
alter table SizeSP
   drop constraint FK_SIZESP_COSIZE_SANPHAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SizeSP') and o.name = 'FK_SIZESP_COSIZE2_SIZE')
alter table SizeSP
   drop constraint FK_SIZESP_COSIZE2_SIZE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TaiKhoanKH') and o.name = 'FK_TAIKHOAN_SOHUU2_KHACHHAN')
alter table TaiKhoanKH
   drop constraint FK_TAIKHOAN_SOHUU2_KHACHHAN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ChiTietDonHang')
            and   name  = 'FK_Mota'
            and   indid > 0
            and   indid < 255)
   drop index ChiTietDonHang.FK_Mota
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ChiTietDonHang')
            and   name  = 'FK_BaoGom'
            and   indid > 0
            and   indid < 255)
   drop index ChiTietDonHang.FK_BaoGom
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ChiTietDonHang')
            and   type = 'U')
   drop table ChiTietDonHang
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DanhMuc')
            and   name  = 'FK_DanhMuc_LaConCua'
            and   indid > 0
            and   indid < 255)
   drop index DanhMuc.FK_DanhMuc_LaConCua
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DanhMuc')
            and   type = 'U')
   drop table DanhMuc
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DanhMucSanPham')
            and   name  = 'FK_ThuocVe_ThuocVe2'
            and   indid > 0
            and   indid < 255)
   drop index DanhMucSanPham.FK_ThuocVe_ThuocVe2
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DanhMucSanPham')
            and   name  = 'FK_ThuocVe_ThuocVe'
            and   indid > 0
            and   indid < 255)
   drop index DanhMucSanPham.FK_ThuocVe_ThuocVe
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DanhMucSanPham')
            and   type = 'U')
   drop table DanhMucSanPham
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DonHang')
            and   name  = 'FK_XuLy'
            and   indid > 0
            and   indid < 255)
   drop index DonHang.FK_XuLy
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DonHang')
            and   name  = 'FK_DatHang'
            and   indid > 0
            and   indid < 255)
   drop index DonHang.FK_DatHang
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DonHang')
            and   type = 'U')
   drop table DonHang
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Gia')
            and   type = 'U')
   drop table Gia
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('GiaSP')
            and   name  = 'FK_DuocDinhGia2'
            and   indid > 0
            and   indid < 255)
   drop index GiaSP.FK_DuocDinhGia2
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('GiaSP')
            and   name  = 'FK_DuocDinhGia'
            and   indid > 0
            and   indid < 255)
   drop index GiaSP.FK_DuocDinhGia
go

if exists (select 1
            from  sysobjects
           where  id = object_id('GiaSP')
            and   type = 'U')
   drop table GiaSP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KhachHang')
            and   name  = 'FK_SoHuu'
            and   indid > 0
            and   indid < 255)
   drop index KhachHang.FK_SoHuu
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KhachHang')
            and   type = 'U')
   drop table KhachHang
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Mau')
            and   type = 'U')
   drop table Mau
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MauSP')
            and   name  = 'FK_CoMau2'
            and   indid > 0
            and   indid < 255)
   drop index MauSP.FK_CoMau2
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MauSP')
            and   name  = 'FK_CoMau'
            and   indid > 0
            and   indid < 255)
   drop index MauSP.FK_CoMau
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MauSP')
            and   type = 'U')
   drop table MauSP
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NhaCungCap')
            and   type = 'U')
   drop table NhaCungCap
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NhaCungCapSP')
            and   name  = 'FK_CungCapBoi_CungCapBoi2'
            and   indid > 0
            and   indid < 255)
   drop index NhaCungCapSP.FK_CungCapBoi_CungCapBoi2
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NhaCungCapSP')
            and   name  = 'FK_CungCapBoi_CungCapBoi'
            and   indid > 0
            and   indid < 255)
   drop index NhaCungCapSP.FK_CungCapBoi_CungCapBoi
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NhaCungCapSP')
            and   type = 'U')
   drop table NhaCungCapSP
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NhanVien')
            and   type = 'U')
   drop table NhanVien
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SanPham')
            and   type = 'U')
   drop table SanPham
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Size')
            and   type = 'U')
   drop table Size
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SizeSP')
            and   name  = 'FK_CoSize2'
            and   indid > 0
            and   indid < 255)
   drop index SizeSP.FK_CoSize2
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SizeSP')
            and   name  = 'FK_CoSize'
            and   indid > 0
            and   indid < 255)
   drop index SizeSP.FK_CoSize
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SizeSP')
            and   type = 'U')
   drop table SizeSP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TaiKhoanKH')
            and   name  = 'FK_SoHuu2'
            and   indid > 0
            and   indid < 255)
   drop index TaiKhoanKH.FK_SoHuu2
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TaiKhoanKH')
            and   type = 'U')
   drop table TaiKhoanKH
go

/*==============================================================*/
/* Table: ChiTietDonHang                                        */
/*==============================================================*/
create table ChiTietDonHang (
   MaKH                 char(10)             not null,
   MaNV                 char(10)             not null,
   MaDH                 char(10)             not null,
   MaSP                 char(10)             not null,
   idChiTietDH          int                  not null,
   SoLuong              int                  null,
   Gia                  decimal(19,4)        null,
   constraint PK_CHITIETDONHANG primary key (MaKH, MaNV, MaDH, MaSP, idChiTietDH)
)
go

/*==============================================================*/
/* Index: FK_BaoGom                                             */
/*==============================================================*/




create nonclustered index FK_BaoGom on ChiTietDonHang (MaKH ASC,
  MaNV ASC,
  MaDH ASC)
go

/*==============================================================*/
/* Index: FK_Mota                                               */
/*==============================================================*/




create nonclustered index FK_Mota on ChiTietDonHang (MaSP ASC)
go

/*==============================================================*/
/* Table: DanhMuc                                               */
/*==============================================================*/
create table DanhMuc (
   idDanhMuc            int                  not null,
   idDoanhMucCha        int                  null,
   TenDanhMuc           nvarchar(255)        null,
   constraint PK_DANHMUC primary key (idDanhMuc)
)
go

/*==============================================================*/
/* Index: FK_DanhMuc_LaConCua                                   */
/*==============================================================*/




create nonclustered index FK_DanhMuc_LaConCua on DanhMuc (idDoanhMucCha ASC)
go

/*==============================================================*/
/* Table: DanhMucSanPham                                        */
/*==============================================================*/
create table DanhMucSanPham (
   MaSP                 char(10)             not null,
   idDanhMuc            int                  not null,
   constraint PK_DANHMUCSANPHAM primary key (MaSP, idDanhMuc)
)
go

/*==============================================================*/
/* Index: FK_ThuocVe_ThuocVe                                    */
/*==============================================================*/




create nonclustered index FK_ThuocVe_ThuocVe on DanhMucSanPham (MaSP ASC)
go

/*==============================================================*/
/* Index: FK_ThuocVe_ThuocVe2                                   */
/*==============================================================*/




create nonclustered index FK_ThuocVe_ThuocVe2 on DanhMucSanPham (idDanhMuc ASC)
go

/*==============================================================*/
/* Table: DonHang                                               */
/*==============================================================*/
create table DonHang (
   MaKH                 char(10)             not null,
   MaNV                 char(10)             not null,
   MaDH                 char(10)             not null,
   NgayDat              datetime             null,
   TrangThai            nvarchar(255)        null,
   TongTien             decimal(19,4)        null,
   constraint PK_DONHANG primary key (MaKH, MaNV, MaDH)
)
go

/*==============================================================*/
/* Index: FK_DatHang                                            */
/*==============================================================*/




create nonclustered index FK_DatHang on DonHang (MaKH ASC)
go

/*==============================================================*/
/* Index: FK_XuLy                                               */
/*==============================================================*/




create nonclustered index FK_XuLy on DonHang (MaNV ASC)
go

/*==============================================================*/
/* Table: Gia                                                   */
/*==============================================================*/
create table Gia (
   idGiaSP              int                  not null,
   Gia                  decimal(19,4)        null,
   NgayBatDau           datetime             null,
   NgayKetThuc          datetime             null,
   constraint PK_GIA primary key (idGiaSP)
)
go

/*==============================================================*/
/* Table: GiaSP                                                 */
/*==============================================================*/
create table GiaSP (
   MaSP                 char(10)             not null,
   idGiaSP              int                  not null,
   constraint PK_GIASP primary key (MaSP, idGiaSP)
)
go

/*==============================================================*/
/* Index: FK_DuocDinhGia                                        */
/*==============================================================*/




create nonclustered index FK_DuocDinhGia on GiaSP (MaSP ASC)
go

/*==============================================================*/
/* Index: FK_DuocDinhGia2                                       */
/*==============================================================*/




create nonclustered index FK_DuocDinhGia2 on GiaSP (idGiaSP ASC)
go

/*==============================================================*/
/* Table: KhachHang                                             */
/*==============================================================*/
create table KhachHang (
   MaKH                 char(10)             not null,
   idTK                 int                  null,
   HoTen                nvarchar(255)        null,
   SDT                  char(10)             null,
   Email                varchar(255)         null,
   DiaChi               nvarchar(500)        null,
   constraint PK_KHACHHANG primary key (MaKH)
)
go

/*==============================================================*/
/* Index: FK_SoHuu                                              */
/*==============================================================*/




create nonclustered index FK_SoHuu on KhachHang (MaKH ASC,
  idTK ASC)
go

/*==============================================================*/
/* Table: Mau                                                   */
/*==============================================================*/
create table Mau (
   idMauSP              int                  not null,
   Mau                  nvarchar(50)         null,
   SoLuong              int                  null,
   constraint PK_MAU primary key (idMauSP)
)
go

/*==============================================================*/
/* Table: MauSP                                                 */
/*==============================================================*/
create table MauSP (
   MaSP                 char(10)             not null,
   idMauSP              int                  not null,
   constraint PK_MAUSP primary key (MaSP, idMauSP)
)
go

/*==============================================================*/
/* Index: FK_CoMau                                              */
/*==============================================================*/




create nonclustered index FK_CoMau on MauSP (MaSP ASC)
go

/*==============================================================*/
/* Index: FK_CoMau2                                             */
/*==============================================================*/




create nonclustered index FK_CoMau2 on MauSP (idMauSP ASC)
go

/*==============================================================*/
/* Table: NhaCungCap                                            */
/*==============================================================*/
create table NhaCungCap (
   MaNhaCC              char(10)             not null,
   TenNhaCC             nvarchar(255)        null,
   SDT                  char(10)             null,
   Email                varchar(255)         null,
   DiaChi               nvarchar(500)        null,
   constraint PK_NHACUNGCAP primary key (MaNhaCC)
)
go

/*==============================================================*/
/* Table: NhaCungCapSP                                          */
/*==============================================================*/
create table NhaCungCapSP (
   MaSP                 char(10)             not null,
   MaNhaCC              char(10)             not null,
   constraint PK_NHACUNGCAPSP primary key (MaSP, MaNhaCC)
)
go

/*==============================================================*/
/* Index: FK_CungCapBoi_CungCapBoi                              */
/*==============================================================*/




create nonclustered index FK_CungCapBoi_CungCapBoi on NhaCungCapSP (MaSP ASC)
go

/*==============================================================*/
/* Index: FK_CungCapBoi_CungCapBoi2                             */
/*==============================================================*/




create nonclustered index FK_CungCapBoi_CungCapBoi2 on NhaCungCapSP (MaNhaCC ASC)
go

/*==============================================================*/
/* Table: NhanVien                                              */
/*==============================================================*/
create table NhanVien (
   MaNV                 char(10)             not null,
   HoTen                nvarchar(255)        null,
   NgaySinh             datetime             null,
   GioiTinh             nvarchar(3)          null,
   SDT                  char(10)             null,
   Email                varchar(255)         null,
   DiaChi               nvarchar(500)        null,
   ChucVu               nvarchar(255)        null,
   Luong                decimal(19,4)        null,
   constraint PK_NHANVIEN primary key (MaNV)
)
go

/*==============================================================*/
/* Table: SanPham                                               */
/*==============================================================*/
create table SanPham (
   MaSP                 char(10)             not null,
   TenSP                nvarchar(255)        null,
   MoTa                 nvarchar(500)        null,
   SoLuong              int                  null,
   HinhAnh              varchar(255)         null,
   constraint PK_SANPHAM primary key (MaSP)
)
go

/*==============================================================*/
/* Table: Size                                                  */
/*==============================================================*/
create table Size (
   idSizeSP             int                  not null,
   Size                 varchar(10)          null,
   SoLuong              int                  null,
   constraint PK_SIZE primary key (idSizeSP)
)
go

/*==============================================================*/
/* Table: SizeSP                                                */
/*==============================================================*/
create table SizeSP (
   MaSP                 char(10)             not null,
   idSizeSP             int                  not null,
   constraint PK_SIZESP primary key (MaSP, idSizeSP)
)
go

/*==============================================================*/
/* Index: FK_CoSize                                             */
/*==============================================================*/




create nonclustered index FK_CoSize on SizeSP (MaSP ASC)
go

/*==============================================================*/
/* Index: FK_CoSize2                                            */
/*==============================================================*/




create nonclustered index FK_CoSize2 on SizeSP (idSizeSP ASC)
go

/*==============================================================*/
/* Table: TaiKhoanKH                                            */
/*==============================================================*/
create table TaiKhoanKH (
   MaKH                 char(10)             not null,
   idTK                 int                  not null,
   TenDangNhap          varchar(50)          null,
   MatKhau              varchar(255)         null,
   constraint PK_TAIKHOANKH primary key (MaKH, idTK)
)
go

/*==============================================================*/
/* Index: FK_SoHuu2                                             */
/*==============================================================*/




create nonclustered index FK_SoHuu2 on TaiKhoanKH (MaKH ASC)
go

alter table ChiTietDonHang
   add constraint FK_CHITIETD_BAOGOM_DONHANG foreign key (MaKH, MaNV, MaDH)
      references DonHang (MaKH, MaNV, MaDH)
go

alter table ChiTietDonHang
   add constraint FK_CHITIETD_MOTA_SANPHAM foreign key (MaSP)
      references SanPham (MaSP)
go

alter table DanhMuc
   add constraint FK_DANHMUC_LACONCUA_DANHMUC foreign key (idDoanhMucCha)
      references DanhMuc (idDanhMuc)
go

alter table DanhMucSanPham
   add constraint FK_DANHMUCS_THUOCVE_SANPHAM foreign key (MaSP)
      references SanPham (MaSP)
go

alter table DanhMucSanPham
   add constraint FK_DANHMUCS_THUOCVE2_DANHMUC foreign key (idDanhMuc)
      references DanhMuc (idDanhMuc)
go

alter table DonHang
   add constraint FK_DONHANG_DATHANG_KHACHHAN foreign key (MaKH)
      references KhachHang (MaKH)
go

alter table DonHang
   add constraint FK_DONHANG_XULY_NHANVIEN foreign key (MaNV)
      references NhanVien (MaNV)
go

alter table GiaSP
   add constraint FK_QLKDTHOI_DUOCDINHG_QLKDTHOI2 foreign key (MaSP)
      references SanPham (MaSP)
go

alter table GiaSP
   add constraint FK_GIASP_DUOCDINHG_GIA foreign key (idGiaSP)
      references Gia (idGiaSP)
go

alter table KhachHang
   add constraint FK_KHACHHAN_SOHUU_TAIKHOAN foreign key (MaKH, idTK)
      references TaiKhoanKH (MaKH, idTK)
go

alter table MauSP
   add constraint FK_MAUSP_COMAU_SANPHAM foreign key (MaSP)
      references SanPham (MaSP)
go

alter table MauSP
   add constraint FK_MAUSP_COMAU2_MAU foreign key (idMauSP)
      references Mau (idMauSP)
go

alter table NhaCungCapSP
   add constraint FK_QLKDTHOI_CUNGCAPBO_QLKDTHOI2 foreign key (MaSP)
      references SanPham (MaSP)
go

alter table NhaCungCapSP
   add constraint FK_NHACUNGC_CUNGCAPBO_NHACUNGC foreign key (MaNhaCC)
      references NhaCungCap (MaNhaCC)
go

alter table SizeSP
   add constraint FK_SIZESP_COSIZE_SANPHAM foreign key (MaSP)
      references SanPham (MaSP)
go

alter table SizeSP
   add constraint FK_SIZESP_COSIZE2_SIZE foreign key (idSizeSP)
      references Size (idSizeSP)
go

alter table TaiKhoanKH
   add constraint FK_TAIKHOAN_SOHUU2_KHACHHAN foreign key (MaKH)
      references KhachHang (MaKH)
go

