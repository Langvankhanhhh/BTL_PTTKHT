USE [Ql_lichsu]
GO
/****** Object:  Table [dbo].[DiaDiem]    Script Date: 21/10/2024 22:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaDiem](
	[id_dia_diem] [varchar](20) NOT NULL,
	[ten_dia_diem] [varchar](255) NOT NULL,
	[mo_ta] [text] NULL,
	[vi_tri] [varchar](255) NULL,
 CONSTRAINT [PK__DiaDiem__5AEE7D147A0D3354] PRIMARY KEY CLUSTERED 
(
	[id_dia_diem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVatLichSu]    Script Date: 21/10/2024 22:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVatLichSu](
	[id_nhan_vat] [varchar](20) NOT NULL,
	[ten_nhan_vat] [varchar](255) NOT NULL,
	[ngay_sinh] [date] NULL,
	[ngay_mat] [date] NULL,
	[vai_tro] [varchar](100) NULL,
	[mo_ta] [text] NULL,
 CONSTRAINT [PK__NhanVatL__17E7660F5AA8A8AB] PRIMARY KEY CLUSTERED 
(
	[id_nhan_vat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuKienLichSu]    Script Date: 21/10/2024 22:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuKienLichSu](
	[id_su_kien] [varchar](20) NOT NULL,
	[ten_su_kien] [nvarchar](50) NOT NULL,
	[mo_ta] [nvarchar](max) NULL,
	[ngay_bat_dau] [nvarchar](50) NULL,
	[ngay_ket_thuc] [nvarchar](50) NULL,
	[loai_su_kien] [nvarchar](50) NULL,
	[id_nhan_vat] [varchar](20) NULL,
	[id_thoi_diem] [varchar](20) NULL,
	[id_dia_diem] [varchar](20) NULL,
 CONSTRAINT [PK__SuKienLi__2EB973CC35818D3A] PRIMARY KEY CLUSTERED 
(
	[id_su_kien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThoiDiemQuanTrong]    Script Date: 21/10/2024 22:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThoiDiemQuanTrong](
	[id_thoi_diem] [varchar](20) NOT NULL,
	[ten_thoi_diem] [varchar](255) NOT NULL,
	[mo_ta] [text] NULL,
	[ngay] [date] NULL,
 CONSTRAINT [PK__ThoiDiem__AE8FA1D7262D753A] PRIMARY KEY CLUSTERED 
(
	[id_thoi_diem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta], [vi_tri]) VALUES (N'DD001', N'Hà N?i', N'Th? dô Vi?t Nam', N'B?c')
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta], [vi_tri]) VALUES (N'DD002', N'Sài Gòn', N'Thành ph? l?n', N'Nam')
GO
INSERT [dbo].[DiaDiem] ([id_dia_diem], [ten_dia_diem], [mo_ta], [vi_tri]) VALUES (N'DD003', N'Hu?', N'C? dô', N'Trung')
GO
INSERT [dbo].[NhanVatLichSu] ([id_nhan_vat], [ten_nhan_vat], [ngay_sinh], [ngay_mat], [vai_tro], [mo_ta]) VALUES (N'NV001', N'H? Chí Minh', CAST(N'1890-05-19' AS Date), CAST(N'1969-09-02' AS Date), N'Lãnh t? cách m?ng', N'Lãnh d?o phong trào cách m?ng')
GO
INSERT [dbo].[NhanVatLichSu] ([id_nhan_vat], [ten_nhan_vat], [ngay_sinh], [ngay_mat], [vai_tro], [mo_ta]) VALUES (N'NV002', N'Võ Nguyên Giáp', CAST(N'1911-08-25' AS Date), CAST(N'2013-10-04' AS Date), N'Ð?i tu?ng', N'Ngu?i ch? huy quân d?i')
GO
INSERT [dbo].[NhanVatLichSu] ([id_nhan_vat], [ten_nhan_vat], [ngay_sinh], [ngay_mat], [vai_tro], [mo_ta]) VALUES (N'NV003', N'Lý Thái T?', CAST(N'0974-03-08' AS Date), CAST(N'1028-03-31' AS Date), N'Hoàng d?', N'Vua sáng l?p tri?u Lý')
GO
INSERT [dbo].[SuKienLichSu] ([id_su_kien], [ten_su_kien], [mo_ta], [ngay_bat_dau], [ngay_ket_thuc], [loai_su_kien], [id_nhan_vat], [id_thoi_diem], [id_dia_diem]) VALUES (N'SK001', N'Cách mạng tháng 8', N'Khởi nghĩa chống Pháp', N'1945-08-19', N'1945-09-02', N'Cách mạng', N'NV001', N'TD001', N'DD001')
GO
INSERT [dbo].[SuKienLichSu] ([id_su_kien], [ten_su_kien], [mo_ta], [ngay_bat_dau], [ngay_ket_thuc], [loai_su_kien], [id_nhan_vat], [id_thoi_diem], [id_dia_diem]) VALUES (N'SK002', N'Chiến dịch Điện Biên Phủ', N'Chiến thắng quân Pháp', N'1954-03-13', N'1954-05-07', N'Chiến tranh', N'NV002', N'TD002', N'DD002')
GO
INSERT [dbo].[SuKienLichSu] ([id_su_kien], [ten_su_kien], [mo_ta], [ngay_bat_dau], [ngay_ket_thuc], [loai_su_kien], [id_nhan_vat], [id_thoi_diem], [id_dia_diem]) VALUES (N'SK003', N'Dời đô về Thăng Long', N'Dời kinh đô về Thăng Long', N'1010-10-01', N'1010-10-10', N'Chính trị', N'NV003', N'TD003', N'DD003')
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta], [ngay]) VALUES (N'TD001', N'Ngày Qu?c khánh', N'Ngày d?c l?p c?a Vi?t Nam', CAST(N'1945-09-02' AS Date))
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta], [ngay]) VALUES (N'TD002', N'Ngày chi?n th?ng', N'Chi?n th?ng Ði?n Biên Ph?', CAST(N'1954-05-07' AS Date))
GO
INSERT [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem], [ten_thoi_diem], [mo_ta], [ngay]) VALUES (N'TD003', N'D?i dô Thang Long', N'S? ki?n d?i dô', CAST(N'1010-10-10' AS Date))
GO
ALTER TABLE [dbo].[SuKienLichSu]  WITH CHECK ADD  CONSTRAINT [FK_SuKienLichSu_DiaDiem] FOREIGN KEY([id_dia_diem])
REFERENCES [dbo].[DiaDiem] ([id_dia_diem])
GO
ALTER TABLE [dbo].[SuKienLichSu] CHECK CONSTRAINT [FK_SuKienLichSu_DiaDiem]
GO
ALTER TABLE [dbo].[SuKienLichSu]  WITH CHECK ADD  CONSTRAINT [FK_SuKienLichSu_NhanVatLichSu] FOREIGN KEY([id_nhan_vat])
REFERENCES [dbo].[NhanVatLichSu] ([id_nhan_vat])
GO
ALTER TABLE [dbo].[SuKienLichSu] CHECK CONSTRAINT [FK_SuKienLichSu_NhanVatLichSu]
GO
ALTER TABLE [dbo].[SuKienLichSu]  WITH CHECK ADD  CONSTRAINT [FK_SuKienLichSu_SuKienLichSu] FOREIGN KEY([id_thoi_diem])
REFERENCES [dbo].[ThoiDiemQuanTrong] ([id_thoi_diem])
GO
ALTER TABLE [dbo].[SuKienLichSu] CHECK CONSTRAINT [FK_SuKienLichSu_SuKienLichSu]
GO
/****** Object:  StoredProcedure [dbo].[SP_API]    Script Date: 21/10/2024 22:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_API]
	 @action varchar(50),
    @id_su_kien varchar(50)=null
AS
BEGIN

    IF (@action = 'get_infor')
    BEGIN        
        SELECT 
            'get_infor' AS status,
            id_su_kien,
            ten_su_kien,  
            mo_ta,
			ngay_bat_dau,
			ngay_ket_thuc,
			loai_su_kien
        FROM SuKienLichSu
        FOR JSON PATH;
    END
END


GO
/****** Object:  StoredProcedure [dbo].[SP_SKLS]    Script Date: 21/10/2024 22:25:21 ******/
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
    @id_su_kien varchar(50)=null
AS
BEGIN

    IF (@action = 'get_infor')
    BEGIN        
        SELECT 
            'get_infor' AS status,
            id_su_kien,
            ten_su_kien,  
            mo_ta,
			ngay_bat_dau,
			ngay_ket_thuc,
			loai_su_kien
        FROM SuKienLichSu
        FOR JSON PATH;
    END
END

GO
