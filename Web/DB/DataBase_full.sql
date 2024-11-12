USE [Ql_lichsu]
GO
/****** Object:  Table [dbo].[DienBien_LucLuong]    Script Date: 12/11/2024 16:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DienBien_LucLuong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_dien_bien] [varchar](50) NULL,
	[id_luc_luong_tham_gia] [varchar](50) NULL,
 CONSTRAINT [PK_DienBien_LucLuong] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DienBienLichSu]    Script Date: 12/11/2024 16:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DienBienLichSu](
	[id_dien_bien] [varchar](50) NOT NULL,
	[ten_dien_bien] [nvarchar](255) NOT NULL,
	[mo_ta_dien_bien] [nvarchar](max) NULL,
	[ngay] [date] NULL,
	[vi_tri_dien_ra] [nvarchar](255) NULL,
 CONSTRAINT [PK_DiaDiem] PRIMARY KEY CLUSTERED 
(
	[id_dien_bien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LucLuongThamGia]    Script Date: 12/11/2024 16:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LucLuongThamGia](
	[id_luc_luong_tham_gia] [varchar](50) NOT NULL,
	[ten_luc_luong_tham_gia] [nvarchar](255) NOT NULL,
	[mo_ta_luc_luong_tham_gia] [nvarchar](max) NULL,
 CONSTRAINT [PK_ThoiDiemQuanTrong] PRIMARY KEY CLUSTERED 
(
	[id_luc_luong_tham_gia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVatLanhDao]    Script Date: 12/11/2024 16:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVatLanhDao](
	[id_nhan_vat] [varchar](50) NOT NULL,
	[ten_nhan_vat] [nvarchar](255) NOT NULL,
	[ngay_sinh] [date] NULL,
	[ngay_mat] [date] NULL,
	[vai_tro] [nvarchar](100) NULL,
	[mo_ta_nv] [nvarchar](max) NULL,
 CONSTRAINT [PK__NhanVatL__17E7660F5AA8A8AB] PRIMARY KEY CLUSTERED 
(
	[id_nhan_vat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuKien_DienBien]    Script Date: 12/11/2024 16:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuKien_DienBien](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_su_kien] [varchar](50) NULL,
	[id_dien_bien] [varchar](50) NULL,
 CONSTRAINT [PK_SuKien_DienBien] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuKien_NhanVat]    Script Date: 12/11/2024 16:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuKien_NhanVat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_su_kien] [varchar](50) NULL,
	[id_nhan_vat] [varchar](50) NULL,
 CONSTRAINT [PK_SuKien_NhanVat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuKienLichSu]    Script Date: 12/11/2024 16:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuKienLichSu](
	[id_su_kien] [varchar](50) NOT NULL,
	[ten_su_kien] [nvarchar](255) NOT NULL,
	[mo_ta] [nvarchar](max) NULL,
	[ngay_bat_dau] [date] NULL,
	[ngay_ket_thuc] [date] NULL,
	[loai_su_kien] [nvarchar](50) NULL,
 CONSTRAINT [PK__SuKienLi__2EB973CC35818D3A] PRIMARY KEY CLUSTERED 
(
	[id_su_kien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_login]    Script Date: 12/11/2024 16:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_login](
	[user] [varchar](50) NOT NULL,
	[pass] [varbinary](20) NULL,
	[name] [nvarchar](100) NULL,
	[level] [int] NULL,
	[gmail] [varchar](50) NULL,
	[dienthoai] [varchar](20) NULL,
	[lastLogin] [datetime] NULL,
 CONSTRAINT [PK_user_login] PRIMARY KEY CLUSTERED 
(
	[user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DienBien_LucLuong] ON 
GO
INSERT [dbo].[DienBien_LucLuong] ([id], [id_dien_bien], [id_luc_luong_tham_gia]) VALUES (1, N'DB001', N'LL001')
GO
INSERT [dbo].[DienBien_LucLuong] ([id], [id_dien_bien], [id_luc_luong_tham_gia]) VALUES (2, N'DB001', N'LL002')
GO
INSERT [dbo].[DienBien_LucLuong] ([id], [id_dien_bien], [id_luc_luong_tham_gia]) VALUES (3, N'DB002', N'LL001')
GO
INSERT [dbo].[DienBien_LucLuong] ([id], [id_dien_bien], [id_luc_luong_tham_gia]) VALUES (4, N'a1111111111111111111113e421342', N'LL000001123213tr')
GO
INSERT [dbo].[DienBien_LucLuong] ([id], [id_dien_bien], [id_luc_luong_tham_gia]) VALUES (5, N'a11111111111111111111rytrygfd', N'LL00000')
GO
INSERT [dbo].[DienBien_LucLuong] ([id], [id_dien_bien], [id_luc_luong_tham_gia]) VALUES (6, N'a1111111111111111111113e421342', N'11ccccccc345')
GO
SET IDENTITY_INSERT [dbo].[DienBien_LucLuong] OFF
GO
INSERT [dbo].[DienBienLichSu] ([id_dien_bien], [ten_dien_bien], [mo_ta_dien_bien], [ngay], [vi_tri_dien_ra]) VALUES (N'a11111111111111111111', N'1111111111111111111111hrthgb', N'1111111111111', CAST(N'2024-11-03' AS Date), N'111111111111')
GO
INSERT [dbo].[DienBienLichSu] ([id_dien_bien], [ten_dien_bien], [mo_ta_dien_bien], [ngay], [vi_tri_dien_ra]) VALUES (N'a1111111111111111111112', N'1111111111111111111111', N'1111111111111', CAST(N'2024-10-29' AS Date), N'111111111111')
GO
INSERT [dbo].[DienBienLichSu] ([id_dien_bien], [ten_dien_bien], [mo_ta_dien_bien], [ngay], [vi_tri_dien_ra]) VALUES (N'a1111111111111111111113e421342', N'11111111111111111111sdacf1', N'1111111111111', CAST(N'2024-11-14' AS Date), N'132')
GO
INSERT [dbo].[DienBienLichSu] ([id_dien_bien], [ten_dien_bien], [mo_ta_dien_bien], [ngay], [vi_tri_dien_ra]) VALUES (N'a11111111111111111111rytrygfd', N'1111111111111111111111', N'1111111111111', CAST(N'2024-11-04' AS Date), N'111111111111')
GO
INSERT [dbo].[DienBienLichSu] ([id_dien_bien], [ten_dien_bien], [mo_ta_dien_bien], [ngay], [vi_tri_dien_ra]) VALUES (N'DB001', N'Khởi động sự kiện', N'Sự kiện được khởi động với buổi họp báo.', CAST(N'2023-01-01' AS Date), N'Tại thành phố')
GO
INSERT [dbo].[DienBienLichSu] ([id_dien_bien], [ten_dien_bien], [mo_ta_dien_bien], [ngay], [vi_tri_dien_ra]) VALUES (N'DB002', N'Triển khai hoạt động', N'Các hoạt động văn hóa diễn ra sôi nổi.', CAST(N'2023-01-03' AS Date), N'Tại trung tâm văn hóa')
GO
INSERT [dbo].[DienBienLichSu] ([id_dien_bien], [ten_dien_bien], [mo_ta_dien_bien], [ngay], [vi_tri_dien_ra]) VALUES (N'DB003', N'Kết thúc sự kiện', N'Sự kiện kết thúc thành công với sự tham gia đông đảo.', CAST(N'2023-01-05' AS Date), N'Tại thành phố a')
GO
INSERT [dbo].[LucLuongThamGia] ([id_luc_luong_tham_gia], [ten_luc_luong_tham_gia], [mo_ta_luc_luong_tham_gia]) VALUES (N'11ccccccc345', N'1111111111111c', N'1111111111c')
GO
INSERT [dbo].[LucLuongThamGia] ([id_luc_luong_tham_gia], [ten_luc_luong_tham_gia], [mo_ta_luc_luong_tham_gia]) VALUES (N'LL00000', N'AAAAAAAAÂư', N'aa')
GO
INSERT [dbo].[LucLuongThamGia] ([id_luc_luong_tham_gia], [ten_luc_luong_tham_gia], [mo_ta_luc_luong_tham_gia]) VALUES (N'LL000001123213tr', N'AAAAAAAAÂ', N'1111111111c')
GO
INSERT [dbo].[LucLuongThamGia] ([id_luc_luong_tham_gia], [ten_luc_luong_tham_gia], [mo_ta_luc_luong_tham_gia]) VALUES (N'LL001', N'Đội tình nguyện viên', N'Đội tình nguyện viên hỗ trợ sự kiện.')
GO
INSERT [dbo].[LucLuongThamGia] ([id_luc_luong_tham_gia], [ten_luc_luong_tham_gia], [mo_ta_luc_luong_tham_gia]) VALUES (N'LL002', N'Nhà tổ chức sự kiện', N'Nhà tổ chức đảm bảo mọi hoạt động diễn ra suôn sẻ.')
GO
INSERT [dbo].[NhanVatLanhDao] ([id_nhan_vat], [ten_nhan_vat], [ngay_sinh], [ngay_mat], [vai_tro], [mo_ta_nv]) VALUES (N'NV00000000000000000000012', N'111111111111111xc', CAST(N'2024-11-14' AS Date), CAST(N'2024-11-14' AS Date), N'dddddđd', N'dddddddd')
GO
INSERT [dbo].[NhanVatLanhDao] ([id_nhan_vat], [ten_nhan_vat], [ngay_sinh], [ngay_mat], [vai_tro], [mo_ta_nv]) VALUES (N'NV00000000000000000000012gtrf', N'Giám đốc B', CAST(N'1980-05-16' AS Date), CAST(N'1980-05-16' AS Date), N'Giám đốc', N'Người dẫn dắt triển lãm nghệ thuật.')
GO
INSERT [dbo].[NhanVatLanhDao] ([id_nhan_vat], [ten_nhan_vat], [ngay_sinh], [ngay_mat], [vai_tro], [mo_ta_nv]) VALUES (N'NV001', N'Chủ tịch A', CAST(N'1975-01-01' AS Date), NULL, N'Chủ tịch', N'Một nhân vật quan trọng trong sự kiện văn hóa.')
GO
INSERT [dbo].[NhanVatLanhDao] ([id_nhan_vat], [ten_nhan_vat], [ngay_sinh], [ngay_mat], [vai_tro], [mo_ta_nv]) VALUES (N'NV002', N'Giám đốc B', CAST(N'1980-05-15' AS Date), NULL, N'Giám đốc', N'Người dẫn dắt triển lãm nghệ thuật.')
GO
SET IDENTITY_INSERT [dbo].[SuKien_DienBien] ON 
GO
INSERT [dbo].[SuKien_DienBien] ([id], [id_su_kien], [id_dien_bien]) VALUES (1, N'SK01', N'a11111111111111111111')
GO
INSERT [dbo].[SuKien_DienBien] ([id], [id_su_kien], [id_dien_bien]) VALUES (2, N'SK01', N'a1111111111111111111113e421342')
GO
INSERT [dbo].[SuKien_DienBien] ([id], [id_su_kien], [id_dien_bien]) VALUES (3, N'SK002', N'DB003')
GO
INSERT [dbo].[SuKien_DienBien] ([id], [id_su_kien], [id_dien_bien]) VALUES (4, N'SK002', N'a11111111111111111111rytrygfd')
GO
SET IDENTITY_INSERT [dbo].[SuKien_DienBien] OFF
GO
SET IDENTITY_INSERT [dbo].[SuKien_NhanVat] ON 
GO
INSERT [dbo].[SuKien_NhanVat] ([id], [id_su_kien], [id_nhan_vat]) VALUES (1, N'SK01', N'NV00000000000000000000012')
GO
INSERT [dbo].[SuKien_NhanVat] ([id], [id_su_kien], [id_nhan_vat]) VALUES (2, N'SK002', N'NV002')
GO
INSERT [dbo].[SuKien_NhanVat] ([id], [id_su_kien], [id_nhan_vat]) VALUES (3, N'SK002', N'NV00000000000000000000012gtrf')
GO
SET IDENTITY_INSERT [dbo].[SuKien_NhanVat] OFF
GO
INSERT [dbo].[SuKienLichSu] ([id_su_kien], [ten_su_kien], [mo_ta], [ngay_bat_dau], [ngay_ket_thuc], [loai_su_kien]) VALUES (N'Sk0000112', N'a', N'âcád', CAST(N'2024-11-14' AS Date), CAST(N'2024-11-22' AS Date), N'cá')
GO
INSERT [dbo].[SuKienLichSu] ([id_su_kien], [ten_su_kien], [mo_ta], [ngay_bat_dau], [ngay_ket_thuc], [loai_su_kien]) VALUES (N'SK002', N'Triển lãm nghệ thuật', N'Triển lãm nghệ thuật tại bảo tàng.', CAST(N'2023-02-01' AS Date), CAST(N'2023-02-10' AS Date), NULL)
GO
INSERT [dbo].[SuKienLichSu] ([id_su_kien], [ten_su_kien], [mo_ta], [ngay_bat_dau], [ngay_ket_thuc], [loai_su_kien]) VALUES (N'SK01', N'Sự kiện mẫu', N'Mô tả sự kiện mẫu a', CAST(N'2024-11-01' AS Date), CAST(N'2024-11-10' AS Date), N'Loại sự kiện')
GO
INSERT [dbo].[user_login] ([user], [pass], [name], [level], [gmail], [dienthoai], [lastLogin]) VALUES (N'1', 0x9C1C01DC3AC1445A500251FC34A15D3E75A849DF, N'1', 2, N'1', N'1', CAST(N'2024-11-12T16:30:50.017' AS DateTime))
GO
ALTER TABLE [dbo].[DienBien_LucLuong]  WITH CHECK ADD  CONSTRAINT [FK_DienBien_LucLuong_DienBienLichSu] FOREIGN KEY([id_dien_bien])
REFERENCES [dbo].[DienBienLichSu] ([id_dien_bien])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DienBien_LucLuong] CHECK CONSTRAINT [FK_DienBien_LucLuong_DienBienLichSu]
GO
ALTER TABLE [dbo].[DienBien_LucLuong]  WITH CHECK ADD  CONSTRAINT [FK_DienBien_LucLuong_LucLuongThamGia] FOREIGN KEY([id_luc_luong_tham_gia])
REFERENCES [dbo].[LucLuongThamGia] ([id_luc_luong_tham_gia])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DienBien_LucLuong] CHECK CONSTRAINT [FK_DienBien_LucLuong_LucLuongThamGia]
GO
ALTER TABLE [dbo].[SuKien_DienBien]  WITH CHECK ADD  CONSTRAINT [FK_SuKien_DienBien_DienBienLichSu] FOREIGN KEY([id_dien_bien])
REFERENCES [dbo].[DienBienLichSu] ([id_dien_bien])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SuKien_DienBien] CHECK CONSTRAINT [FK_SuKien_DienBien_DienBienLichSu]
GO
ALTER TABLE [dbo].[SuKien_DienBien]  WITH CHECK ADD  CONSTRAINT [FK_SuKien_DienBien_SuKienLichSu] FOREIGN KEY([id_su_kien])
REFERENCES [dbo].[SuKienLichSu] ([id_su_kien])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SuKien_DienBien] CHECK CONSTRAINT [FK_SuKien_DienBien_SuKienLichSu]
GO
ALTER TABLE [dbo].[SuKien_NhanVat]  WITH CHECK ADD  CONSTRAINT [FK_SuKien_NhanVat_NhanVatLanhDao] FOREIGN KEY([id_nhan_vat])
REFERENCES [dbo].[NhanVatLanhDao] ([id_nhan_vat])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SuKien_NhanVat] CHECK CONSTRAINT [FK_SuKien_NhanVat_NhanVatLanhDao]
GO
ALTER TABLE [dbo].[SuKien_NhanVat]  WITH CHECK ADD  CONSTRAINT [FK_SuKien_NhanVat_SuKienLichSu] FOREIGN KEY([id_su_kien])
REFERENCES [dbo].[SuKienLichSu] ([id_su_kien])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SuKien_NhanVat] CHECK CONSTRAINT [FK_SuKien_NhanVat_SuKienLichSu]
GO
/****** Object:  StoredProcedure [dbo].[SP_ngdung]    Script Date: 12/11/2024 16:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ngdung]
    @action VARCHAR(50),
    @user VARCHAR(50) = NULL,
    @name NVARCHAR(100) = NULL,
    @gmail VARCHAR(50) = NULL,
    @dienthoai VARCHAR(20) = NULL,
    @uid VARCHAR(50) = NULL,
    @pass VARCHAR(50) = NULL,
    @passLogIn VARCHAR(50) = NULL,
    @passnew VARCHAR(255) = NULL

AS
BEGIN
    BEGIN TRY
        IF (@action = 'dangky')
        BEGIN
            IF EXISTS (SELECT * FROM user_login WHERE [user] = @user)
            BEGIN
                SELECT 0 AS ok, N'Tài khoản đã tồn tại' AS message
                FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
                RETURN;
            END

            INSERT INTO user_login ([user], [pass], [name], [level], [gmail], [dienthoai], [lastLogin]) 
            VALUES (@user, HASHBYTES('SHA1', @pass), @name, 1, @gmail, @dienthoai, GETDATE());

            SELECT 1 AS ok, N'Đăng ký thành công' AS message 
            FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
        END
        ELSE IF (@action = 'login')
        BEGIN
            IF NOT EXISTS (SELECT * FROM user_login WHERE [user] = @uid)
            BEGIN
                SELECT 0 AS ok, N'Tài khoản không tồn tại' AS message
                FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
                RETURN;
            END

            IF EXISTS (SELECT * FROM user_login WHERE [user] = @uid AND [pass] = HASHBYTES('SHA1', @passLogIn))
            BEGIN
                SET NOCOUNT ON;
                SELECT 1 AS ok, N'Login thành công' AS msg, [user], [name], [level], [gmail], [dienthoai], [lastLogin]
                FROM user_login
                WHERE [user] = @uid 
                FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;

                UPDATE user_login SET lastLogin = GETDATE() WHERE [user] = @uid;
            END
            ELSE
            BEGIN
                SELECT 0 AS ok, N'Có gì đó sai sai' AS msg 
                FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
            END
        END
        ELSE IF (@action = 'change_tt')
        BEGIN
            IF EXISTS (SELECT * FROM user_login WHERE [user] = @uid AND [pass] = HASHBYTES('SHA1', @passLogIn))
            BEGIN
                UPDATE user_login
                SET [pass] = HASHBYTES('SHA1', @passnew), [name] = @name, [gmail] = @gmail, [dienthoai] = @dienthoai
                WHERE [user] = @uid;

                SELECT 1 AS ok, N'Cập nhật thành công' AS message 
                FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
                RETURN;
            END
            ELSE
            BEGIN
                SELECT 0 AS ok, N'Có gì đó sai sai' AS msg 
                FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
            END
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage 
        FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SKLS]    Script Date: 12/11/2024 16:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SKLS]
    @action VARCHAR(50),
    @loai VARCHAR(50) = NULL,
    @id_su_kien VARCHAR(50) = NULL,
    @ten_su_kien NVARCHAR(255) = NULL,
    @mo_ta NVARCHAR(MAX) = NULL,
    @ngay_bat_dau DATE = NULL,
    @ngay_ket_thuc DATE = NULL,
	@loai_su_kien NVARCHAR(50) = NULL,

    @id_nhan_vat VARCHAR(50) = NULL,
    @ten_nhan_vat NVARCHAR(255) = NULL,
    @ngay_sinh DATE = NULL,
    @ngay_mat DATE = NULL,
    @vai_tro NVARCHAR(100) = NULL,
    @mo_ta_nv NVARCHAR(MAX) = NULL,

    @id_dien_bien VARCHAR(50) = NULL,
    @ten_dien_bien NVARCHAR(255) = NULL,
    @mo_ta_dien_bien NVARCHAR(MAX) = NULL,
    @ngay DATE = NULL,
    @vi_tri_dien_ra NVARCHAR(255) = NULL,

    @id_luc_luong_tham_gia VARCHAR(50) = NULL,
    @ten_luc_luong_tham_gia NVARCHAR(255) = NULL,
    @mo_ta_luc_luong_tham_gia NVARCHAR(MAX) = NULL,

	@timkiem NVARCHAR(255) = NULL

AS
BEGIN
	declare @json nvarchar(max)='';
		IF (@action = 'get_infor')
BEGIN
	SELECT @json = (
		SELECT 
			'get_infor_skls' AS status,
			SKLS.id_su_kien,
			SKLS.ten_su_kien,
			SKLS.ngay_bat_dau,
			SKLS.ngay_ket_thuc,
			SKLS.mo_ta,
			SKLS.loai_su_kien,
			(
				SELECT 
					NVL.id_nhan_vat,
					NVL.ten_nhan_vat,
					NVL.ngay_sinh,
					NVL.ngay_mat,
					NVL.vai_tro,
					NVL.mo_ta_nv
				FROM 
					NhanVatLanhDao AS NVL
				INNER JOIN SuKien_NhanVat AS SKNV ON SKNV.id_nhan_vat = NVL.id_nhan_vat
				WHERE 
					SKNV.id_su_kien = SKLS.id_su_kien
				FOR JSON PATH
			) AS nhan_vat_lanh_dao,
			(
				SELECT 
					DBLS.id_dien_bien,
					DBLS.ten_dien_bien,
					DBLS.mo_ta_dien_bien,
					DBLS.ngay,
					DBLS.vi_tri_dien_ra,
					(
						SELECT 
							LLTG.id_luc_luong_tham_gia,
							LLTG.ten_luc_luong_tham_gia,
							LLTG.mo_ta_luc_luong_tham_gia
						FROM 
							LucLuongThamGia AS LLTG
						INNER JOIN DienBien_LucLuong AS DBLL ON DBLL.id_luc_luong_tham_gia = LLTG.id_luc_luong_tham_gia
						WHERE 
							DBLL.id_dien_bien = DBLS.id_dien_bien
						FOR JSON PATH
					) AS luc_luong_tham_gia
				FROM 
					DienBienLichSu AS DBLS
				INNER JOIN SuKien_DienBien AS SKLDB ON SKLDB.id_dien_bien = DBLS.id_dien_bien
				WHERE 
					SKLDB.id_su_kien = SKLS.id_su_kien
				FOR JSON PATH
			) AS dien_bien_lich_su
		FROM 
			SuKienLichSu AS SKLS
		FOR JSON PATH
	);

	SELECT @json AS [json];
END

    ELSE IF (@action = 'add' AND @loai = 'SuKienLichSu')
    BEGIN
        INSERT INTO SuKienLichSu (id_su_kien, ten_su_kien, mo_ta, ngay_bat_dau, ngay_ket_thuc,loai_su_kien)
        VALUES (@id_su_kien, @ten_su_kien, @mo_ta, @ngay_bat_dau, @ngay_ket_thuc,@loai_su_kien);
		SELECT 'ok' AS ok, 'Thêm thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;

    END

    ELSE IF (@action = 'add' AND @loai = 'NhanVatLanhDao')
    BEGIN
		INSERT INTO NhanVatLanhDao (id_nhan_vat, ten_nhan_vat, ngay_sinh, ngay_mat, vai_tro, mo_ta_nv)
        VALUES (@id_nhan_vat, @ten_nhan_vat, @ngay_sinh, @ngay_mat, @vai_tro, @mo_ta_nv);

		INSERT INTO SuKien_NhanVat (id_su_kien, id_nhan_vat)
        VALUES (@id_su_kien, @id_nhan_vat);

		SELECT 'ok' AS ok, 'Thêm thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END

    ELSE IF (@action = 'add' AND @loai = 'DienBienLichSu')
    BEGIN
        INSERT INTO DienBienLichSu (id_dien_bien, ten_dien_bien, mo_ta_dien_bien, ngay, vi_tri_dien_ra)
        VALUES (@id_dien_bien, @ten_dien_bien, @mo_ta_dien_bien, @ngay, @vi_tri_dien_ra);

		INSERT INTO SuKien_DienBien (id_su_kien, id_dien_bien)
        VALUES (@id_su_kien, @id_dien_bien);
		SELECT 'ok' AS ok, 'Thêm thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;

    END

    ELSE IF (@action = 'add' AND @loai = 'LucLuongThamGia')
    BEGIN
        INSERT INTO LucLuongThamGia (id_luc_luong_tham_gia, ten_luc_luong_tham_gia, mo_ta_luc_luong_tham_gia)
        VALUES (@id_luc_luong_tham_gia, @ten_luc_luong_tham_gia, @mo_ta_luc_luong_tham_gia);

		INSERT INTO DienBien_LucLuong (id_dien_bien, id_luc_luong_tham_gia)
        VALUES (@id_dien_bien, @id_luc_luong_tham_gia);
		SELECT 'ok' AS ok, 'Thêm thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END

    ELSE IF (@action = 'update' AND @loai = 'SuKienLichSu')
    BEGIN
        UPDATE SuKienLichSu
        SET ten_su_kien = @ten_su_kien, mo_ta = @mo_ta, ngay_bat_dau = @ngay_bat_dau, ngay_ket_thuc = @ngay_ket_thuc
        WHERE id_su_kien = @id_su_kien;
		SELECT 'ok' AS ok, 'Sửa thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END

    ELSE IF (@action = 'update' AND @loai = 'NhanVatLanhDao')
    BEGIN
        UPDATE NhanVatLanhDao
        SET ten_nhan_vat = @ten_nhan_vat, ngay_sinh = @ngay_sinh, ngay_mat = @ngay_mat, vai_tro = @vai_tro, mo_ta_nv = @mo_ta_nv
        WHERE id_nhan_vat = @id_nhan_vat;
		SELECT 'ok' AS ok, 'Sửa thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END

    ELSE IF (@action = 'update' AND @loai = 'DienBienLichSu')
    BEGIN
        UPDATE DienBienLichSu
        SET ten_dien_bien = @ten_dien_bien, mo_ta_dien_bien = @mo_ta_dien_bien, ngay = @ngay, vi_tri_dien_ra = @vi_tri_dien_ra
        WHERE id_dien_bien = @id_dien_bien;
		SELECT 'ok' AS ok, 'Sửa thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END

    ELSE IF (@action = 'update' AND @loai = 'LucLuongThamGia')
    BEGIN
        UPDATE LucLuongThamGia
        SET ten_luc_luong_tham_gia = @ten_luc_luong_tham_gia, mo_ta_luc_luong_tham_gia = @mo_ta_luc_luong_tham_gia
        WHERE id_luc_luong_tham_gia = @id_luc_luong_tham_gia;
		SELECT 'ok' AS ok, 'Sửa thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END

    ELSE IF (@action = 'delete' AND @loai = 'SuKienLichSu')
    BEGIN
        DELETE FROM SuKienLichSu WHERE id_su_kien = @id_su_kien;
		DELETE FROM SuKien_NhanVat WHERE id_su_kien = @id_su_kien;
		DELETE FROM SuKien_DienBien WHERE id_su_kien = @id_su_kien;
		SELECT 'ok' AS ok, 'Xóa thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END

    ELSE IF (@action = 'delete' AND @loai = 'NhanVatLanhDao')
    BEGIN
        DELETE FROM NhanVatLanhDao WHERE id_nhan_vat = @id_nhan_vat;
		DELETE FROM SuKien_NhanVat WHERE id_nhan_vat = @id_nhan_vat and id_su_kien = @id_su_kien;
		SELECT 'ok' AS ok, 'Xóa thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END

    ELSE IF (@action = 'delete' AND @loai = 'DienBienLichSu')
    BEGIN
        DELETE FROM DienBienLichSu WHERE id_dien_bien = @id_dien_bien;
		DELETE FROM SuKien_DienBien WHERE id_dien_bien = @id_dien_bien and id_su_kien = @id_su_kien;
		SELECT 'ok' AS ok, 'Xóa thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END

    ELSE IF (@action = 'delete' AND @loai = 'LucLuongThamGia')
    BEGIN
        DELETE FROM LucLuongThamGia WHERE id_luc_luong_tham_gia = @id_luc_luong_tham_gia;
		DELETE FROM DienBien_LucLuong WHERE id_luc_luong_tham_gia = @id_luc_luong_tham_gia and id_dien_bien = @id_dien_bien;
		SELECT 'ok' AS ok, 'Xóa thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END
	ELSE IF (@action = 'timkiem')
	BEGIN
		DECLARE @count INT;

		WITH TimKiemCTE AS (
			SELECT id_su_kien, ten_su_kien, mo_ta, ngay_bat_dau, ngay_ket_thuc, loai_su_kien
			FROM SuKienLichSu
			WHERE id_su_kien LIKE '%' + @timkiem + '%'
			   OR ten_su_kien LIKE '%' + @timkiem + '%'
			   OR mo_ta LIKE '%' + @timkiem + '%'
			   OR loai_su_kien LIKE '%' + @timkiem + '%'

			UNION ALL

			SELECT id_nhan_vat, ten_nhan_vat, mo_ta_nv AS mo_ta, ngay_sinh, ngay_mat, vai_tro
			FROM NhanVatLanhDao
			WHERE id_nhan_vat LIKE '%' + @timkiem + '%'
			   OR ten_nhan_vat LIKE '%' + @timkiem + '%'
			   OR mo_ta_nv LIKE '%' + @timkiem + '%'
			   OR vai_tro LIKE '%' + @timkiem + '%'

			UNION ALL

			SELECT id_dien_bien, ten_dien_bien, mo_ta_dien_bien AS mo_ta, ngay, NULL AS ngay_ket_thuc, vi_tri_dien_ra AS loai_su_kien
			FROM DienBienLichSu
			WHERE id_dien_bien LIKE '%' + @timkiem + '%'
			   OR ten_dien_bien LIKE '%' + @timkiem + '%'
			   OR mo_ta_dien_bien LIKE '%' + @timkiem + '%'
			   OR vi_tri_dien_ra LIKE '%' + @timkiem + '%'

			UNION ALL

			SELECT id_luc_luong_tham_gia, ten_luc_luong_tham_gia, mo_ta_luc_luong_tham_gia AS mo_ta, NULL AS ngay_bat_dau, NULL AS ngay_ket_thuc, NULL AS loai_su_kien
			FROM LucLuongThamGia
			WHERE id_luc_luong_tham_gia LIKE '%' + @timkiem + '%'
			   OR ten_luc_luong_tham_gia LIKE '%' + @timkiem + '%'
			   OR mo_ta_luc_luong_tham_gia LIKE '%' + @timkiem + '%'
		)
    
		SELECT @json = (
			SELECT 'timkiem' AS status, '1' AS ok,
				   COUNT(*) OVER() AS total_results, 
				   *
			FROM TimKiemCTE
			FOR JSON PATH
		);

		SELECT @json AS [json];
	END
end
GO
