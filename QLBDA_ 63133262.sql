CREATE DATABASE QLBDA_63133262;
GO
USE QLBDA_63133262;

--Bảng PHANQUYEN
CREATE TABLE PHANQUYEN(
	IDPhanQuyen INT PRIMARY KEY,
	TenPhanQuyen VARCHAR(50)
)
--Bảng NGUOIDUNG
CREATE TABLE NGUOIDUNG(
	MaND INT IDENTITY(1,1) PRIMARY KEY,
	Email VARCHAR(100),
	MatKhau VARCHAR(50),
	SDT VARCHAR(10),
	IDPhanQuyen INT,
	FOREIGN KEY (IDPhanQuyen) REFERENCES dbo.PHANQUYEN(IDPhanQuyen)
)
-- Bảng LOAIDOAN
CREATE TABLE LOAIDOAN (
  MaLoaiDoAn VARCHAR(50) PRIMARY KEY,
  TenLoaiDoAn NVARCHAR(255)
);

-- Bảng DOAN
CREATE TABLE DOAN (
  MaDA INT PRIMARY KEY,
  TenDA VARCHAR(255),
  MoTaDoAn NVARCHAR(255),
  DonViTinh NVARCHAR(50),
  AnhDoAn VARCHAR(255),
  DonGia DECIMAL,
  MaLoaiDoAn VARCHAR(50),
  FOREIGN KEY (MaLoaiDoAn) REFERENCES dbo.LOAIDOAN(MaLoaiDoAn)
);

-- Bảng KHACHHANG
CREATE TABLE KHACHHANG (
  MaKH VARCHAR(10) PRIMARY KEY,
  HoTen NVARCHAR(100),
  Email VARCHAR(100),
  SoDienThoai VARCHAR(10),
  DiaChi NVARCHAR(150)
);

-- Bảng NHANVIEN
CREATE TABLE NHANVIEN (
  MaNV VARCHAR(10) PRIMARY KEY,
  HoTenNV NVARCHAR(100),
  SoDienThoai VARCHAR(10),
  Email VARCHAR(100)
);

-- Bảng GIOHANG
CREATE TABLE GIOHANG (
  SoHD int PRIMARY KEY,
  ThoiGianNhan NVARCHAR(20) ,
  MaKH VARCHAR(10),
  MaNVDuyet VARCHAR(10),
  MaNVGiaoHang VARCHAR(10),
  TinhTrang INT CHECK (TinhTrang IN (0, 1, 2)),
  FOREIGN KEY (MaKH) REFERENCES dbo.KHACHHANG(MaKH),
  FOREIGN KEY (MaNVDuyet) REFERENCES dbo.NHANVIEN(MaNV),
  FOREIGN KEY (MaNVGiaoHang) REFERENCES dbo.NHANVIEN(MaNV)
);

-- Bảng CHITIETGIOHANG
CREATE TABLE CHITIETGIOHANG (
  SoHD int,
  MaDA INT,
  SoLuong INT,
  DonGiaBan DECIMAL,
  PRIMARY KEY (SoHD, MaDA),
  FOREIGN KEY (SoHD) REFERENCES dbo.GIOHANG(SoHD),
  FOREIGN KEY (MaDA) REFERENCES dbo.DOAN(MaDA)
);

GO
INSERT INTO dbo.PHANQUYEN(IDPhanQuyen,TenPhanQuyen) VALUES
	(001,'admin'),
	(002,'user')

INSERT INTO dbo.NGUOIDUNG(Email,MatKhau,SDT,IDPhanQuyen) VALUES
	('duong.tt.63ttql@ntu.edu.vn','@dmin1','0336157396',001),
	('nguyenvana@gmail.com','Password1','0123456789',002),
	('tranthib@gmail.com','Password2','0987654321',002),
	('levanc@gmail.com','Password3','0912345678',002),
	('huynhvane@gmail.com','Password4','0901234567',002)

INSERT INTO dbo.LOAIDOAN (MaLoaiDoAn, TenLoaiDoAn) VALUES
    ('DA001', N'Đồ sống'),
	('DA002', N'Đồ chiên,nướng'),
    ('DA003', N'Cơm'),
	('DA004', N'Mì'),
	('DA005', N'Tráng miệng'),
	('DA006', N'Đồ uống');

INSERT INTO dbo.DOAN (MaDA, TenDA, MoTaDoAn, DonViTinh, AnhDoAn, DonGia, MaLoaiDoAn) VALUES
    (0001, 'Sushi', N'Món ăn Nhật Bản truyền thống gồm cơm dẻo được cuốn với các loại hải sản, rau sống và gia vị.', N'Đĩa', 'sushi.jpg', 150000, 'DA001'),
    (0002, 'Ramen', N'Mì gói Nhật Bản có nước dùng đậm đà và kèm theo thịt, rau và toppings khác.', N'Tô', 'ramen.jpg', 90000, 'DA004'),
    (0003, 'Tempura', N'Món ăn chiên giòn với các loại rau, hải sản hoặc thịt được chế biến bằng bột chiên.', N'Đĩa', 'tempura.jpg', 120000, 'DA002'),
    (0004, 'Udon', N'Mì dày Nhật Bản được nấu trong nước dùng và kèm theo các loại topping như thịt, rau và tempura.', N'Tô', 'udon.jpg', 100000, 'DA004'),
    (0005, 'Sashimi', N'Món sashimi gồm các miếng hải sản tươi sống được thái mỏng và ăn kèm với nước tương.', N'Đĩa', 'sashimi.jpg', 180000, 'DA001'),
    (0006, 'Tonkatsu', N'Thịt lợn chiên giòn với lớp vỏ bên ngoài và thưởng thức kèm với cơm và xốt.', N'Dĩa', 'tonkatsu.jpg', 130000, 'DA003'),
    (0007, 'Yakitori', N'Món thịt nướng trên que gỗ với các loại thịt và rau được châm nước tương.', N'Đĩa', 'yakitori.jpg', 80000, 'DA002'),
    (0008, 'Okonomiyaki', N'Bánh xèo Nhật Bản chứa nhiều thành phần như bột, thịt, hải sản, rau và xốt.', N'Đĩa', 'okonomiyaki.jpg', 110000, 'DA002'),
    (0009, 'Matcha', N'Bột trà xanh Nhật Bản được pha với nước nóng và thưởng thức kèm theo bánh ngọt.', N'Ly', 'matchaqc.jpg', 60000, 'DA006'),
    (0010, 'Mochi', N'Bánh dẻo Nhật Bản làm từ bột nếp và thường có nhân trái cây hoặc đậu.', N'Cái', 'mochi.jpg', 50000, 'DA005'),
    (0011, 'Gyoza', N'Bánh xếp Nhật Bản có nhân thịt và rau, được chiên giòn ở một mặt.', N'Đĩa', 'gyoza.jpg', 90000, 'DA002'),
    (0012, 'Sukiyaki', N'Món lẩu Nhật Bản với thịt bò, rau và mì nấu trong nước dùng đậm đà.', N'Đĩa', 'sukiyaki.jpg', 160000, 'DA004'),
    (0013, 'Takoyaki', N'Bánh trứng Nhật Bản chứa một mảnh bạch tuộc và các loại gia vị, được chiên giòn.', N'Đĩa', 'takoyaki.jpg', 80000, 'DA002'),
    (0014, 'Onigiri', N'Bánh cơm Nhật Bản được nén vào hình tam giác hoặc tròn và có nhân bên trong.', N'Cái', 'onigiri.jpg', 30000, 'DA005'),
    (0015, 'Nigiri', N'Món sushi gồm một miếng cơm dẻo được kèm theo một lát hải sản hoặc thịt.', N'Cái', 'nigiri.jpg', 50000, 'DA001'),
    (0016, 'Soba', N'Mì soba Nhật Bản làm từ bột gạo lứt hoặc bắp và thường được ăn lạnh với nước tương.', N'Đĩa', 'soba.jpg', 90000, 'DA004'),
    (0017, 'Kare Raisu', N'Cơm cà ri Nhật Bản với nước sốt cà ri và thịt hoặc hải sản.', N'Đĩa', 'kare-rice.jpg', 120000, 'DA003'),
    (0018, 'Chawanmushi', N'Món hấp Nhật Bản gồm trứng và hải sản hoặc thịt trong nước dùng.', N'Cái', 'chawanmushi.jpg', 70000, 'DA002'),
    (0019, 'Yakisoba', N'Mì xào Nhật Bản với rau, thịt và xốt đậm đà.', N'Đĩa', 'yakisoba.jpg', 100000, 'DA004'),
    (0020, 'Yakiniku', N'Thịt nướng Nhật Bản có thể là bò, heo hoặc gà được nướng trên bếp than.', N'Đĩa', 'yakiniku.jpg', 150000, 'DA002'),
    (0021, 'Unagi', N'Cá lươn nướng Nhật Bản thường được chế biến với xốt ngọt.', N'Đĩa', 'unagi.jpg', 180000, 'DA002'),
    (0022, 'Shabu-shabu', N'Món lẩu Nhật Bản gồm thịt, rau và hải sản được nhúng vào nước sôi.', N'Đĩa', 'shabu-shabu.jpg', 140000, 'DA004'),
    (0023, 'Hokkaido Milk', N'Sữa Hokkaido Nhật Bản có vị ngọt và thơm đặc trưng.', N'Ly', 'hokkaido-milk.jpg', 50000, 'DA006'),
    (0024, 'Yuzu', N'Quả yuzu Nhật Bản có hương vị chua ngọt và thường được sử dụng trong các món tráng miệng.', N'Quả', 'yuzu.jpg', 60000, 'DA005'),
    (0025, 'Kaiseki', N'Một dạng bữa ăn truyền thống Nhật Bản gồm nhiều món ăn nhỏ và tinh tế.', N'Bộ', 'kaiseki.jpg', 250000, 'DA001'),
    (0026, 'Karaage', N'Thịt gà chiên giòn với lớp vỏ bên ngoài và thưởng thức kèm với xốt.', N'Đĩa', 'karaage.jpg', 90000, 'DA002'),
    (0027, 'Tofu', N'Đậu phụ Nhật Bản được chế biến thành các món ăn khác nhau như lẩu, xào hoặc nướng.', N'Đĩa', 'tofu.jpg', 70000, 'DA002'),
    (0028, 'Anmitsu', N'Món tráng miệng Nhật Bản gồm đường, trái cây, agar và đậu.', N'Cái', 'anmitsu.jpg', 60000, 'DA005'),
    (0029, 'Wagashi', N'Loại bánh truyền thống Nhật Bản thường được làm từ đậu và có hình dáng độc đáo.', N'Cái', 'wagashi.jpg', 50000, 'DA005'),
    (0030, 'Dorayaki', N'Bánh kẹp Nhật Bản gồm hai miếng bánh mềm được kết hợp bởi một lớp nhân.', N'Cái', 'dorayaki.jpg', 40000, 'DA005');

INSERT INTO dbo.KHACHHANG (MaKH, HoTen, Email, SoDienThoai, DiaChi) VALUES
    ('KH0001', N'Nguyễn Văn A', 'nguyenvana@gmail.com', '0123456789', N'Khánh Hòa'),
    ('KH0002', N'Trần Thị B', 'tranthib@gmail.com', '0987654321', N'Khánh Hòa'),
    ('KH0003', N'Lê Văn C', 'levanc@gmail.com', '0912345678', N'Khánh Hòa'),
    ('KH0004', N'Phạm Thị D', 'phamthid@gmail.com', '0876543210', N'Khánh Hòa'),
    ('KH0005', N'Huỳnh Văn E', 'huynhvane@gmail.com', '0901234567', N'Khánh Hòa'),
    ('KH0006', N'Ngô Thị F', 'ngothisf@gmail.com', '0898765432', N'Khánh Hòa'),
    ('KH0007', N'Đinh Văn G', 'dinhvang@gmail.com', '0932109876', N'Khánh Hòa'),
    ('KH0008', N'Lý Thị H', 'lythih@gmail.com', '0945678901', N'Khánh Hòa'),
    ('KH0009', N'Trương Văn I', 'truongvani@gmail.com', '0965432109', N'Khánh Hòa'),
    ('KH0010', N'Hoàng Thị J', 'hoangthij@gmail.com', '0956789012', N'Khánh Hòa'),
    ('KH0011', N'Lương Văn K', 'luongvank@gmail.com', '0912345678', N'Khánh Hòa'),
    ('KH0012', N'Vũ Thị L', 'vuthil@gmail.com', '0987654321', N'Khánh Hòa'),
    ('KH0013', N'Mai Văn M', 'maivanm@gmail.com', '0876543210', N'Khánh Hòa'),
    ('KH0014', N'Đặng Thị N', 'dangthin@gmail.com', '0901234567', N'Khánh Hòa'),
    ('KH0015', N'Bùi Văn O', 'buivano@gmail.com', '0898765432', N'Khánh Hòa'),
    ('KH0016', N'Cao Thị P', 'caothip@gmail.com', '0932109876', N'Khánh Hòa'),
    ('KH0017', N'Đỗ Văn Q', 'dovanq@gmail.com', '0945678901', N'Khánh Hòa'),
    ('KH0018', N'Nguyễn Thị R', 'nguyenthir@gmail.com', '0965432109', N'Khánh Hòa'),
    ('KH0019', N'Trần Văn S', 'tranvans@gmail.com', '0956789012', N'Khánh Hòa'),
    ('KH0020', N'Lê Thị T', 'lethit@gmail.com', '0912345678', N'Khánh Hòa'),
    ('KH0021', N'Phạm Văn U', 'phamvanu@gmail.com', '0987654321', N'Khánh Hòa'),
    ('KH0022', N'Huỳnh Thị V', 'huynhthiv@gmail.com', '0876543210', N'Khánh Hòa'),
    ('KH0023', N'Ngô Văn W', 'ngovanw@gmail.com', '0901234567', N'Khánh Hòa'),
    ('KH0024', N'Đinh Thị X', 'dinhthix@gmail.com', '0898765432', N'Khánh Hòa'),
    ('KH0025', N'Lý Văn Y', 'lyvany@gmail.com', '0932109876', N'Khánh Hòa'),
    ('KH0026', N'Trương Thị Z', 'truongthiz@gmail.com', '0945678901', N'Khánh Hòa'),
    ('KH0027', N'Hoàng Văn AA', 'hoangvanaa@gmail.com', '0965432109', N'Khánh Hòa'),
    ('KH0028', N'Lương Thị BB', 'luongthibb@gmail.com', '0956789012', N'Khánh Hòa'),
    ('KH0029', N'Vũ Văn CC', 'vuvancc@gmail.com', '0912345678', N'Khánh Hòa'),
    ('KH0030', N'Mai Thị DD', 'maithidd@gmail.com', '0987654321', N'Khánh Hòa');

INSERT INTO dbo.NHANVIEN (MaNV, HoTenNV, SoDienThoai, Email) VALUES
    ('NV001', N'Trần Thái Dương', '0336157396', 'duong.tt.63ttql@ntu.edu.vn'),
    ('NV002', N'Nguyễn Minh Tấn', '0347281076', 'tan.nm.63ttql@ntu.edu.vn'),
    ('NV003', N'Hoàng Huy Vũ', '0941777213', 'vu.hh.63ttql@ntu.edu.vn');

INSERT INTO dbo.GIOHANG (SoHD, ThoiGianNhan, MaKH, MaNVDuyet, MaNVGiaoHang, TinhTrang) VALUES
    (001, NULL, 'KH0001', 'NV001', 'NV003', 0),
    (002, N'30 phút', 'KH0002', 'NV001', 'NV003', 1),
    (003, N'Đã nhận', 'KH0003', 'NV002', 'NV003', 2),
    (004, NULL, 'KH0004', 'NV002', 'NV003', 0),
    (005, N'15 phút', 'KH0005', 'NV002', 'NV003', 1),
    (006, N'Đã nhận', 'KH0006', 'NV001', 'NV003', 2),
    (007, NULL, 'KH0007', 'NV001', 'NV003', 0),
    (008, N'20 phút', 'KH0008', 'NV001', 'NV003', 1),
    (009, N'Đã nhận', 'KH0009', 'NV002', 'NV003', 2),
    (010, NULL, 'KH0010', 'NV002', 'NV003', 0);

INSERT INTO dbo.CHITIETGIOHANG (SoHD, MaDA, SoLuong, DonGiaBan) VALUES
    (001, '0001', 2, 300000),
    (001, '0002', 1, 90000),
    (002, '0003', 3, 360000),
    (002, '0004', 2, 200000),
    (003, '0005', 1, 180000),
    (003, '0006', 4, 520000),
    (004, '0007', 2, 160000),
    (004, '0008', 3, 330000),
    (005, '0009', 1, 60000),
    (005, '0010', 2, 100000);

GO

CREATE PROCEDURE Doan_TimKiem
    @TenDA NVARCHAR(255) = NULL,
    @DonGiaMin DECIMAL(10, 2) = NULL,
    @DonGiaMax DECIMAL(10, 2) = NULL
AS
BEGIN
    DECLARE @SqlStr NVARCHAR(4000),
            @ParamList NVARCHAR(2000)

    SELECT @SqlStr = '
        SELECT *
        FROM DOAN
        WHERE 1 = 1
    '

    IF @TenDA IS NOT NULL
        SELECT @SqlStr = @SqlStr + '
            AND (TenDA LIKE ''%' + @TenDA + '%'')
        '

    IF @DonGiaMin IS NOT NULL AND @DonGiaMax IS NOT NULL
        SELECT @SqlStr = @SqlStr + '
            AND (DonGia BETWEEN ' + CONVERT(NVARCHAR(50), @DonGiaMin) + ' AND ' + CONVERT(NVARCHAR(50), @DonGiaMax) + ')
        '

    EXEC SP_EXECUTESQL @SqlStr
END