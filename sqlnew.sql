USE [NCKH_QLLH]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetDateFromWeekdayAndWeekOfYear]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetDateFromWeekdayAndWeekOfYear] (@Weekday INT, @WeekOfYear INT, @Year INT)
RETURNS DATE
AS
BEGIN
    DECLARE @StartOfYear DATE, @StartOfWeek DATE, @Result DATE

    SET @StartOfYear = DATEFROMPARTS(@Year, 1, 1)
    SET @StartOfWeek = DATEADD(dd, (@@DATEFIRST - DATEPART(dw, @StartOfYear) - 6) % 7, @StartOfYear)
    SET @Result = DATEADD(wk, @WeekOfYear - 1, @StartOfWeek)
    SET @Result = DATEADD(dd, @Weekday - DATEPART(dw, @Result), @Result)

    RETURN @Result
END
GO
/****** Object:  Table [dbo].[CAHOC]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAHOC](
	[Macahoc] [nvarchar](50) NOT NULL,
	[Mathu] [int] NULL,
	[Maca] [nvarchar](50) NULL,
 CONSTRAINT [PK_CAHOC] PRIMARY KEY CLUSTERED 
(
	[Macahoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATRONGNGAY]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATRONGNGAY](
	[Maca] [nvarchar](50) NOT NULL,
	[Tiethoc] [nvarchar](50) NULL,
 CONSTRAINT [PK_CATRONGNGAY] PRIMARY KEY CLUSTERED 
(
	[Maca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANGKIXEPLICHTHUCHANH]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANGKIXEPLICHTHUCHANH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Malophocphan] [nvarchar](50) NOT NULL,
	[Tuan] [int] NOT NULL,
	[SoluongCa] [int] NULL,
	[Nam] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DANGKIXEPLICHTHUCHANH_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GIANGVIEN]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIANGVIEN](
	[Magiangvien] [nvarchar](50) NOT NULL,
	[HoTenGiangVien] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
 CONSTRAINT [PK_GIANGVIEN] PRIMARY KEY CLUSTERED 
(
	[Magiangvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hienthi]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hienthi](
	[IDXepLichCa] [nchar](10) NULL,
	[CaHoc] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LICHHOCLOPDACO]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LICHHOCLOPDACO](
	[Malophocphan] [nvarchar](50) NOT NULL,
	[Macahoc] [nvarchar](50) NOT NULL,
	[Tuan] [int] NOT NULL,
	[Nam] [nvarchar](50) NULL,
 CONSTRAINT [PK_LICHHOCLOPDACO] PRIMARY KEY CLUSTERED 
(
	[Malophocphan] ASC,
	[Macahoc] ASC,
	[Tuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LICHTHUCHANH]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LICHTHUCHANH](
	[ID] [varchar](50) NOT NULL,
	[Malophocphan] [nvarchar](50) NOT NULL,
	[Macahoc] [nvarchar](50) NOT NULL,
	[Tuan] [int] NOT NULL,
	[Nam] [nvarchar](50) NULL,
	[Maphong] [nvarchar](50) NULL,
 CONSTRAINT [PK_LICHTHUCHANH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Malophocphan] ASC,
	[Macahoc] ASC,
	[Tuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOPHOCPHAN]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOPHOCPHAN](
	[Malophocphan] [nvarchar](50) NOT NULL,
	[Monhoc] [nvarchar](50) NULL,
	[Lopdanhnghia] [nvarchar](50) NULL,
	[Giaoviengiangday] [nvarchar](50) NULL,
 CONSTRAINT [PK_LOPHOCPHAN] PRIMARY KEY CLUSTERED 
(
	[Malophocphan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHONGTHUCHANH]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHONGTHUCHANH](
	[Maphong] [nvarchar](50) NOT NULL,
	[Tenphong] [nvarchar](50) NULL,
	[Diachiphong] [nvarchar](50) NULL,
 CONSTRAINT [PK_PHONGTHUCHANH] PRIMARY KEY CLUSTERED 
(
	[Maphong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [nvarchar](50) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THU]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THU](
	[Mathu] [int] NOT NULL,
	[Tenthu] [nvarchar](50) NULL,
 CONSTRAINT [PK_THU] PRIMARY KEY CLUSTERED 
(
	[Mathu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserName] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XepLichCa]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XepLichCa](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDXepLich] [int] NOT NULL,
	[Macahoc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_XepLichCa] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[IDXepLich] ASC,
	[Macahoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'0', 2, N'Ca1')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'1', 3, N'Ca1')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'10', 6, N'Ca2')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'11', 7, N'Ca2')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'12', 2, N'Ca3')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'13', 3, N'Ca3')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'14', 4, N'Ca3')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'15', 5, N'Ca3')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'16', 6, N'Ca3')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'17', 7, N'Ca3')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'18', 2, N'Ca4')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'19', 3, N'Ca4')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'2', 4, N'Ca1')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'20', 4, N'Ca4')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'21', 5, N'Ca4')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'22', 6, N'Ca4')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'23', 7, N'Ca4')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'3', 5, N'Ca1')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'4', 6, N'Ca1')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'5', 7, N'Ca1')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'6', 2, N'Ca2')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'7', 3, N'Ca2')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'8', 4, N'Ca2')
INSERT [dbo].[CAHOC] ([Macahoc], [Mathu], [Maca]) VALUES (N'9', 5, N'Ca2')
GO
INSERT [dbo].[CATRONGNGAY] ([Maca], [Tiethoc]) VALUES (N'Ca1', N'Tiết 1-3')
INSERT [dbo].[CATRONGNGAY] ([Maca], [Tiethoc]) VALUES (N'Ca2', N'Tiết 4-6')
INSERT [dbo].[CATRONGNGAY] ([Maca], [Tiethoc]) VALUES (N'Ca3', N'Tiết 7-9')
INSERT [dbo].[CATRONGNGAY] ([Maca], [Tiethoc]) VALUES (N'Ca4', N'Tiết 10-12')
GO
SET IDENTITY_INSERT [dbo].[DANGKIXEPLICHTHUCHANH] ON 

INSERT [dbo].[DANGKIXEPLICHTHUCHANH] ([ID], [Malophocphan], [Tuan], [SoluongCa], [Nam]) VALUES (1, N'LH1001', 1, 1, N'2023')
INSERT [dbo].[DANGKIXEPLICHTHUCHANH] ([ID], [Malophocphan], [Tuan], [SoluongCa], [Nam]) VALUES (2, N'LH1001', 2, 1, N'2023')
INSERT [dbo].[DANGKIXEPLICHTHUCHANH] ([ID], [Malophocphan], [Tuan], [SoluongCa], [Nam]) VALUES (3, N'LH1002', 1, 1, N'2023')
INSERT [dbo].[DANGKIXEPLICHTHUCHANH] ([ID], [Malophocphan], [Tuan], [SoluongCa], [Nam]) VALUES (4, N'LH1006', 1, 1, N'2023')
INSERT [dbo].[DANGKIXEPLICHTHUCHANH] ([ID], [Malophocphan], [Tuan], [SoluongCa], [Nam]) VALUES (5, N'LH1008', 1, 1, N'2023')
INSERT [dbo].[DANGKIXEPLICHTHUCHANH] ([ID], [Malophocphan], [Tuan], [SoluongCa], [Nam]) VALUES (6, N'LH1003', 1, 1, N'2023')
INSERT [dbo].[DANGKIXEPLICHTHUCHANH] ([ID], [Malophocphan], [Tuan], [SoluongCa], [Nam]) VALUES (7, N'LH1007', 1, 1, N'2023')
INSERT [dbo].[DANGKIXEPLICHTHUCHANH] ([ID], [Malophocphan], [Tuan], [SoluongCa], [Nam]) VALUES (8, N'LH1004', 1, 1, N'2023')
INSERT [dbo].[DANGKIXEPLICHTHUCHANH] ([ID], [Malophocphan], [Tuan], [SoluongCa], [Nam]) VALUES (9, N'LH1010', 1, 1, N'2023')
INSERT [dbo].[DANGKIXEPLICHTHUCHANH] ([ID], [Malophocphan], [Tuan], [SoluongCa], [Nam]) VALUES (10, N'LH1005', 1, 1, N'2023')
INSERT [dbo].[DANGKIXEPLICHTHUCHANH] ([ID], [Malophocphan], [Tuan], [SoluongCa], [Nam]) VALUES (11, N'LH1009', 1, 1, N'2023')
INSERT [dbo].[DANGKIXEPLICHTHUCHANH] ([ID], [Malophocphan], [Tuan], [SoluongCa], [Nam]) VALUES (12, N'LH1006', 2, 1, N'2023')
INSERT [dbo].[DANGKIXEPLICHTHUCHANH] ([ID], [Malophocphan], [Tuan], [SoluongCa], [Nam]) VALUES (13, N'LH1002', 2, 1, N'2023')
INSERT [dbo].[DANGKIXEPLICHTHUCHANH] ([ID], [Malophocphan], [Tuan], [SoluongCa], [Nam]) VALUES (15, N'LH1008', 15, 1, N'2023')
INSERT [dbo].[DANGKIXEPLICHTHUCHANH] ([ID], [Malophocphan], [Tuan], [SoluongCa], [Nam]) VALUES (16, N'LH1011', 1, 1, N'2023')
SET IDENTITY_INSERT [dbo].[DANGKIXEPLICHTHUCHANH] OFF
GO
INSERT [dbo].[GIANGVIEN] ([Magiangvien], [HoTenGiangVien], [UserName]) VALUES (N'GV1001', N'Phạm Thị Thùy', N'GV1001')
INSERT [dbo].[GIANGVIEN] ([Magiangvien], [HoTenGiangVien], [UserName]) VALUES (N'GV1002', N'Trần Huyền Tân', N'GV1002')
INSERT [dbo].[GIANGVIEN] ([Magiangvien], [HoTenGiangVien], [UserName]) VALUES (N'GV1003', N'Nguyễn Trọng Tấn', N'GV1003')
INSERT [dbo].[GIANGVIEN] ([Magiangvien], [HoTenGiangVien], [UserName]) VALUES (N'GV1004', N'Nguyễn Thế Quang', N'GV1004')
INSERT [dbo].[GIANGVIEN] ([Magiangvien], [HoTenGiangVien], [UserName]) VALUES (N'GV1005', N'Lê Vũ Quang', N'GV1005')
GO
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'0', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'0', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'10', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'10', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'13', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'13', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'14', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'15', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'15', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'16', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'16', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'19', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'19', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'20', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'20', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'21', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'21', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'22', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'23', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'6', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'6', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'8', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1001', N'9', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1002', N'0', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1002', N'0', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1002', N'1', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1002', N'11', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1002', N'12', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1002', N'13', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1002', N'13', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1002', N'14', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1002', N'15', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1002', N'16', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1002', N'18', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1002', N'21', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1002', N'23', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1002', N'4', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1002', N'6', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1002', N'6', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1002', N'7', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1002', N'9', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1003', N'10', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1003', N'13', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1003', N'14', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1003', N'6', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1003', N'9', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1004', N'10', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1004', N'11', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1004', N'16', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1004', N'6', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1005', N'13', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1005', N'2', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'0', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'0', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'11', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'11', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'13', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'14', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'15', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'16', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'16', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'18', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'19', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'2', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'21', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'22', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'23', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'4', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'6', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'6', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'7', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'8', 2, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1006', N'9', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1007', N'15', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1007', N'18', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1007', N'23', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1008', N'0', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1008', N'0', 15, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1008', N'1', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1008', N'11', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1008', N'13', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1008', N'14', 15, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1008', N'16', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1008', N'18', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1008', N'20', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1008', N'21', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1008', N'21', 15, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1008', N'23', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1008', N'3', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1008', N'7', 15, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1008', N'8', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1008', N'8', 15, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1009', N'16', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1009', N'19', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1009', N'4', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1010', N'1', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1010', N'15', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1010', N'20', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1010', N'8', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1011', N'0', 1, N'2023')
GO
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1011', N'16', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1011', N'21', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1011', N'23', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1011', N'6', 1, N'2023')
INSERT [dbo].[LICHHOCLOPDACO] ([Malophocphan], [Macahoc], [Tuan], [Nam]) VALUES (N'LH1011', N'7', 1, N'2023')
GO
INSERT [dbo].[LICHTHUCHANH] ([ID], [Malophocphan], [Macahoc], [Tuan], [Nam], [Maphong]) VALUES (N'1', N'LH1001', N'0', 1, N'2023', N'PM1')
INSERT [dbo].[LICHTHUCHANH] ([ID], [Malophocphan], [Macahoc], [Tuan], [Nam], [Maphong]) VALUES (N'10', N'LH1005', N'0', 1, N'2023', N'PM5')
INSERT [dbo].[LICHTHUCHANH] ([ID], [Malophocphan], [Macahoc], [Tuan], [Nam], [Maphong]) VALUES (N'11', N'LH1009', N'1', 1, N'2023', N'PM5')
INSERT [dbo].[LICHTHUCHANH] ([ID], [Malophocphan], [Macahoc], [Tuan], [Nam], [Maphong]) VALUES (N'12', N'LH1006', N'1', 2, N'2023', N'PM1')
INSERT [dbo].[LICHTHUCHANH] ([ID], [Malophocphan], [Macahoc], [Tuan], [Nam], [Maphong]) VALUES (N'16', N'LH1011', N'2', 1, N'2023', N'PM1')
INSERT [dbo].[LICHTHUCHANH] ([ID], [Malophocphan], [Macahoc], [Tuan], [Nam], [Maphong]) VALUES (N'2', N'LH1001', N'0', 2, N'2023', N'PM1')
INSERT [dbo].[LICHTHUCHANH] ([ID], [Malophocphan], [Macahoc], [Tuan], [Nam], [Maphong]) VALUES (N'3', N'LH1002', N'0', 1, N'2023', N'PM2')
INSERT [dbo].[LICHTHUCHANH] ([ID], [Malophocphan], [Macahoc], [Tuan], [Nam], [Maphong]) VALUES (N'4', N'LH1006', N'1', 1, N'2023', N'PM1')
INSERT [dbo].[LICHTHUCHANH] ([ID], [Malophocphan], [Macahoc], [Tuan], [Nam], [Maphong]) VALUES (N'5', N'LH1008', N'1', 1, N'2023', N'PM2')
INSERT [dbo].[LICHTHUCHANH] ([ID], [Malophocphan], [Macahoc], [Tuan], [Nam], [Maphong]) VALUES (N'6', N'LH1003', N'0', 1, N'2023', N'PM3')
INSERT [dbo].[LICHTHUCHANH] ([ID], [Malophocphan], [Macahoc], [Tuan], [Nam], [Maphong]) VALUES (N'7', N'LH1007', N'1', 1, N'2023', N'PM3')
INSERT [dbo].[LICHTHUCHANH] ([ID], [Malophocphan], [Macahoc], [Tuan], [Nam], [Maphong]) VALUES (N'8', N'LH1004', N'0', 1, N'2023', N'PM4')
INSERT [dbo].[LICHTHUCHANH] ([ID], [Malophocphan], [Macahoc], [Tuan], [Nam], [Maphong]) VALUES (N'9', N'LH1010', N'1', 1, N'2023', N'PM4')
GO
INSERT [dbo].[LOPHOCPHAN] ([Malophocphan], [Monhoc], [Lopdanhnghia], [Giaoviengiangday]) VALUES (N'LH1001', N'Lập Trình .NET', N'DHTI-13A5', N'GV1001')
INSERT [dbo].[LOPHOCPHAN] ([Malophocphan], [Monhoc], [Lopdanhnghia], [Giaoviengiangday]) VALUES (N'LH1002', N'Thực tập lập trình mạng', N'DHTI-13A1', N'GV1002')
INSERT [dbo].[LOPHOCPHAN] ([Malophocphan], [Monhoc], [Lopdanhnghia], [Giaoviengiangday]) VALUES (N'LH1003', N'Android', N'DHTI-13A2', N'GV1003')
INSERT [dbo].[LOPHOCPHAN] ([Malophocphan], [Monhoc], [Lopdanhnghia], [Giaoviengiangday]) VALUES (N'LH1004', N'Kỹ thuật mô phỏng', N'DHTI-13A3', N'GV1004')
INSERT [dbo].[LOPHOCPHAN] ([Malophocphan], [Monhoc], [Lopdanhnghia], [Giaoviengiangday]) VALUES (N'LH1005', N'Hệ điều hành', N'DHTI-13A4', N'GV1005')
INSERT [dbo].[LOPHOCPHAN] ([Malophocphan], [Monhoc], [Lopdanhnghia], [Giaoviengiangday]) VALUES (N'LH1006', N'Cơ sở dữ liệu', N'DHTI-13A6', N'GV1001')
INSERT [dbo].[LOPHOCPHAN] ([Malophocphan], [Monhoc], [Lopdanhnghia], [Giaoviengiangday]) VALUES (N'LH1007', N'Toán rời rạc 1', N'DHTI-13A7', N'GV1003')
INSERT [dbo].[LOPHOCPHAN] ([Malophocphan], [Monhoc], [Lopdanhnghia], [Giaoviengiangday]) VALUES (N'LH1008', N'Toán rời rạc 2', N'DHTI-13A8', N'GV1002')
INSERT [dbo].[LOPHOCPHAN] ([Malophocphan], [Monhoc], [Lopdanhnghia], [Giaoviengiangday]) VALUES (N'LH1009', N'Toán rời rạc 3', N'DHTI-13A9', N'GV1005')
INSERT [dbo].[LOPHOCPHAN] ([Malophocphan], [Monhoc], [Lopdanhnghia], [Giaoviengiangday]) VALUES (N'LH1010', N'Toán rời rạc 4', N'DHTI-13A10', N'GV1004')
INSERT [dbo].[LOPHOCPHAN] ([Malophocphan], [Monhoc], [Lopdanhnghia], [Giaoviengiangday]) VALUES (N'LH1011', N'Trí tuệ nhân tạo', N'DHTI-13A5', N'GV1001')
INSERT [dbo].[LOPHOCPHAN] ([Malophocphan], [Monhoc], [Lopdanhnghia], [Giaoviengiangday]) VALUES (N'LH1012', N'Tin Văn Phòng', N'DHTI-13A2', N'GV1003')
GO
INSERT [dbo].[PHONGTHUCHANH] ([Maphong], [Tenphong], [Diachiphong]) VALUES (N'PM1', N'Phòng Máy 1', N'501-HA9')
INSERT [dbo].[PHONGTHUCHANH] ([Maphong], [Tenphong], [Diachiphong]) VALUES (N'PM10', N'Phòng Máy 10', N'510-HA9')
INSERT [dbo].[PHONGTHUCHANH] ([Maphong], [Tenphong], [Diachiphong]) VALUES (N'PM2', N'Phòng Máy 2', N'502-HA9')
INSERT [dbo].[PHONGTHUCHANH] ([Maphong], [Tenphong], [Diachiphong]) VALUES (N'PM3', N'Phòng Máy 3', N'503-HA9')
INSERT [dbo].[PHONGTHUCHANH] ([Maphong], [Tenphong], [Diachiphong]) VALUES (N'PM4', N'Phòng Máy 4', N'504-HA9')
INSERT [dbo].[PHONGTHUCHANH] ([Maphong], [Tenphong], [Diachiphong]) VALUES (N'PM5', N'Phòng Máy 5', N'505-HA9')
INSERT [dbo].[PHONGTHUCHANH] ([Maphong], [Tenphong], [Diachiphong]) VALUES (N'PM6', N'Phòng Máy 6', N'506-HA9')
INSERT [dbo].[PHONGTHUCHANH] ([Maphong], [Tenphong], [Diachiphong]) VALUES (N'PM7', N'Phòng Máy 7', N'507-HA9')
INSERT [dbo].[PHONGTHUCHANH] ([Maphong], [Tenphong], [Diachiphong]) VALUES (N'PM8', N'Phòng Máy 8', N'508-HA9')
INSERT [dbo].[PHONGTHUCHANH] ([Maphong], [Tenphong], [Diachiphong]) VALUES (N'PM9', N'Phòng Máy 9', N'509-HA9')
GO
INSERT [dbo].[THU] ([Mathu], [Tenthu]) VALUES (2, N'Thứ 2')
INSERT [dbo].[THU] ([Mathu], [Tenthu]) VALUES (3, N'Thứ 3')
INSERT [dbo].[THU] ([Mathu], [Tenthu]) VALUES (4, N'Thứ 4')
INSERT [dbo].[THU] ([Mathu], [Tenthu]) VALUES (5, N'Thứ 5')
INSERT [dbo].[THU] ([Mathu], [Tenthu]) VALUES (6, N'Thứ 6')
INSERT [dbo].[THU] ([Mathu], [Tenthu]) VALUES (7, N'Thứ 7')
INSERT [dbo].[THU] ([Mathu], [Tenthu]) VALUES (8, N'Chủ Nhật')
GO
INSERT [dbo].[User] ([UserName], [PassWord], [Role]) VALUES (N'admin', N'admin', N'admin')
INSERT [dbo].[User] ([UserName], [PassWord], [Role]) VALUES (N'GV1001', N'2', N'user')
INSERT [dbo].[User] ([UserName], [PassWord], [Role]) VALUES (N'GV1002', N'2', N'user')
INSERT [dbo].[User] ([UserName], [PassWord], [Role]) VALUES (N'GV1003', N'2', N'user')
INSERT [dbo].[User] ([UserName], [PassWord], [Role]) VALUES (N'GV1004', N'2', N'user')
INSERT [dbo].[User] ([UserName], [PassWord], [Role]) VALUES (N'GV1005', N'2', N'user')
GO
ALTER TABLE [dbo].[CAHOC]  WITH CHECK ADD  CONSTRAINT [FK_CAHOC_CATRONGNGAY] FOREIGN KEY([Maca])
REFERENCES [dbo].[CATRONGNGAY] ([Maca])
GO
ALTER TABLE [dbo].[CAHOC] CHECK CONSTRAINT [FK_CAHOC_CATRONGNGAY]
GO
ALTER TABLE [dbo].[CAHOC]  WITH CHECK ADD  CONSTRAINT [FK_CAHOC_THU] FOREIGN KEY([Mathu])
REFERENCES [dbo].[THU] ([Mathu])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CAHOC] CHECK CONSTRAINT [FK_CAHOC_THU]
GO
ALTER TABLE [dbo].[DANGKIXEPLICHTHUCHANH]  WITH CHECK ADD  CONSTRAINT [FK_DANGKIXEPLICHTHUCHANH_LOPHOCPHAN] FOREIGN KEY([Malophocphan])
REFERENCES [dbo].[LOPHOCPHAN] ([Malophocphan])
GO
ALTER TABLE [dbo].[DANGKIXEPLICHTHUCHANH] CHECK CONSTRAINT [FK_DANGKIXEPLICHTHUCHANH_LOPHOCPHAN]
GO
ALTER TABLE [dbo].[GIANGVIEN]  WITH CHECK ADD  CONSTRAINT [FK_GIANGVIEN_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[GIANGVIEN] CHECK CONSTRAINT [FK_GIANGVIEN_User]
GO
ALTER TABLE [dbo].[LICHHOCLOPDACO]  WITH CHECK ADD  CONSTRAINT [FK_LICHHOCLOPDACO_CAHOC] FOREIGN KEY([Macahoc])
REFERENCES [dbo].[CAHOC] ([Macahoc])
GO
ALTER TABLE [dbo].[LICHHOCLOPDACO] CHECK CONSTRAINT [FK_LICHHOCLOPDACO_CAHOC]
GO
ALTER TABLE [dbo].[LICHHOCLOPDACO]  WITH CHECK ADD  CONSTRAINT [FK_LICHHOCLOPDACO_LOPHOCPHAN] FOREIGN KEY([Malophocphan])
REFERENCES [dbo].[LOPHOCPHAN] ([Malophocphan])
GO
ALTER TABLE [dbo].[LICHHOCLOPDACO] CHECK CONSTRAINT [FK_LICHHOCLOPDACO_LOPHOCPHAN]
GO
ALTER TABLE [dbo].[LICHTHUCHANH]  WITH CHECK ADD  CONSTRAINT [FK_LICHTHUCHANH_CAHOC] FOREIGN KEY([Macahoc])
REFERENCES [dbo].[CAHOC] ([Macahoc])
GO
ALTER TABLE [dbo].[LICHTHUCHANH] CHECK CONSTRAINT [FK_LICHTHUCHANH_CAHOC]
GO
ALTER TABLE [dbo].[LICHTHUCHANH]  WITH CHECK ADD  CONSTRAINT [FK_LICHTHUCHANH_PHONGTHUCHANH] FOREIGN KEY([Maphong])
REFERENCES [dbo].[PHONGTHUCHANH] ([Maphong])
GO
ALTER TABLE [dbo].[LICHTHUCHANH] CHECK CONSTRAINT [FK_LICHTHUCHANH_PHONGTHUCHANH]
GO
ALTER TABLE [dbo].[LOPHOCPHAN]  WITH CHECK ADD  CONSTRAINT [FK_LOPHOCPHAN_GIANGVIEN] FOREIGN KEY([Giaoviengiangday])
REFERENCES [dbo].[GIANGVIEN] ([Magiangvien])
GO
ALTER TABLE [dbo].[LOPHOCPHAN] CHECK CONSTRAINT [FK_LOPHOCPHAN_GIANGVIEN]
GO
ALTER TABLE [dbo].[XepLichCa]  WITH CHECK ADD  CONSTRAINT [FK_XepLichCa_CAHOC] FOREIGN KEY([Macahoc])
REFERENCES [dbo].[CAHOC] ([Macahoc])
GO
ALTER TABLE [dbo].[XepLichCa] CHECK CONSTRAINT [FK_XepLichCa_CAHOC]
GO
ALTER TABLE [dbo].[XepLichCa]  WITH CHECK ADD  CONSTRAINT [FK_XepLichCa_DANGKIXEPLICHTHUCHANH] FOREIGN KEY([IDXepLich])
REFERENCES [dbo].[DANGKIXEPLICHTHUCHANH] ([ID])
GO
ALTER TABLE [dbo].[XepLichCa] CHECK CONSTRAINT [FK_XepLichCa_DANGKIXEPLICHTHUCHANH]
GO
/****** Object:  StoredProcedure [dbo].[searchDangKyLich]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[searchDangKyLich]
	@tukhoa nvarchar(50)
as
begin
	set @tukhoa = lower(ltrim(rtrim(@tukhoa)));
	select 
	d.ID,d.Malophocphan,g.HoTenGiangVien,d.Tuan,d.SoluongCa, d.Nam 
	from DANGKIXEPLICHTHUCHANH d 
	inner join LOPHOCPHAN l on l.Malophocphan = d.Malophocphan 
	inner join GIANGVIEN g on g.Magiangvien = l.Giaoviengiangday
	where LOWER(g.HoTenGiangVien) like '%'+@tukhoa+'%'
	or LOWER(d.ID) like '%'+@tukhoa+'%'
	or LOWER(d.Nam) like '%'+@tukhoa+'%'
	order by g.HoTenGiangVien
end
GO
/****** Object:  StoredProcedure [dbo].[searchDangKyLichHoc]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[searchDangKyLichHoc]
	@tukhoa nvarchar(50),
	@magv nvarchar(50)
as
begin
	set @tukhoa = lower(ltrim(rtrim(@tukhoa)));
	set @magv = lower(ltrim(rtrim(@magv)));
	select 
	d.ID,d.Malophocphan,g.HoTenGiangVien,d.Tuan,d.SoluongCa, d.Nam 
	from DANGKIXEPLICHTHUCHANH d 
	inner join LOPHOCPHAN l on l.Malophocphan = d.Malophocphan 
	inner join GIANGVIEN g on g.Magiangvien = l.Giaoviengiangday
	where g.Magiangvien = @magv 
	and (LOWER(g.HoTenGiangVien) like '%'+@tukhoa+'%'
	or LOWER(d.ID) like '%'+@tukhoa+'%'
	or LOWER(d.Nam) like '%'+@tukhoa+'%')
	order by d.Tuan
end
GO
/****** Object:  StoredProcedure [dbo].[searchGV]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[searchGV]
	@tukhoa nvarchar(50)
as
BEGIN
	set @tukhoa = lower(ltrim(rtrim(@tukhoa)));
	select 
	g.Magiangvien,g.HoTenGiangVien,u.UserName,u.[PassWord] 
	from GIANGVIEN g inner join [User] u on u.UserName = g.UserName
		where LOWER(g.Magiangvien) like '%'+@tukhoa+'%'
		or LOWER(g.HoTenGiangVien) like '%'+@tukhoa+'%'
		order by g.HoTenGiangVien;
END
GO
/****** Object:  StoredProcedure [dbo].[searchLichThucHang]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[searchLichThucHang]
	@tukhoa nvarchar(50),
	@malop nvarchar(50)
as
begin
	set @malop = lower(ltrim(rtrim(@malop)));
	select lp.Lopdanhnghia, lp.Monhoc,l.Tuan, t.Tenthu, ca.Tiethoc, p.Tenphong,p.Diachiphong

	from LICHTHUCHANH l 
	inner join LOPHOCPHAN lp on l.Malophocphan = lp.Malophocphan
	inner join CAHOC c on c.Macahoc = l.Macahoc
	inner join PHONGTHUCHANH p on p.Maphong = l.Maphong
	inner join CATRONGNGAY ca on ca.Maca = c.Maca
	inner join THU t on t.Mathu = c.Mathu
	inner join GIANGVIEN g on g.Magiangvien = lp.Giaoviengiangday
	where g.Magiangvien = @tukhoa and l.Malophocphan = @malop
	end
GO
/****** Object:  StoredProcedure [dbo].[SearchLop]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchLop]
	@tukhoa nvarchar(50)
as
begin
    set @tukhoa = lower(ltrim(rtrim(@tukhoa)));
    select 
	l.Malophocphan,l.Lopdanhnghia,l.Monhoc,g.HoTenGiangVien 
	from LOPHOCPHAN l inner join GIANGVIEN g on g.Magiangvien = l.Giaoviengiangday
	where LOWER(l.Malophocphan) like '%'+@tukhoa+'%'
	or LOWER(l.Monhoc) like '%'+@tukhoa+'%'
	or LOWER(l.Lopdanhnghia) like '%'+@tukhoa+'%'
	or LOWER(l.Giaoviengiangday) like '%'+@tukhoa+'%'
	or LOWER(g.HoTenGiangVien) like '%'+@tukhoa+'%'
	order by g.HoTenGiangVien
end
GO
/****** Object:  StoredProcedure [dbo].[selectlichphongmay]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[selectlichphongmay]
@tuan nvarchar(50),
	@nam nvarchar(50)
as
begin
	select lop.Lopdanhnghia,g.HoTenGiangVien,lop.Monhoc,t.Tenthu,ca.Tiethoc,dbo.fn_GetDateFromWeekdayAndWeekOfYear(c.Mathu, Tuan, Nam) as ngay,p.Tenphong,p.Diachiphong
	from LICHTHUCHANH l 
	inner join CAHOC c on l.Macahoc = c.Macahoc
	inner join CATRONGNGAY ca on c.Maca = ca.Maca
	inner join THU t on t.Mathu = c.Mathu
	inner join LOPHOCPHAN lop on l.Malophocphan = lop.Malophocphan
	inner join PHONGTHUCHANH p on l.Maphong = p.Maphong
	inner join GIANGVIEN g on g.Magiangvien = lop.Giaoviengiangday
	where l.Tuan = @tuan and l.Nam = @nam
end
GO
/****** Object:  StoredProcedure [dbo].[selectLichThucHang]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectLichThucHang]
	@tukhoa nvarchar(50)
	
as
begin
	
	select lp.Lopdanhnghia, lp.Monhoc,l.Tuan, t.Tenthu, ca.Tiethoc, p.Tenphong,p.Diachiphong

	from LICHTHUCHANH l 
	inner join LOPHOCPHAN lp on l.Malophocphan = lp.Malophocphan
	inner join CAHOC c on c.Macahoc = l.Macahoc
	inner join PHONGTHUCHANH p on p.Maphong = l.Maphong
	inner join CATRONGNGAY ca on ca.Maca = c.Maca
	inner join THU t on t.Mathu = c.Mathu
	inner join GIANGVIEN g on g.Magiangvien = lp.Giaoviengiangday
	where g.Magiangvien = @tukhoa
	end
GO
/****** Object:  StoredProcedure [dbo].[selectLichThucHang1]    Script Date: 5/4/2023 9:44:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectLichThucHang1]
	@magv nvarchar(50),
	@nam nvarchar(50)
as
begin 
select lp.Lopdanhnghia, lp.Monhoc,l.Tuan, t.Tenthu, ca.Tiethoc, p.Tenphong,p.Diachiphong

	from LICHTHUCHANH l 
	inner join LOPHOCPHAN lp on l.Malophocphan = lp.Malophocphan
	inner join CAHOC c on c.Macahoc = l.Macahoc
	inner join PHONGTHUCHANH p on p.Maphong = l.Maphong
	inner join CATRONGNGAY ca on ca.Maca = c.Maca
	inner join THU t on t.Mathu = c.Mathu
	inner join GIANGVIEN g on g.Magiangvien = lp.Giaoviengiangday
	where g.Magiangvien = @magv and l.Nam = @nam
	end
GO
