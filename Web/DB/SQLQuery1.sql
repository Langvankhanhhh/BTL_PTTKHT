USE [Ql_lichsu]
GO
/****** Object:  Table [dbo].[DiaDiem]    Script Date: 20/10/2024 21:17:41 ******/
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
/****** Object:  Table [dbo].[NhanVatLichSu]    Script Date: 20/10/2024 21:17:41 ******/
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
/****** Object:  Table [dbo].[SuKienLichSu]    Script Date: 20/10/2024 21:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuKienLichSu](
	[id_su_kien] [varchar](20) NOT NULL,
	[ten_su_kien] [varchar](255) NOT NULL,
	[mo_ta] [text] NULL,
	[ngay_bat_dau] [varchar](50) NULL,
	[ngay_ket_thuc] [varchar](50) NULL,
	[loai_su_kien] [varchar](100) NULL,
	[id_nhan_vat] [varchar](20) NULL,
	[id_thoi_diem] [varchar](20) NULL,
	[id_dia_diem] [varchar](20) NULL,
 CONSTRAINT [PK__SuKienLi__2EB973CC35818D3A] PRIMARY KEY CLUSTERED 
(
	[id_su_kien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThoiDiemQuanTrong]    Script Date: 20/10/2024 21:17:41 ******/
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
