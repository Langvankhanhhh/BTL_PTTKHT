USE [Ql_lichsu]
GO
/****** Object:  Table [dbo].[DiaDiem]    Script Date: 22/10/2024 21:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaDiem](
	[id_dia_diem] [int] IDENTITY(1,1) NOT NULL,
	[ten_dia_diem] [nvarchar](255) NOT NULL,
	[mo_ta_dd] [text] NULL,
	[vi_tri] [nvarchar](255) NULL,
 CONSTRAINT [PK_DiaDiem] PRIMARY KEY CLUSTERED 
(
	[id_dia_diem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVatLichSu]    Script Date: 22/10/2024 21:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVatLichSu](
	[id_nhan_vat] [int] IDENTITY(1,1) NOT NULL,
	[ten_nhan_vat] [nvarchar](255) NOT NULL,
	[ngay_sinh] [date] NULL,
	[ngay_mat] [date] NULL,
	[vai_tro] [nvarchar](100) NULL,
	[mo_ta_nv] [text] NULL,
 CONSTRAINT [PK__NhanVatL__17E7660F5AA8A8AB] PRIMARY KEY CLUSTERED 
(
	[id_nhan_vat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuKienLichSu]    Script Date: 22/10/2024 21:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuKienLichSu](
	[id_su_kien] [varchar](20) NOT NULL,
	[ten_su_kien] [nvarchar](50) NOT NULL,
	[mo_ta] [text] NULL,
	[ngay_bat_dau] [date] NULL,
	[ngay_ket_thuc] [date] NULL,
	[loai_su_kien] [nvarchar](50) NULL,
	[id_nhan_vat] [int] NOT NULL,
	[id_thoi_diem] [int] NOT NULL,
	[id_dia_diem] [int] NOT NULL,
 CONSTRAINT [PK__SuKienLi__2EB973CC35818D3A] PRIMARY KEY CLUSTERED 
(
	[id_su_kien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThoiDiemQuanTrong]    Script Date: 22/10/2024 21:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThoiDiemQuanTrong](
	[id_thoi_diem] [int] IDENTITY(1,1) NOT NULL,
	[ten_thoi_diem] [varchar](255) NOT NULL,
	[mo_ta_td] [text] NULL,
	[ngay] [date] NOT NULL,
 CONSTRAINT [PK_ThoiDiemQuanTrong] PRIMARY KEY CLUSTERED 
(
	[id_thoi_diem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DiaDiem] ON 
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta_dd], [vi_tri]) VALUES (3, N'Sài Gòn', N'Thành ph? l?n nh?t Vi?t Nam, trung tâm kinh t?', N'TP Hồ Chí Minh')
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta_dd], [vi_tri]) VALUES (4, N'Điện Biên Phủ', N'Noi di?n ra tr?n chi?n l?ch s? ch?ng Pháp', N'Điện Biên')
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta_dd], [vi_tri]) VALUES (5, N'Thăng Long', N'Kinh dô c?a các tri?u d?i phong ki?n Vi?t Nam', N'Hà Nội')
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta_dd], [vi_tri]) VALUES (6, N'Hải Phòng', N'Thành ph? c?ng quan tr?ng phía B?c', N'Hải Phòng')
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta_dd], [vi_tri]) VALUES (7, N'Nha Trang', N'Thành ph? bi?n n?i ti?ng v?i các bãi bi?n d?p', N'Khánh Hòa')
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta_dd], [vi_tri]) VALUES (8, N'thnrsg', N'nsrfgg', N'nrtfgs')
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta_dd], [vi_tri]) VALUES (9, N'thnrsg', N'nsrfgg', N'nrtfgs')
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta_dd], [vi_tri]) VALUES (10, N'thnrsg', N'nsrfgg', N'nrtfgs')
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta_dd], [vi_tri]) VALUES (11, N'tdrfhnbszgr', N'rt?nrty', N'rtyhgnbsfzy')
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta_dd], [vi_tri]) VALUES (12, N'tdrfhnbszgr', N'rt?nrty', N'rtyhgnbsfzy')
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta_dd], [vi_tri]) VALUES (13, N'bhtdfẻ', N'mtugyhn', N'bngrfs')
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta_dd], [vi_tri]) VALUES (14, N'bhtdfẻ', N'mtugyhn', N'bngrfs')
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta_dd], [vi_tri]) VALUES (15, N'bhtdfẻ', N'mtugyhn', N'bngrfs')
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta_dd], [vi_tri]) VALUES (16, N'hmgtfn ', N'hgmxdt ', N'mhgnxdft ')
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta_dd], [vi_tri]) VALUES (17, N'hmgtfn ', N'hgmxdt ', N'mhgnxdft ')
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta_dd], [vi_tri]) VALUES (18, N'ntrsgg', N'nzstgrgf', N'nzstr')
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta_dd], [vi_tri]) VALUES (19, N'nsrfgt', N'ngfr', N'ngrf')
GO
SET IDENTITY_INSERT [dbo].[DiaDiem] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVatLichSu] ON 
GO
INSERT [dbo].[NhanVatLichSu] ([id_nhan_vat], [ten_nhan_vat], [ngay_sinh], [ngay_mat], [vai_tro], [mo_ta_nv]) VALUES (3, N'Trần Hưng Đạo', CAST(N'1228-01-01' AS Date), CAST(N'1300-01-01' AS Date), N'Tướng quân', N'Lãnh d?o quân d?i Ð?i Vi?t dánh b?i quân Nguyên Mông')
GO
INSERT [dbo].[NhanVatLichSu] ([id_nhan_vat], [ten_nhan_vat], [ngay_sinh], [ngay_mat], [vai_tro], [mo_ta_nv]) VALUES (4, N'Phan Bội Châu', CAST(N'1867-12-26' AS Date), CAST(N'1940-10-29' AS Date), N'Nhà cách mạng', N'Nhà yêu nu?c, sáng l?p phong trào Ðông Du')
GO
INSERT [dbo].[NhanVatLichSu] ([id_nhan_vat], [ten_nhan_vat], [ngay_sinh], [ngay_mat], [vai_tro], [mo_ta_nv]) VALUES (5, N'Hồ Chí Minh', CAST(N'1890-05-19' AS Date), CAST(N'1969-09-02' AS Date), N'Chủ tịch nước', N'Ngu?i sáng l?p nu?c Vi?t Nam Dân ch? C?ng hòa')
GO
INSERT [dbo].[NhanVatLichSu] ([id_nhan_vat], [ten_nhan_vat], [ngay_sinh], [ngay_mat], [vai_tro], [mo_ta_nv]) VALUES (6, N'Võ Nguyên Giáp', CAST(N'1911-08-25' AS Date), CAST(N'2013-10-04' AS Date), N'Đại tướng', N'T?ng tu l?nh quân d?i nhân dân Vi?t Nam, ch? huy chi?n d?ch Ði?n Biên Ph?')
GO
INSERT [dbo].[NhanVatLichSu] ([id_nhan_vat], [ten_nhan_vat], [ngay_sinh], [ngay_mat], [vai_tro], [mo_ta_nv]) VALUES (7, N'Lý Thường Kiệt', CAST(N'1019-01-01' AS Date), CAST(N'1105-01-01' AS Date), N'Tướng quân', N'Lãnh d?o cu?c kháng chi?n ch?ng quân T?ng th?i Lý')
GO
INSERT [dbo].[NhanVatLichSu] ([id_nhan_vat], [ten_nhan_vat], [ngay_sinh], [ngay_mat], [vai_tro], [mo_ta_nv]) VALUES (19, N'bjnyhftgg', CAST(N'2024-10-17' AS Date), CAST(N'2024-10-09' AS Date), N'fbed', N'dfgb n')
GO
SET IDENTITY_INSERT [dbo].[NhanVatLichSu] OFF
GO
INSERT [dbo].[SuKienLichSu] ([id_su_kien], [ten_su_kien], [mo_ta], [ngay_bat_dau], [ngay_ket_thuc], [loai_su_kien], [id_nhan_vat], [id_thoi_diem], [id_dia_diem]) VALUES (N'hnbtrfgd', N'bnzfdrt gs', N'gnb zsgfdr', CAST(N'2024-10-03' AS Date), CAST(N'2024-10-01' AS Date), N'bngdfr', 19, 19, 19)
GO
INSERT [dbo].[SuKienLichSu] ([id_su_kien], [ten_su_kien], [mo_ta], [ngay_bat_dau], [ngay_ket_thuc], [loai_su_kien], [id_nhan_vat], [id_thoi_diem], [id_dia_diem]) VALUES (N'SK003', N'Cuộc khởi nghĩa Hai Bà Trưng', N'Hai Bà Trung ph?t c? kh?i nghia ch?ng quân Hán', CAST(N'1940-01-01' AS Date), CAST(N'1943-01-01' AS Date), N'Khởi nghĩa', 3, 3, 3)
GO
INSERT [dbo].[SuKienLichSu] ([id_su_kien], [ten_su_kien], [mo_ta], [ngay_bat_dau], [ngay_ket_thuc], [loai_su_kien], [id_nhan_vat], [id_thoi_diem], [id_dia_diem]) VALUES (N'SK004', N'Chiến thắng Bạch Đằng', N'Tr?n Hung Ð?o dánh b?i quân Nguyên Mông trên sông B?ch Ð?ng', CAST(N'1288-04-09' AS Date), CAST(N'1288-04-09' AS Date), N'Chiến tranh', 4, 5, 5)
GO
INSERT [dbo].[SuKienLichSu] ([id_su_kien], [ten_su_kien], [mo_ta], [ngay_bat_dau], [ngay_ket_thuc], [loai_su_kien], [id_nhan_vat], [id_thoi_diem], [id_dia_diem]) VALUES (N'SK005', N'Cách mạng tháng Tám', N'Cu?c t?ng kh?i nghia giành chính quy?n trong Cách m?ng tháng Tám', CAST(N'1945-08-19' AS Date), CAST(N'1945-08-19' AS Date), N'Cách mạng', 5, 3, 6)
GO
INSERT [dbo].[SuKienLichSu] ([id_su_kien], [ten_su_kien], [mo_ta], [ngay_bat_dau], [ngay_ket_thuc], [loai_su_kien], [id_nhan_vat], [id_thoi_diem], [id_dia_diem]) VALUES (N'SK006', N'Chiến dịch Điện Biên Phủ', N'Chi?n d?ch quy?t d?nh k?t thúc chi?n tranh Ðông Duong', CAST(N'1954-03-13' AS Date), CAST(N'1954-05-07' AS Date), N'Chiến dịch quân sự', 6, 4, 4)
GO
INSERT [dbo].[SuKienLichSu] ([id_su_kien], [ten_su_kien], [mo_ta], [ngay_bat_dau], [ngay_ket_thuc], [loai_su_kien], [id_nhan_vat], [id_thoi_diem], [id_dia_diem]) VALUES (N'SK007', N'Chiến dịch Hồ Chí Minh', N'Chi?n d?ch k?t thúc cu?c kháng chi?n ch?ng M?', CAST(N'1975-04-26' AS Date), CAST(N'1975-04-30' AS Date), N'Chiến dịch quân sự', 7, 4, 7)
GO
SET IDENTITY_INSERT [dbo].[ThoiDiemQuanTrong] ON 
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta_td], [ngay]) VALUES (3, N'Tháng 8 nam 1945', N'Cu?c t?ng kh?i nghia giành d?c l?p trên c? nu?c', CAST(N'1945-08-19' AS Date))
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta_td], [ngay]) VALUES (4, N'Chi?n d?ch H? Chí Minh', N'Chi?n d?ch gi?i phóng mi?n Nam, th?ng nh?t d?t nu?c', CAST(N'1975-04-30' AS Date))
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta_td], [ngay]) VALUES (5, N'Tr?n B?ch Ð?ng', N'Tr?n th?y chi?n ch?ng quân Nguyên Mông', CAST(N'1288-04-09' AS Date))
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta_td], [ngay]) VALUES (6, N'Tr?n Hàm T?', N'Tr?n chi?n ch?ng quân Nguyên Mông', CAST(N'1285-04-24' AS Date))
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta_td], [ngay]) VALUES (7, N'Tr?n Chi Lang', N'Tr?n chi?n ch?ng quân Minh th?i Lê L?i', CAST(N'1427-10-10' AS Date))
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta_td], [ngay]) VALUES (8, N'ngsf', N'hedrt', CAST(N'1000-01-01' AS Date))
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta_td], [ngay]) VALUES (9, N'ngsf', N'hedrt', CAST(N'1000-01-01' AS Date))
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta_td], [ngay]) VALUES (10, N'ngsf', N'hedrt', CAST(N'1000-01-01' AS Date))
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta_td], [ngay]) VALUES (11, N'yhtjmndfgjnf', N'utyhmkuthy', CAST(N'1000-01-01' AS Date))
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta_td], [ngay]) VALUES (12, N'yhtjmndfgjnf', N'utyhmkuthy', CAST(N'1000-01-01' AS Date))
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta_td], [ngay]) VALUES (13, N'tyhnjmgf', N'tyhjmngd', CAST(N'1990-02-01' AS Date))
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta_td], [ngay]) VALUES (14, N'tyhnjmgf', N'tyhjmngd', CAST(N'1990-02-01' AS Date))
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta_td], [ngay]) VALUES (15, N'tyhnjmgf', N'tyhjmngd', CAST(N'1990-02-01' AS Date))
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta_td], [ngay]) VALUES (16, N'ghm', N'mstyhgxf', CAST(N'2024-10-19' AS Date))
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta_td], [ngay]) VALUES (17, N'ghm', N'mstyhgxf', CAST(N'2024-10-19' AS Date))
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta_td], [ngay]) VALUES (18, N'ntzsrgf', N'ntrfdgs', CAST(N'2024-10-24' AS Date))
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta_td], [ngay]) VALUES (19, N'ngfr', N'ngrfd', CAST(N'2024-10-24' AS Date))
GO
SET IDENTITY_INSERT [dbo].[ThoiDiemQuanTrong] OFF
GO
ALTER TABLE [dbo].[SuKienLichSu]  WITH CHECK ADD  CONSTRAINT [FK_SuKienLichSu_DiaDiem1] FOREIGN KEY([id_dia_diem])
REFERENCES [dbo].[DiaDiem] ([id_dia_diem])
GO
ALTER TABLE [dbo].[SuKienLichSu] CHECK CONSTRAINT [FK_SuKienLichSu_DiaDiem1]
GO
ALTER TABLE [dbo].[SuKienLichSu]  WITH CHECK ADD  CONSTRAINT [FK_SuKienLichSu_NhanVatLichSu1] FOREIGN KEY([id_nhan_vat])
REFERENCES [dbo].[NhanVatLichSu] ([id_nhan_vat])
GO
ALTER TABLE [dbo].[SuKienLichSu] CHECK CONSTRAINT [FK_SuKienLichSu_NhanVatLichSu1]
GO
ALTER TABLE [dbo].[SuKienLichSu]  WITH CHECK ADD  CONSTRAINT [FK_SuKienLichSu_ThoiDiemQuanTrong] FOREIGN KEY([id_thoi_diem])
REFERENCES [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem])
GO
ALTER TABLE [dbo].[SuKienLichSu] CHECK CONSTRAINT [FK_SuKienLichSu_ThoiDiemQuanTrong]
GO
/****** Object:  StoredProcedure [dbo].[SP_ADD]    Script Date: 22/10/2024 21:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ADD]
    @action varchar(50),
    @id_su_kien varchar(50)=null,
    @ten_su_kien NVARCHAR(50),
    @mo_ta TEXT,
    @ngay_bat_dau DATE,
    @ngay_ket_thuc DATE,
    @loai_su_kien NVARCHAR(50),
    @ten_nhan_vat NVARCHAR(255),
    @ngay_sinh DATE,
    @ngay_mat DATE,
    @vai_tro NVARCHAR(100),
    @mo_ta_nv TEXT,
    @ten_dia_diem NVARCHAR(255),
    @vi_tri NVARCHAR(255),
    @mo_ta_dd TEXT,
    @ten_thoi_diem NVARCHAR(255),
    @ngay DATE,
    @mo_ta_td TEXT,
	@id_su_kien_delete varchar(50)=null
AS
BEGIN
    IF (@action = 'add')
    BEGIN
        DECLARE @ID_NV INT, @ID_thoidiem INT, @ID_diadiem INT;

        IF (@ten_nhan_vat IS NOT NULL)
        BEGIN
            INSERT INTO NhanVatLichSu (ten_nhan_vat, ngay_sinh, ngay_mat, vai_tro, mo_ta_nv)
            VALUES (@ten_nhan_vat, @ngay_sinh, @ngay_mat, @vai_tro, @mo_ta_nv);
        END
        IF (@ten_dia_diem IS NOT NULL)
        BEGIN
            INSERT INTO DiaDiem (ten_dia_diem, vi_tri, mo_ta_dd)
            VALUES (@ten_dia_diem, @vi_tri, @mo_ta_dd);
        END
        IF (@ten_thoi_diem IS NOT NULL)
        BEGIN
            INSERT INTO ThoiDiemQuanTrong (ten_thoi_diem, ngay, mo_ta_td)
            VALUES (@ten_thoi_diem, @ngay, @mo_ta_td);
        END
        SELECT @ID_thoidiem = id_thoi_diem
        FROM ThoiDiemQuanTrong
        WHERE @ten_thoi_diem = ThoiDiemQuanTrong.ten_thoi_diem;
        SELECT @ID_diadiem = id_dia_diem
        FROM DiaDiem
        WHERE @ten_dia_diem = DiaDiem.ten_dia_diem;
        SELECT @ID_NV = id_nhan_vat
        FROM NhanVatLichSu
        WHERE @ten_nhan_vat = NhanVatLichSu.ten_nhan_vat;
        INSERT INTO SuKienLichSu (id_su_kien, ten_su_kien, mo_ta, ngay_bat_dau, ngay_ket_thuc, loai_su_kien, id_nhan_vat, id_thoi_diem, id_dia_diem) 
        VALUES (@id_su_kien, @ten_su_kien, @mo_ta, @ngay_bat_dau, @ngay_ket_thuc, @loai_su_kien, @ID_NV, @ID_thoidiem, @ID_diadiem);
        SELECT 
		    'ok' AS ok,'Thêm thành công' AS message 
        FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END
	ELSE IF (@action = 'delete')
    BEGIN
        DECLARE @ID_NV1 INT, @ID_thoidiem1 INT, @ID_diadiem1 INT;
		SELECT @ID_NV1 = id_nhan_vat,@ID_thoidiem1 = id_thoi_diem ,@ID_diadiem1 = id_dia_diem
        FROM SuKienLichSu
        WHERE id_su_kien = @id_su_kien_delete;

        DELETE FROM SuKienLichSu
        WHERE id_su_kien = @id_su_kien;

        DELETE FROM DiaDiem
        WHERE id_dia_diem = @ID_diadiem1;

        SELECT 'Xóa thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SKLS]    Script Date: 22/10/2024 21:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SKLS]
	 @action varchar(50),
	
	@data_get nvarchar(100) = NULL
AS
BEGIN

    IF (@action = 'get_infor' and @data_get='skls')
    BEGIN        
        SELECT 
            'get_infor_skls' AS status,
			*
			
		FROM 
			SuKienLichSu 
        FOR JSON PATH;
    END

	IF (@action = 'get_infor' and @data_get = 'dd')
    BEGIN        
        SELECT 
            'get_infor_dd' AS status,
			*
		FROM 
			DiaDiem
        FOR JSON PATH;
    END

	IF (@action = 'get_infor' and @data_get = 'tdqt')
    BEGIN        
        SELECT 
            'get_infor_tdqt' AS status,
			*
		FROM ThoiDiemQuanTrong
        FOR JSON PATH;
    END

	IF (@action = 'get_infor' and @data_get = 'nv')
    BEGIN        
        SELECT 
            'get_infor_nv' AS status,
			*
		FROM  NhanVatLichSu
        FOR JSON PATH;
    END

	
END


GO
