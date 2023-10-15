CREATE DATABASE HTQLKDTTTT
Go
USE HTQLKDTTTT
GO
CREATE TABLE KhachHang
(
	idKH INT IDENTITY(1,1) NOT NULL,
	TenKH NVARCHAR(100) NOT NULL,
	SDT CHAR(10),
	DiaChi NVARCHAR(MAX),
	Email VARCHAR(100),
	CONSTRAINT PK_KhachHang PRIMARY KEY(idKH),
	CONSTRAINT CHK_KhachHang_SDT CHECK(SDT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)
go
CREATE TABLE DanhMuc
(
	idDanhMuc INT IDENTITY(1,1) NOT NULL,
	TenDanhMuc NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_DanhMuc PRIMARY KEY(idDanhMuc)
)
go
CREATE TABLE ThuongHieu
(
	idThuongHieu INT IDENTITY(1,1) NOT NULL,
	TenDanhMuc NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_ThuongHieu PRIMARY KEY(idThuongHieu)
)
GO
CREATE TABLE SanPham (
	idSP INT IDENTITY(1,1) NOT NULL,
	TenSP NVARCHAR(255) NOT NULL,
	Mota TEXT ,
	Gia MONEY NOT NULL,
	HinhAnh VARCHAR(255),
	SoLuongTon INT,
	idDanhMuc INT ,
	idThuongHieu INT,
	CONSTRAINT PK_SanPham PRIMARY KEY(idSP),
	CONSTRAINT FK_SanPham_DanhMuc FOREIGN KEY(idDanhMuc) REFERENCES dbo.DanhMuc(idDanhMuc),
	CONSTRAINT FK_SanPham_ThuongHieu FOREIGN KEY(idThuongHieu) REFERENCES dbo.ThuongHieu(idThuongHieu)
)
go
CREATE TABLE SizeSanPham
(
	idSizeSP INT IDENTITY(1,1) NOT NULL,
	idSP INT,
	Size VARCHAR(10),
	SoLuongTon INT,
	CONSTRAINT PK_SizeSanPham PRIMARY KEY(idSizeSP),
	CONSTRAINT FK_SizeSanPham FOREIGN KEY(idSP) REFERENCES dbo.SanPham(idSP)
)
go
CREATE TABLE DonHang
(
	idDonHang INT IDENTITY(1,1) NOT NULL,
	idKH INT,
	NgayDat DATE DEFAULT(GETDATE()),
	TrangThai NVARCHAR(100) DEFAULT(N'Chờ xử lý'),
	CONSTRAINT PK_DonHang PRIMARY KEY(idDonHang),
	CONSTRAINT FK_DonHang_KhachHang FOREIGN KEY(idKH) REFERENCES dbo.KhachHang(idKH),
	CONSTRAINT CHK_DonHang_TrangThai CHECK(TrangThai IN (N'Chờ xử lý',N'Đang vận chuyển',N'Đã thanh toán',N'Đã giao'))
)
go
CREATE TABLE ChiTietDonHang
(
	idChiTietDH INT IDENTITY(1,1) NOT NULL,
	idDonHang INT,
	idSP INT,
	SoLuong INT,
	TongTien MONEY,
	CONSTRAINT PK_ChiTietDonHang PRIMARY KEY(idChiTietDH),
	CONSTRAINT FK_ChiTietDonHang_DonHang FOREIGN KEY(idDonHang) REFERENCES dbo.DonHang(idDonHang),
	CONSTRAINT FK_ChiTietDonHang_SanPham FOREIGN KEY(idSP) REFERENCES dbo.SanPham(idSP)
)
CREATE TABLE ThongKe (
    idThongKe INT IDENTITY(1,1) NOT NULL,
    ThoiGian DATE,
    DoanhSo MONEY,
    LoiNhuan MONEY,
    TonKho INT,
    CONSTRAINT PK_ThongKe PRIMARY KEY(idThongKe)
)
GO
CREATE TABLE BaoCao (
    idBaoCao INT IDENTITY(1,1) NOT NULL,
    ThoiGian DATE,
    NoiDung NVARCHAR(MAX),
    CONSTRAINT PK_BaoCao PRIMARY KEY(idBaoCao)
)
Go
INSERT INTO KhachHang (TenKH, SDT, DiaChi, Email)
VALUES
    (N'Nguyễn Văn A','1234567890', N'123 Đường ABC, Thành phố XYZ', 'nguyenvana@example.com'),
    (N'Trần Thị B','0987654321', N'456 Đường XYZ, Thành phố ABC', 'tranthib@example.com'),
    (N'Lê Hồng C','1111111111', N'789 Đường DEF, Thành phố GHI', 'lehongc@example.com')
GO
--DBCC CHECKIDENT(KhachHang,RESEED,0)
go
INSERT INTO DanhMuc (TenDanhMuc)
VALUES
    (N'Áo thể thao'),
    (N'Quần thể thao'),
    (N'Giày thể thao')
GO
INSERT INTO ThuongHieu (TenDanhMuc)
VALUES
    (N'Adidas'),
    (N'Nike'),
    (N'Puma')
Go
INSERT INTO SanPham (TenSP, Mota, Gia, HinhAnh, SoLuongTon, idDanhMuc, idThuongHieu)
VALUES
    (N'Áo thể thao Adidas', N'Mô tả sản phẩm 1', 49.99, 'hinh1.jpg', 100, 1, 1),
    (N'Quần thể thao Nike', N'Mô tả sản phẩm 2', 29.99, 'hinh2.jpg', 50, 2, 2),
    (N'Giày thể thao Puma', N'Mô tả sản phẩm 3', 19.99, 'hinh3.jpg', 75, 3, 3)
GO
INSERT INTO SizeSanPham (idSP, Size, SoLuongTon)
VALUES
    (1, 'S', 10),
    (1, 'M', 20),
    (2, 'M', 15)
GO
INSERT INTO DonHang (idKH, NgayDat, TrangThai)
VALUES
    (1, '2023-10-15', N'Chờ xử lý'),
    (2, '2023-10-16', N'Đang vận chuyển')
GO
INSERT INTO ChiTietDonHang (idDonHang, idSP, SoLuong, TongTien)
VALUES
    (1, 1, 2, 99.98),
    (2, 2, 1, 29.99)