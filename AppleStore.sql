USE [master]
GO
/****** Object:  Database [ShopOnline_Demo]    Script Date: 8/1/2022 12:11:48 PM ******/
CREATE DATABASE [ShopOnline_Demo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopOnline_Demo', FILENAME = N'D:\SQL\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShopOnline_Demo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopOnline_Demo_log', FILENAME = N'D:\SQL\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShopOnline_Demo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopOnline_Demo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopOnline_Demo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopOnline_Demo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopOnline_Demo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopOnline_Demo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopOnline_Demo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopOnline_Demo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopOnline_Demo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopOnline_Demo] SET  MULTI_USER 
GO
ALTER DATABASE [ShopOnline_Demo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopOnline_Demo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopOnline_Demo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopOnline_Demo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopOnline_Demo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopOnline_Demo] SET QUERY_STORE = OFF
GO
USE [ShopOnline_Demo]
Go
/****** Object:  Table [dbo].[BaiViet]    Script Date: 8/1/2022 12:11:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiViet](
	[maBV] [varchar](10) NOT NULL,
	[tenBV] [nvarchar](250) NOT NULL,
	[hinhDD] [varchar](max) NULL,
	[ndTomTat] [nvarchar](2000) NULL,
	[ngayDang] [datetime] NULL,
	[loaiTin] [nvarchar](30) NULL,
	[noiDung] [nvarchar](4000) NULL,
	[taiKhoan] [varchar](20) NOT NULL,
	[daDuyet] [bit] NULL,
	[soLanDoc] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[maBV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CtDonHang]    Script Date: 8/1/2022 12:11:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CtDonHang](
	[soDH] [varchar](10) NOT NULL,
	[maSP] [varchar](10) NOT NULL,
	[soLuong] [int] NULL,
	[giaBan] [bigint] NULL,
	[giamGia] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[soDH] ASC,
	[maSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 8/1/2022 12:11:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[soDH] [varchar](10) NOT NULL,
	[maKH] [varchar](10) NOT NULL,
	[taiKhoan] [varchar](20) NOT NULL,
	[ngayDat] [datetime] NULL,
	[daKichHoat] [bit] NULL,
	[ngayGH] [datetime] NULL,
	[diaChiGH] [nvarchar](250) NULL,
	[ghiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[soDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 8/1/2022 12:11:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[maKH] [varchar](10) NOT NULL,
	[tenKH] [nvarchar](50) NOT NULL,
	[soDT] [varchar](20) NULL,
	[email] [varchar](50) NULL,
	[diaChi] [nvarchar](250) NULL,
	[ngaySinh] [datetime] NULL,
	[gioiTinh] [bit] NULL,
	[ghiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[maKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 8/1/2022 12:11:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[maLoai] [int] IDENTITY(1,1) NOT NULL,
	[tenLoai] [nvarchar](88) NOT NULL,
	[ghiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[maLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 8/1/2022 12:11:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[maSP] [varchar](10) NOT NULL,
	[tenSP] [nvarchar](500) NOT NULL,
	[hinhDD] [varchar](max) NULL,
	[ndTomTat] [nvarchar](2000) NULL,
	[ngayDang] [datetime] NULL,
	[maLoai] [int] NOT NULL,
	[noiDung] [nvarchar](4000) NULL,
	[taiKhoan] [varchar](20) NOT NULL,
	[dvt] [nvarchar](32) NULL,
	[daDuyet] [bit] NULL,
	[giaBan] [int] NULL,
	[giamGia] [int] NULL,
	[nhaSanXuat] [nvarchar](168) NULL,
PRIMARY KEY CLUSTERED 
(
	[maSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 8/1/2022 12:11:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[taiKhoan] [varchar](20) NOT NULL,
	[matKhau] [varchar](20) NOT NULL,
	[hoDem] [nvarchar](50) NULL,
	[tenTV] [nvarchar](30) NOT NULL,
	[ngaysinh] [datetime] NULL,
	[gioiTinh] [bit] NULL,
	[soDT] [nvarchar](20) NULL,
	[email] [nvarchar](50) NULL,
	[diaChi] [nvarchar](250) NULL,
	[trangThai] [bit] NULL,
	[ghiChu] [ntext] NULL,
	[hinhAnh] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[taiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[BaiViet] ([maBV], [tenBV], [hinhDD], [ndTomTat], [ngayDang], [loaiTin], [noiDung], [taiKhoan], [daDuyet], [soLanDoc]) VALUES (N'BV01', N'Smart watch with special features', N'/Materials/images/a11.jpg', N'Apple releases iOS 15.2, iPadOS 15.2, watchOS 8.3, macOS 12.1, and tvOS 15.2 with Communication Safety, Legacy Contacts, and more', CAST(N'2021-10-15T00:00:00.000' AS DateTime), N'17K', N'The Apple Watch Cyber Monday deals are here, and for now they seem pretty similar to those that popped up over Black Friday. We are hoping that there are more bargains to come though, and we will be wading through them to offer you up the best deals the internet has to offer.
			The Apple Watch Cyber Monday deals have been pretty impressive so far, with discounts to be had even on the all-new Apple Watch Series 7 (a very unexpected but pleasant surprise). The biggest issue with Apple Watch Cyber Monday deals is they sell out fast, which is why we are tracking all of them live on this page. ''The Apple Watch Cyber Monday deals are here, and for now they seem pretty similar to those that popped up over Black Friday. We are hoping that there are more bargains to come though, and we will be wading through them to offer you up the best deals the internet has to offer.
			The Apple Watch Cyber Monday deals have been pretty impressive so far, with discounts to be had even on the all-new Apple Watch Series 7 (a very unexpected but pleasant surprise). The biggest issue with Apple Watch Cyber Monday deals is they sell out fast, which is why we are tracking all of them live on this page.
			Below you will find a live feed of all the best deals as they land, plus a round up directly underneath of the top offers and links to the retailers hosting the best Apple Watch Cyber Monday deals. For discounts across the Apple range, head over to our pick of the best Apple Black Friday deals, 
			and be sure to check out our live blog on all the best iPhone Cyber Monday deals. And if you are after another highly sought-after product, that also sells out quickly, see our Nintendo Switch Cyber Monday live blog. For now though, watch this space for the best Apple Watch deals.', N'Admin', 1, 220035)
INSERT [dbo].[BaiViet] ([maBV], [tenBV], [hinhDD], [ndTomTat], [ngayDang], [loaiTin], [noiDung], [taiKhoan], [daDuyet], [soLanDoc]) VALUES (N'BV02', N'The sharp TV screen', N'/Materials/images/a22.jpg', N'Apple TV+ picks up 2022 Golden Globe Award nominations for ‘Swan Song’, ‘Ted Lasso’, ‘CODA’, and more', CAST(N'2021-10-14T00:00:00.000' AS DateTime), N'11K', N'It’s that time of year again. Awards season. Which means it’s right about that time when Apple gets to promote just how well its shows and films are doing on the streaming service Apple TV+. And this year there are quite a few nominations.
			Way back in December of last year, Apple TV+ renewed the thriller series Servant from M. Night Shyamalan (The Visit, The Sixth Sense) for a third season. Now, more than a year later that season is finally about to actually start streaming.', N'Admin', 1, 562366)
INSERT [dbo].[BaiViet] ([maBV], [tenBV], [hinhDD], [ndTomTat], [ngayDang], [loaiTin], [noiDung], [taiKhoan], [daDuyet], [soLanDoc]) VALUES (N'BV03', N'Apple Store in the US', N'/Materials/images/a33.jpg', N'Apple''s Customer Experience Strategy: Turn Stores into “Town Squares”', CAST(N'2021-10-13T00:00:00.000' AS DateTime), N'22K', N'Millions of people venture into Apple stores every month with the intent of playing with some of the slickest and coolest consumer gadgets and computer equipment the tech world has to offer. From the Apple Watch to iPhones to MacBook Pros – the products speak for themselves, and so any visit to a store already holds the promise of an experience.

Over time, of course, the products themselves do change. iPhone 6s become 7s become 8s; iPad 4s become Minis become Pros; Apple Watches become Series 2s become Nike. But if there’s one thing that stays the same, it’s the Apple Store’s secret sauce – an unrivaled commitment to building strong customer relationships.

Indeed, though there are many brands that have tried (and are still trying) to imitate the Apple Store model, most fall woefully short of the mark. And this is because they fail to recognize what the Apple Store is really all about – not its products, but its people.

Apple Store associates are trained to walk customers through five distinct service steps (adapted from The Ritz-Carlton: Steps of Service), which beautifully spells-out the acronym APPLE:

A: Approach customers with a personalized, warm welcome

P: Probe politely to understand the customer’s needs

P: Present a solution for the customer to take home today

L: Listen for and resolve issues or concerns

E: End with a fond farewell and an invitation to return

So simple, yet so effective. And with this guiding base, now that Apple is ushering in a new generation of stores that in themselves are designed to deliver something new and exciting for customers (beyond all those nifty new gadgets on the shelves), the Apple Store customer experience is turning into something that rival retailers can only dream for.', N'Admin', 1, 325466)
INSERT [dbo].[BaiViet] ([maBV], [tenBV], [hinhDD], [ndTomTat], [ngayDang], [loaiTin], [noiDung], [taiKhoan], [daDuyet], [soLanDoc]) VALUES (N'BV04', N'Apple Store in France', N'/Materials/images/f1.jpg', N'Don’t Think of it as a “Store” – Apple Doesn’t', CAST(N'2021-10-12T00:00:00.000' AS DateTime), N'14K', N'It’s that time of year again. Awards season. Which means it’s right about that time when Apple gets to promote just how well its shows and films are doing on the streaming service Apple TV+. And this year there are quite a few nominations.
			Way back in December of last year, Apple TV+ renewed the thriller series Servant from M. Night Shyamalan (The Visit, The Sixth Sense) for a third season. Now, more than a year later that season is finally about to actually start streaming.', N'Admin', 0, 1254666)
INSERT [dbo].[BaiViet] ([maBV], [tenBV], [hinhDD], [ndTomTat], [ngayDang], [loaiTin], [noiDung], [taiKhoan], [daDuyet], [soLanDoc]) VALUES (N'BV05', N'Apple Store in UK', N'/Materials/images/f2.jpg', N'The “Town Square” Customer Experience', CAST(N'2021-10-11T00:00:00.000' AS DateTime), N'17K', N'Last year MacRumors reported that Apple was tweaking its branding for retail stores in quite a significant way – it was removing the word “Store” from the names of its new locations. On its website, “Apple Store, Valley Fair” suddenly became simply “Apple Valley Fair”, as did “Apple The Grove” and “Apple Union Square”.

It’s a move that clearly speaks to the fact that Apple doesn’t want its customers to even think of its locations as merely “stores” – and the only way to do that is to stop them (and Apple employees) from using the word in the first place. It’s the experience that’s being pushed, and that experience is “Apple”.

Today, consumers want more from a location than the simple opportunity to buy something off the shelf. They want experiences – and with the new generation of Apple Stores being more akin to “town squares” than retail outlets, that’s exactly what they get.', N'Admin', 1, 155554)
GO
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201030259', N'8640589408', 2, 16900000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201030259', N'8640589409', 2, 18900000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201030309', N'8640589405', 1, 13590000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201030309', N'Y98HEAD839', 1, 14490000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201030437', N'8640589403', 2, 13590000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201030437', N'8640589409', 1, 18900000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201030437', N'GRRS637WEP', 1, 72000000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201030437', N'Y98HEAD840', 1, 11790000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201030437', N'Y98HEAD848', 2, 5499000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201060155', N'8640589409', 2, 18900000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201060543', N'8640589407', 3, 16000000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201060554', N'8640589403', 1, 13590000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201060554', N'8640589407', 1, 16000000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201060554', N'8640589409', 1, 18900000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201060602', N'8640589407', 2, 16000000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201080103', N'5206554981', 1, 24000000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201080103', N'6121736387', 1, 16990000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201080103', N'8640589405', 1, 13590000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201080103', N'8640589409', 1, 18900000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201080103', N'Y98HEAD817', 1, 7290000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'2201080128', N'8640589409', 1, 18900000, 0)
GO
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [ghiChu]) VALUES (N'2201030259', N'0589025209', N'admin', NULL, NULL, CAST(N'2022-01-05T14:59:47.207' AS DateTime), N'Phan Thiết Bình Thuận Tiến Lợi 123 Võ Văn Kiệt', NULL)
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [ghiChu]) VALUES (N'2201030309', N'0693658209', N'admin', NULL, NULL, CAST(N'2022-01-05T15:09:40.513' AS DateTime), N'Thành phố Phan Thiết', NULL)
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [ghiChu]) VALUES (N'2201030437', N'0123965812', N'admin', NULL, NULL, CAST(N'2022-01-05T16:37:46.083' AS DateTime), N'Võ Văn Kiệt', NULL)
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [ghiChu]) VALUES (N'2201060155', N'0587878765', N'admin', NULL, NULL, CAST(N'2022-01-08T13:55:13.190' AS DateTime), N'Bình Dương', NULL)
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [ghiChu]) VALUES (N'2201060543', N'0123456789', N'admin', NULL, NULL, CAST(N'2022-01-08T17:43:41.487' AS DateTime), N'Thành Phố Hà Nội -123 Phạm Văn Đồng', NULL)
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [ghiChu]) VALUES (N'2201060554', N'0234569874', N'admin', NULL, NULL, CAST(N'2022-01-08T17:54:08.750' AS DateTime), N'Lotte Mark - Tp. Phan Thiết', NULL)
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [ghiChu]) VALUES (N'2201060558', N'0971173501', N'admin', NULL, NULL, CAST(N'2022-01-08T17:58:44.873' AS DateTime), N'Tiến Thành - Gia Lai', NULL)
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [ghiChu]) VALUES (N'2201060602', N'0949422072', N'admin', NULL, NULL, CAST(N'2022-01-08T18:02:44.777' AS DateTime), N'199 Tôn Đức Thắng - Thành Phố Đà Nẵng', NULL)
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [ghiChu]) VALUES (N'2201080103', N'0186344443', N'admin', NULL, NULL, CAST(N'2022-01-10T01:03:15.003' AS DateTime), N'Củ Chi Huyện Thanh Bình ', NULL)
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [ghiChu]) VALUES (N'2201080128', N'0155545698', N'admin', NULL, NULL, CAST(N'2022-01-10T01:28:45.150' AS DateTime), N'Đà Lạt', NULL)
GO
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu]) VALUES (N'0123456789', N'Gia Hưng', N'0123456789', N'giahung1122@gmail.com', N'Thành Phố Hà Nội -123 Phạm Văn Đồng', CAST(N'1998-11-11T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu]) VALUES (N'0123965812', N'Nguyễn Quỳnh Châu', N'0123965812', N'quynhchau1549@gmail.com', N'Võ Văn Kiệt', CAST(N'2002-07-18T00:00:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu]) VALUES (N'0155545698', N'Trần Quan Vinh', N'0155545698', N'khongduoctaoxoa@gmail.com', N'Đà Lạt', CAST(N'1930-11-12T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu]) VALUES (N'0186344443', N'Lê Văn Tâm', N'0186344443', N'Vantam2002@gmail.com', N'Củ Chi Huyện Thanh Bình ', CAST(N'2002-10-15T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu]) VALUES (N'0234569874', N'Huỳnh Đức', N'0234569874', N'Huynhduc@gmail.com', N'Lotte Mark - Tp. Phan Thiết', CAST(N'1999-12-25T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu]) VALUES (N'0587878765', N'Trần Thị Thuỳ Linh', N'0587878765', N'Thuylinh1807@gmail.com', N'Bình Dương', CAST(N'1998-07-18T00:00:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu]) VALUES (N'0589025209', N'Nguyễn Hoàng Vương', N'0589025209', N'hoanvuonq2002@gmail.com', N'Phan Thiết Bình Thuận Tiến Lợi 123 Võ Văn Kiệt', CAST(N'1999-02-07T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu]) VALUES (N'0693658209', N'Nguyễn Ngọc Minh Lý', N'0693658209', N'nghoangvuong2002@gmail.com', N'Thành phố Phan Thiết', CAST(N'2002-02-01T00:00:00.000' AS DateTime), 0, N'Kiểm hàng trước khi nhận')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu]) VALUES (N'0949422072', N'Lê Thị Kim Ngân', N'0949422072', N'Ngan@gmail.com', N'199 Tôn Đức Thắng - Thành Phố Đà Nẵng', CAST(N'2002-07-18T00:00:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu]) VALUES (N'0971173501', N'Võ Lê Phương Uyên', N'0971173501', N'Pu@gmail.com', N'Tiến Thành - Gia Lai', CAST(N'2002-07-24T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[LoaiSP] ON 

INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu]) VALUES (1, N'iPhone', N'Iphone là sản phẩm tuyệt vời')
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu]) VALUES (2, N'Mac', N'')
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu]) VALUES (3, N'Watch', N'')
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu]) VALUES (4, N'iPad', N'')
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu]) VALUES (5, N'AirPods', N'')
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu]) VALUES (6, N'TV', N'')
SET IDENTITY_INSERT [dbo].[LoaiSP] OFF
GO
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'10NOTEP256', N'iPhone 13 Pro i Pro Max 120Hz', N'/Asset/Images/sanPham/iPhone/iPhone13-Promax.jpg', N'iPhone 13 sở hữu hệ thống camera kép xuất sắc nhất từ trước đến nay, bộ vi xử lý Apple A15 nhanh nhất thế giới smartphone cùng thời lượng pin cực khủng, sẵn sàng đồng hành cùng bạn suốt cả ngày.', CAST(N'2021-12-10T15:32:00.483' AS DateTime), 1, N'Điện thoại iPhone 13 Pro Max 128 GB - siêu phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ Apple. Máy có thiết kế không mấy đột phá khi so với người tiền nhiệm, bên trong đây vẫn là một sản phẩm có màn hình siêu đẹp, tần số quét được nâng cấp lên 120 Hz mượt mà, cảm biến camera có kích thước lớn hơn, cùng hiệu năng mạnh mẽ với sức mạnh đến từ Apple A15 Bionic, sẵn sàng cùng bạn chinh phục mọi thử thách.', N'admin', N'Chiếc', 0, 35990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'11MAX64213', N'iPhone 13 Promax 128GB', N'/Asset/Images/sanPham/iPhone/iPhone13-Promax128GB.jpg', N'iPhone 13 sở hữu hệ thống camera kép xuất sắc nhất từ trước đến nay, bộ vi xử lý Apple A15 nhanh nhất thế giới smartphone cùng thời lượng pin cực khủng, sẵn sàng đồng hành cùng bạn suốt cả ngày.', CAST(N'2021-12-10T15:32:00.480' AS DateTime), 1, N'Điện thoại iPhone 13 Pro Max 128 GB - siêu phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ Apple. Máy có thiết kế không mấy đột phá khi so với người tiền nhiệm, bên trong đây vẫn là một sản phẩm có màn hình siêu đẹp, tần số quét được nâng cấp lên 120 Hz mượt mà, cảm biến camera có kích thước lớn hơn, cùng hiệu năng mạnh mẽ với sức mạnh đến từ Apple A15 Bionic, sẵn sàng cùng bạn chinh phục mọi thử thách.', N'admin', N'Chiếc', 0, 37990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1506749851', N'iPhone 13 Promax 256GB', N'/Asset/Images/sanPham/iPhone/iPhone13-Promax256GB.jpg', N'iPhone 13 sở hữu hệ thống camera kép xuất sắc nhất từ trước đến nay, bộ vi xử lý Apple A15 nhanh nhất thế giới smartphone cùng thời lượng pin cực khủng, sẵn sàng đồng hành cùng bạn suốt cả ngày.', CAST(N'2021-12-10T15:32:00.420' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 41990000, 8, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1651954962', N'iPhone 13 Promax 512GB', N'/Asset/Images/sanPham/iPhone/iPhone13-Promax512GB.jpg', N'iPhone 13 sở hữu hệ thống camera kép xuất sắc nhất từ trước đến nay, bộ vi xử lý Apple A15 nhanh nhất thế giới smartphone cùng thời lượng pin cực khủng, sẵn sàng đồng hành cùng bạn suốt cả ngày.', CAST(N'2021-12-10T15:32:00.473' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 47990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1688993802', N'iPhone 13 Promax 1TB', N'/Asset/Images/sanPham/iPhone/iPhone13-Promax1TB.jpg', N'iPhone 13 sở hữu hệ thống camera kép xuất sắc nhất từ trước đến nay, bộ vi xử lý Apple A15 nhanh nhất thế giới smartphone cùng thời lượng pin cực khủng, sẵn sàng đồng hành cùng bạn suốt cả ngày.', CAST(N'2021-12-10T15:32:00.467' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 57990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'2759614408', N'iPhone 12 Promax 128GB', N'/Asset/Images/sanPham/iPhone/iPhone12-Promax128GB.jpg', N'Tủ Giày Gỗ Lắp Ráp 7 Tầng Cao Cấp với thiết kế nhỏ gọn, dễ dàng tháo lắp, đặc biệt có thể xếp lại cất gọn khi không sử dụng đến, tiết kiệm diện tích.
						Khung gỗ  melamine chống nước, có kèm bộ ốc vít để bạn có thể tự lắp ráp và tháo dỡ khi muốn di chuyển
						Kết cấu chắc chắn, bền bỉ, chịu lực tốt. Có thể để được 12 đôi giày dép và thêm ngăn kéo để chứa đồ nhỏ.
						Sản phẩm góp phần tạo nét hiện đại, sinh động cho không gian sống.', CAST(N'2021-12-10T15:32:00.420' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 27500000, 10, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'3356017108', N'iPhone 12 Promax 256GB', N'/Asset/Images/sanPham/iPhone/iPhone12-Promax256GB.jpg', N'Chức năng tập luyện: phối hợp được nhiều bài tập khác nhau, theo từng nhóm cơ cụ thể như tập vai, ép ngực, đạp đùi, kéo xô ngắn, kéo xô dài, tập chân, tay, thắt lưng và các nhóm cơ khác…
					    + Sử dụng ống thép chiu lực: 50 x 70mm độ dày thép 1.5mm, được phun sơn tính điện chống trầy xước
						+ Dây cáp: Có đường kính 5mm, đảm bảo độ chịu lực cao, bền
						+ Ghế ngồi và miếng bọc: Có độ dày trung bình 45mm, đảm bảo độ bền.', CAST(N'2021-12-10T15:32:00.457' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 29990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'4062373305', N'iPhone 12 SE 256GB', N'/Asset/Images/sanPham/iPhone/iPhone12-SE-256GB.jpg', N'Ghế làm chất liệu cao cấp, chắc chắn. Dùng ở văn phong, đi dã ngoại, ở nhà.
						Dễ dàng gấp gọn, Nằm cực sướng, giúp thư giãn lưng sau mỗi ngày làm việc', CAST(N'2021-12-10T15:32:00.417' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 28000000, 10, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'4494738964', N'iPhone 12mini 128GB', N'/Asset/Images/sanPham/iPhone/iPhone12mini-128GB.jpg', N'Thiết kế hiện đại, trẻ trung,tiện dụng,vừa đơn giản, vừa sang trọng. Sản phẩm chắc chắn.  Kích thước :BALO:40X12X30 CM', CAST(N'2021-12-10T15:32:00.470' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 21000000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'5206554981', N'iPhone 12mini Promax', N'/Asset/Images/sanPham/iPhone/iPhone12mini-Promax.jpg', N'Khung nắn có độ cong lý tưởng cho người dùng một cách tự nhiên. Khung nắn có thể chạm tới tối đa các huyệt đạo có trên lưng, đả thông huyệt, tăng cường tuần hoàn máu, làm bệnh mau thuyên giảm.
						Hỗ trợ định hình cột sống về dạng tự nhiên ban đầu mà không cần phải tác động ngoại lực. Hỗ trợ giảm đau một cách tự nhiên tại nhà.', CAST(N'2021-12-10T15:32:00.460' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 24000000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'5746333511', N'iPhone 12mini 64GB', N'/Asset/Images/sanPham/iPhone/iPhone12mini-64GB.png', N'Thiết kế đơn giản nhưng sắc nét, hiện đại, giúp trang trí nhà thêm ấn tượng tiết kiệm diện tích.
						Đa công năng: Sử dụng làm kệ tủ tivi ,kệ trang trí đa năng. 
						+ Kích thước:178x30x36cm. 
						+ Chất Liệu: Gỗ MDF nhập khẩu phủ melamin cao cấp chống xước chống nước tuyệt đối
						+ Màu sắc: Vân gỗ,Trắng hiện đại, nâu', CAST(N'2021-12-10T15:32:00.430' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 18990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'5761552897', N'iPhone 11  64GB', N'/Asset/Images/sanPham/iPhone/iPhone11-64GB.jpg', N'Đồng Hồ Thông Minh AMA Watch S2 thiết bị tầm trung nhưng sở hữu nhiều công nghệ và và tính năng hiện đại. 
					  Một lựa chọn tuyệt vời dành cho những ai đang tìm kiếm 1 chiếc đồng hồ thông minh, với mức giá hợp lý.', CAST(N'2021-12-10T15:32:00.490' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 14990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'6075086733', N'iPhone 11 128GB', N'/Asset/Images/sanPham/iPhone/iPhone11-128GB.jpg', N'Áo thể thao Body Compression Fitme cao cấp chuyên nghiệp dành cho những ai có nhu cầu luyện tập với cường độ cao
						Phù hợp cho các môn thể thao tập gym, bóng rổ, bóng đá, bóng chuyền, giữ nhiệt. 
						Quần chất co dãn cao, fit cơ thể, tôn dáng người', CAST(N'2021-12-10T15:32:00.450' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 15990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'6121736387', N'iPhone 11  256GB', N'/Asset/Images/sanPham/iPhone/iPhone11-256GB.jpg', N'Đế sạc Apple này được chế tác tinh xảo từ nhôm bền, thảm cao su chống trượt ở phía dưới giúp tăng cường hoàn hảo sự ổn định của nó.
					  Đế Sạc Không Dây Đa Chức Năng Cho Apple Watch & Iphone & AirPods US02- Hàng chính hãng', CAST(N'2021-12-10T15:32:00.493' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 16990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'6681948644', N'iPhone 11  Promax 128GB', N'/Asset/Images/sanPham/iPhone/iPhone11-Promax-128GB.jpg', N'Mẫu váy nhẹ nhàng tiểu thư cho các nàng bánh bèo vừa về kho Lê Sang nha!. Mã mới xưởng bên mới thiết kế chào hàng các nàng luôn ạ.
						+ Thiết kế cổ tròn phối nơ, đuôi cá.
						+ Vải đũi xốp trắng mịn dày dặn.', CAST(N'2021-12-10T15:32:00.463' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 18990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'7823080768', N'iPhone 11  Promax 256GB', N'/Asset/Images/sanPham/iPhone/iPhone11-Promax-256GB.jpg', N'Tạ đeo chân cao cấp phiên bản 4.0 - Nâng cao thể lực, giảm mỡ tăng cơ, phát triển chiều cao, sức bật và sức bền
					  Cấu tạo :
						+ Vải : Polyeste siêu bền có khả năng chống nước, khử mùi siêu thoáng và cực kỳ êm chân khi tập luyện.
						+ Thanh tạ : Thép không gỉ mạ crom cao cấp.	
						+ Trọng Lượng : 4 kg, 5 kg, 6 kg, 8 kg... có thể điểu chỉnh được trọng lượng.', CAST(N'2021-12-10T15:32:00.447' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 19990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'8640589401', N'iPhone 11  Promax 512GB', N'/Asset/Images/sanPham/iPhone/iPhone11-Promax-512GB.jpg', N'Tập hít xà đơn hàng ngày sẽ giúp cho bạn có một thân hình cân đối, đẹp, vòng ngực rộng và cơ bắp săn chắn.
						Với việc tập xà đơn sẽ giúp bạn có một đôi tay cứng, chắc, khỏe.
						Tập hít xà đơn hàng ngày cũng sẽ giúp người tập giảm béo bụng một cách nhanh nhất và hiệu quả
						Xà đơn treo tường có thể thay đổi độ dài sao cho phù hợp với từng kích thước vị trí cần lắp đặt.', CAST(N'2021-12-10T15:32:00.453' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 25990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'8640589402', N' iPhone X 64GB  ', N'/Asset/Images/sanPham/iPhone/ipX.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T17:01:22.267' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 9590000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'8640589403', N' iPhone X 256GB  ', N'/Asset/Images/sanPham/iPhone/ipX2.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T17:02:36.670' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 13590000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'8640589404', N' iPhone XS 64GB  ', N'/Asset/Images/sanPham/iPhone/ipsx.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T17:06:41.247' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 12590000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'8640589405', N' iPhone XS 128GB  ', N'/Asset/Images/sanPham/iPhone/ipsx2.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T17:07:05.907' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 13590000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'8640589406', N' iPhone XS 256GB  ', N'/Asset/Images/sanPham/iPhone/ipsx4.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T17:07:41.147' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 15590000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'8640589407', N' iPhone XS Max 128GB  ', N'/Asset/Images/sanPham/iPhone/ipsxmax.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T17:08:28.663' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 16000000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'8640589408', N' iPhone XS Max 256GB  ', N'/Asset/Images/sanPham/iPhone/ipsxmax2.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T17:08:52.363' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 16900000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'8640589409', N' iPhone XS Max 512GB  ', N'/Asset/Images/sanPham/iPhone/ipsxmax3.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T17:09:22.870' AS DateTime), 1, N'', N'admin', N'Chiếc', 0, 18900000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'8709925437', N'Macbook Pro 16 inch 2.3GHz 8-Core I9 1TB SSD', N'/Asset/Images/sanPham/Mac/Mac-3.png', N'Giày da nam GD-08 với phong cách Bụi Bặm giúp bạn trở nên cá tính và ngầu hơn bao giờ hết, chất da tổng hợp cao cấp giúp bạn dùng lâu bên với thời gian
						Giày bốt nam GD-08 thiết kế giữa chất da và lớt vải lỗ thoáng khi nơi thân giày giúp chân bạn được thoáng khi hơn có 2 màu : Đen và Nâu', CAST(N'2021-12-10T15:32:00.480' AS DateTime), 2, N'', N'admin', N'Cái', 0, 55500000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'8868354221', N'Macbook Pro 16 inch 2.4GHz 8-Core I9 32GB 1TB ', N'/Asset/Images/sanPham/Mac/Mac-4.png', N'Mặt bàn sản xuất từ gỗ MDF phủ melamin cao cấp chống xước chống nước bề mặt sáng bóng. Chân bàn sản xuất từ gỗ sồi vân gỗ đều và đẹp.
					  Kích thước: mặt bàn rộng 50cm dài 90cm cao 42cm. Màu sắc: Trắng. Phong cách: Hiện đại', CAST(N'2021-12-10T15:32:00.417' AS DateTime), 2, N'', N'admin', N'Cái', 0, 72000000, 5, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'9024218247', N'Macbook Pro 16 inch 2.6GHz 6-Core I7 512GB', N'/Asset/Images/sanPham/Mac/Mac16Pro.png', N'Máy kết hợp tập luyện vừa chạy bộ, đi bộ vừa có thể tập kéo tay thúc đẩy các hệ cơ bắp chân, bắp tay, đùi, hông, mông, eo, bụng..
						Bàn để chân rộng, tạo thế đứng vững chắc, tay cầm bọc mút dày, tạo sự thoải mái cho người tập', CAST(N'2021-12-10T15:32:00.460' AS DateTime), 2, N'', N'admin', N'Cái', 0, 95000000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'9680372888', N'Macbook Pro 16 inch 2.3GHz 8-Core I9 1TB', N'/Asset/Images/sanPham/Mac/Mac-5.png', N'Kiểu dáng mới, mẫu mã đa dạng. Thể thao cá tính, đi chơi, đi thể dục đều đẹp ạ. Đế cao su, êm chân chống trơn trượt. Size 35 -39', CAST(N'2021-12-10T15:32:00.477' AS DateTime), 2, N'', N'admin', N'Cái', 0, 50900000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'BK105S2VWS', N'Macbook Pro 16 inch 2.4GHz 8-Core I9 64GB', N'/Asset/Images/sanPham/Mac/Mac-6.png', N'Máy Giặt Cửa Trước Inverter Toshiba TW-BK105S2V-WS (9.5kg) - Hàng Chính Hãng sở hữu kiểu thiết kế lồng ngang hiện đại, mang phong cách châu Âu cùng với gam màu trắng tinh tế, 
					  chắc chắn sẽ trở thành nội thất sang trọng cho không gian sống nhà bạn. Tiết kiệm điện năng. Khối lượng giặt: 9.5kg. Loại máy giặt: Cửa trước - lồng ngang. Tiết kiệm điện với công nghệ Inverter.', CAST(N'2021-12-10T15:32:00.437' AS DateTime), 2, N'', N'admin', N'Cái', 0, 39000000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'EHE5224B-A', N'Macbook Pro 16 inch 2.3GHz 8-Core I9 64GB ', N'/Asset/Images/sanPham/Mac/Mac-7.png', N'Làm mát 360 giúp giữ cho thực phẩm của bạn tươi và ngon lâu hơn bằng cách giảm thiểu biến động nhiệt độ. Bằng cách làm mát từng kệ riêng lẻ, nhiệt độ ổn định được duy trì.
					  Bộ lọc TasteLock Crisper với NutriPlus tạo ra một môi trường kín, ẩm để khóa các chất dinh dưỡng lâu hơn, giữ cho trái cây và rau quả của bạn tươi trong bảy ngày.', CAST(N'2021-12-10T15:32:00.443' AS DateTime), 2, N'', N'admin', N'Cái', 0, 62000000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'EWF9025BQ ', N'Macbook Pro 16 inch 2.4GHz 8-Core I9 64GB ', N'/Asset/Images/sanPham/Mac/Macbook_Pro_16_in_85m8-oo.png', N'Máy Giặt Cửa Trước Inverter Electrolux EWF9025BQSA là một chiếc máy giặt cửa trước có thiết kế hiện đại, trẻ trung với chất 
						liệu inox màu bạc tinh tế, sang trọng, cùng thiết kế cửa pha lê trong suốt trang nhã, máy giặt Electrolux sẽ tạo nên điểm nhấn tinh tế cho không gian giặt giũ trong nhà bạn.
						Khối lượng giặt: 9kg. Loại máy giặt: Cửa trước - lồng ngang. Động cơ: Truyền động dây Cua roa. Công nghệ Inverter - Tiết kiệm điện hiệu quả', CAST(N'2021-12-10T15:32:00.433' AS DateTime), 2, N'', N'admin', N'Cái', 0, 57700000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'FS-B3010', N'Macbook Pro 16 inch 2.4GHz 8-Core I9 1TB ', N'/Asset/Images/sanPham/Mac/Macbook_Pro_16_in-2.png', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-10T15:32:00.410' AS DateTime), 2, N'', N'admin', N'Cái', 0, 68000000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'GRRS637WEP', N'Macbook Pro 16 inch 2.4GHz 8-Core I9 2TB ', N'/Asset/Images/sanPham/Mac/MacBook-Pro16-3.jpg', N'Tổng dung tích 493 lít - Lấy nước ngoài tiện lợi - Công nghệ Dual Inverter tiết kiệm điện năng.
						Chế độ kỳ nghỉ tiết kiệm - Điều khiển cảm ứng bên ngoài - Tay cầm nổi kiểu mới tiện dụng
						Luồng khí lạnh đa chiều - Chế độ làm lạnh nhanh (Quick REF.) - Chế độ cấp đông nhanh (Quick FRZ.)', CAST(N'2021-12-10T15:32:00.443' AS DateTime), 2, N'', N'admin', N'Cái', 0, 72000000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'NAFD10AR1B', N'EI MacBook Air', N'/Asset/Images/sanPham/Mac/EI-MacBook-Air.jpg', N'Giặt sạch các vết bẩn cứng đầu dễ dàng với công nghệ giặt Stainmaster, sở hữu công nghệ giặt Stainmaster, 
					  giúp giặt sạch các vér bẩn cứng đầu và tăng cường hiệu quả giặt sạch quần áo tốt hơn.', CAST(N'2021-12-10T15:32:00.440' AS DateTime), 2, N'', N'admin', N'Cái', 0, 64000000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'NAG1306', N'M1 MacBook Air', N'/Asset/Images/sanPham/Mac/M1-MacBook-Air.jpg', N'Bộ 3 nồi inox 4 đáy Nagakawa NAG1306 (16cm, 20cm, 24cm) - Quai mạ vàng - Dùng trên mọi loại bếp - 
					  Hàng Chính Hãng bao gồm 3 nồi với 3 kích thước: 160mm; 200mm; 240mm. Thiết kế thân nồi thẳng cao, đơn giản, 
					  rất đẹp mắt với màu inox sáng bóng, được làm bằng chất liệu inox cao cấp', CAST(N'2021-12-10T15:32:00.410' AS DateTime), 2, N'', N'admin', N'Cái', 0, 41500000, 10, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'NAG1452', N'MacBook Pro 15 inch 2.3GHz 8-Core I8 64GB', N'/Asset/Images/sanPham/Mac/MacBook-Pro15-inch.jpg', N'Hệ thống 2 van xả, khóa nắp tuyệt đối an toàn. Hệ thống doăng an toàn và kín tuyêt đối. 
					  Chất liệu cao cấp inox 304 không gỉ, chống bám bẩn tối ưu, an toàn cho sức khỏe, dễ dàng vệ sinh.
				      Cấu trúc đáy 3 lớp, nấu chín đều, giữ nhiệt lâu, tản nhiệt tốt', CAST(N'2021-12-10T15:32:00.403' AS DateTime), 2, N'', N'admin', N'Cái', 0, 43000000, 5, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'NRF654GTX2', N'MacBookBro 15 Mid 2015', N'/Asset/Images/sanPham/Mac/MacBook-Pro15-Mid2015.jpg', N'Tủ lạnh Panasonic Inverter 642 lít NR-F654GT-X2 với kiểu dáng 6 cửa, mặt gương cùng hệ thống khay kệ làm từ kính 
					  cường lực cứng cáp, không chỉ tô điểm vẻ đẹp đẳng cấp cho gian bếp mà còn giúp bạn thoải mái trong việc sắp xếp thực phẩm. 
					  Bên cạnh đó, tủ lạnh Panasonic 642 lít còn là sự lựa chọn lý tưởng cho gia đình trên 5 người.', CAST(N'2021-12-10T15:32:00.440' AS DateTime), 2, N'', N'admin', N'Cái', 0, 88990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'SHG2303MPH', N'MacBookBro 15 QuadCore', N'/Asset/Images/sanPham/Mac/MacBook-Pro15-QuadCore.jpg', N'Phụ liệu tóc, kem dưỡng da, nước hoa, mỹ phẩm, đồng hồ, trang sức, phụ kiện...tất cả đều được lên kệ vào ngăn cho không gian làm đẹp của chị em trông thật gọn gàng và sang trọng !
						Gương trang điểm cho hình ảnh trung thực và sắc nét đến từng chi tiết, có thể dễ dàng lấy ra khỏi kệ hay xoay gập theo nhiều góc độ để việc trang điểm trở nên vô cùng tiện lợi.', CAST(N'2021-12-10T15:32:00.433' AS DateTime), 2, N'', N'admin', N'Cái', 0, 41990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'SHG2303MRA', N'MacBook Pro 15.4 inch 2.4GHz 8-Core I8 1TB', N'/Asset/Images/sanPham/Mac/MacBook-Pro15.4.jpg', N'Quai nồi Quai inox tán đinh bọc silicon cách nhiệt, Núm cầm Núm inox bọc silicon cách nhiệt, 
					  Vung nồi Vung kính cường lực viền inox, Đáy nồi Đáy từ, sử dụng trên mọi loại bếp', CAST(N'2021-12-10T15:32:00.400' AS DateTime), 2, N'', N'admin', N'Cái', 0, 57990000, 10, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'SHG2303TEF', N'MacBook Pro 15 inch 2.4GHz 8-Core I8 64TB', N'/Asset/Images/sanPham/Mac/MacBook-Pro15-inch2.jpg', N'LỚP PHỦ TITANIUM nonstick Bền chắc với hơn 16,000 lần chà nhám, mang lại khả năng chống dính tuyệt vời và độ bền vượt trội, 
					    có thể sử dụng ít dầu khi nấu ăn. Bên ngoài được phủ sơn chống dính, dễ dàng làm sạch. CÔNG NGHỆ THERMO-SPOT 
						Báo nhiệt thông minh, cho biết nhiệt độ lý tưởng để nấu ăn ngon.', CAST(N'2021-12-10T15:32:00.413' AS DateTime), 2, N'', N'admin', N'Cái', 0, 58990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'SHG2703GA', N'Apple Watch S7', N'/Asset/Images/sanPham/Watch/W-s7.jpg', N'Thân nồi được làm từ chất liệu Anod cao cấp, không biến dạng khi va đập.
						Vung kính cường lực siêu bền. Tay cầm bọc nhựa cách nhiệt, di chuyển an toàn.
						An toàn cho sức khỏe, không làm biến đổi thành phần chất dinh dưỡng của thực phẩm', CAST(N'2021-12-10T15:32:00.407' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 11900000, 8, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'XRN8012121', N'Apple Watch S6', N'/Asset/Images/sanPham/Watch/W-s6.jpg', N'Điện Thoại Xiaomi Redmi Note 8 - Hàng Chính Hãng Không chỉ có 2 hay 3 camera mà với chiếc smartphone mới Xiaomi Redmi Note 8 thì người dùng sẽ có tới 4 camera 
					    để thỏa mãn nhu cầu chụp ảnh của mình.
					    Xiaomi Redmi Note 8 sở hữu cho mình camera chính với độ phân giải khủng "khủng" với "số chấm" lên tới 48 MP.', CAST(N'2021-12-10T15:32:00.487' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 9999000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD802', N'Apple Watch SE', N'/Asset/Images/sanPham/Watch/W-se.jpg', N'Nghe nhạc trong lúc tập luyện thể thao có thể giúp người tập quên đi cảm giác mệt mỏi và gia tăng thời gian tập luyện. 
					  Đồng thời, việc nghe nhạc cũng khiến con người quên đi sự chán nản, lặp đi lặp lại của các bài tập thể dục, từ đó gia tăng 
					  hiệu suất tập thể dục, thể thao. Chính vì vậy chiếc Tai nghe thể thao Bluetooth Y98 đang hot trên thị trường hiện nay chắc 
					  chắn sẽ làm bạn hài lòng.', CAST(N'2021-12-10T15:32:00.490' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 7999000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD803', N'Apple Watch S3', N'/Asset/Images/sanPham/Watch/W-s3.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T14:27:53.650' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 4999000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD804', N'Apple Watch SE GPS 40mm ', N'/Asset/Images/sanPham/Watch/W-se-gps1.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T14:32:19.293' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 7999000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD805', N'Apple Watch SE GPS + Cellular 44mm ', N'/Asset/Images/sanPham/Watch/W-se-gps2.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T14:34:04.080' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 10999000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD806', N'Apple Watch Series 6 GPS 40mm ', N'/Asset/Images/sanPham/Watch/W-series6-gps.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T14:36:02.843' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 9999000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD807', N'Apple Watch Series 6 GPS 44mm ', N'/Asset/Images/sanPham/Watch/W-series6-gps1.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T14:36:43.237' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 13999000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD808', N'Apple Watch Series 3 GPS 38mm  ', N'/Asset/Images/sanPham/Watch/W-s3.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T14:37:59.917' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 4999000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD809', N'Apple Watch SE GPS + Cellular 44mm   ', N'/Asset/Images/sanPham/Watch/W-se-gps2.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T14:39:10.673' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 11999000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD810', N'Apple Watch Series 7 GPS 41mm   ', N'/Asset/Images/sanPham/Watch/W-s7-gps.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T14:41:15.437' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 11999000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD811', N'Apple Watch Series 7 GPS + Cellular 41mm', N'/Asset/Images/sanPham/Watch/W-s7-gps2.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T14:41:48.133' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 14990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD812', N'Apple Watch Series 7 GPS + Cellular 41mm', N'/Asset/Images/sanPham/Watch/W-s7-gps3.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T14:41:56.100' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 20990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD813', N'Apple Watch S3 GPS 38mm - Chính Hãng VN/A', N'/Asset/Images/sanPham/Watch/W-s3-gps.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T14:42:06.550' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 4950000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD814', N'Apple Watch S3 GPS 42mm - Chính Hãng VN/A', N'/Asset/Images/sanPham/Watch/W-s3-gps2.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T14:42:16.697' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 5550000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD815', N'Apple Watch S6 LTE 40mm - New - Viền thép dây thép - Chính hãng', N'/Asset/Images/sanPham/Watch/W-s6-gps1.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T14:42:27.943' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 17950000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD816', N'Apple Watch SE GPS 40mm - Chính hãng VN/A - Sport Band', N'/Asset/Images/sanPham/Watch/W-se-lte.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T14:42:36.013' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 18950000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD817', N'Apple Watch SE GPS 44mm - Chính Hãng VN/A', N'/Asset/Images/sanPham/Watch/W-se-gps1.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T14:42:44.040' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 7290000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD818', N'Apple Watch S6 LTE 44mm - New - Viền thép dây thép - Chính hãng', N'/Asset/Images/sanPham/Watch/W-s6-gps2.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T14:42:52.903' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 1895000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD819', N'Apple Watch SE LTE 44mm - Chính Hãng VN/A', N'/Asset/Images/sanPham/Watch/W-s7-gps2.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T14:43:00.230' AS DateTime), 3, N'', N'admin', N'Chiếc', 0, 9150000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD820', N'iPad Pro M1 12.9 inch WiFi Cellular 512GB (2021)   ', N'/Asset/Images/sanPham/iPad/ipad1.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:29:39.997' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 41990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD821', N'iPad Pro M1 12.9 inch WiFi Cellular 256GB (2021)  ', N'/Asset/Images/sanPham/iPad/ipad2.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:30:55.447' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 39490000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD822', N'iPad Pro M1 12.9 inch WiFi 512GB (2021) ', N'/Asset/Images/sanPham/iPad/ipad3.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:31:40.303' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 37490000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD823', N'iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021)', N'/Asset/Images/sanPham/iPad/ipad4.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:32:29.230' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 35490000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD824', N'iPad Pro M1 11 inch WiFi Cellular 512GB (2021)', N'/Asset/Images/sanPham/iPad/ipad5.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:33:03.077' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 3390000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD825', N'iPad Pro M1 12.9 inch WiFi 256GB (2021)', N'/Asset/Images/sanPham/iPad/ipad6.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:34:23.607' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 33790000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD826', N'iPad Pro M1 12.9 inch WiFi 128GB (2021)', N'/Asset/Images/sanPham/iPad/ipad7.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:34:52.277' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 31490000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD827', N'iPad Pro 12.9 inch Wifi 128GB (2020)', N'/Asset/Images/sanPham/iPad/ipad8.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:36:52.593' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 26790000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD828', N'iPad Air 4 Wifi Cellular 256GB (2020)', N'/Asset/Images/sanPham/iPad/ipad9.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:37:41.733' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 25490000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD829', N'iPad mini 6 WiFi Cellular 256GB', N'/Asset/Images/sanPham/iPad/ipad10.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:38:23.373' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 24490000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD830', N'iPad Pro M1 11 inch WiFi 128GB (2021)', N'/Asset/Images/sanPham/iPad/ipad11.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:38:52.387' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 23790000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD831', N'iPad Air 4 Wifi 256GB', N'/Asset/Images/sanPham/iPad/ipad12.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:39:22.540' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 22290000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD832', N'iPad Air 4 Wifi Cellular 64GB (2020)', N'/Asset/Images/sanPham/iPad/ipad13.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:40:36.177' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 21490000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD833', N'iPad mini 6 WiFi 256GB', N'/Asset/Images/sanPham/iPad/ipad14.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:41:02.070' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 20790000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD834', N'iPad mini 6 WiFi Cellular 64GB', N'/Asset/Images/sanPham/iPad/ipad15.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:42:01.063' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 19790000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD835', N'iPad Air 4 Wifi 64GB (2020)', N'/Asset/Images/sanPham/iPad/ipad16.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:42:56.217' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 17790000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD836', N'iPad mini 6 WiFi 64GB', N'/Asset/Images/sanPham/iPad/ipad17.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:43:27.420' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 15790000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD837', N'iPad mini 7.9 inch 64GB (2019) Wifi Cellular', N'/Asset/Images/sanPham/iPad/ipad18.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:43:50.670' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 15490000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD838', N'iPad 9 WiFi 256GB', N'/Asset/Images/sanPham/iPad/ipad19.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:44:23.550' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 14490000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD839', N'iPad 9 WiFi Cellular 64GB', N'/Asset/Images/sanPham/iPad/ipad20.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:44:48.160' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 14490000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD840', N'iPad Mini 7.9 inch 64GB (2019) Wifi', N'/Asset/Images/sanPham/iPad/ipad21.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:45:25.430' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 11790000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD841', N'iPad 9 WiFi 64GB', N'/Asset/Images/sanPham/iPad/ipad22.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T15:45:59.810' AS DateTime), 4, N'', N'admin', N'Chiếc', 0, 11490000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD842', N'AirPods Pro ', N'/Asset/Images/sanPham/AirPods/Airpods1.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:08:29.730' AS DateTime), 5, N'', N'admin', N'Chiếc', 0, 5490000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD843', N'AirPods 2 Apple MV7N2 ', N'/Asset/Images/sanPham/AirPods/Airpods2.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:09:09.613' AS DateTime), 5, N'', N'admin', N'Chiếc', 0, 3590000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD844', N'AirPods 3 Apple MME73', N'/Asset/Images/sanPham/AirPods/Airpods3.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:09:43.213' AS DateTime), 5, N'', N'admin', N'Chiếc', 0, 4990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD845', N' AirPods Pro ireless Charge Apple MWP22', N'/Asset/Images/sanPham/AirPods/Airpods4.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:10:09.343' AS DateTime), 5, N'', N'admin', N'Chiếc', 0, 5490000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD846', N'AirPods Max Apple MGYH3', N'/Asset/Images/sanPham/AirPods/Airpods5.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:11:13.393' AS DateTime), 5, N'', N'admin', N'Chiếc', 0, 11891000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD847', N'AirPods 2', N'/Asset/Images/sanPham/AirPods/Airpods6.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:11:55.680' AS DateTime), 5, N'', N'admin', N'Chiếc', 0, 4790000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD848', N'AirPods Pro 2021', N'/Asset/Images/sanPham/AirPods/Airpods7.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:13:31.733' AS DateTime), 5, N'', N'admin', N'Chiếc', 0, 5499000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD849', N'Apple AirPods 3 - VN/A', N'/Asset/Images/sanPham/AirPods/Airpods8.png', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:14:20.683' AS DateTime), 5, N'', N'admin', N'Chiếc', 0, 4690000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD850', N'Apple AirPods  2', N'/Asset/Images/sanPham/AirPods/Airpods9.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:14:57.837' AS DateTime), 5, N'', N'admin', N'Chiếc', 0, 3190000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD851', N'AirPods Max Wireless Charge Apple MWP22 ', N'/Asset/Images/sanPham/AirPods/Airpods10.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:15:50.250' AS DateTime), 5, N'', N'admin', N'Chiếc', 0, 6790000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD852', N'AirPods Pro 2021 ', N'/Asset/Images/sanPham/AirPods/Airpods11.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:16:37.387' AS DateTime), 5, N'', N'admin', N'Chiếc', 0, 4990000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD853', N'AirPods 2 2019 ', N'/Asset/Images/sanPham/AirPods/Airpods12.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:23:22.397' AS DateTime), 5, N'', N'admin', N'Chiếc', 0, 5390000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD854', N'Apple TV 2021 64GB 4K  ', N'/Asset/Images/sanPham/TV/TV1.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:43:24.417' AS DateTime), 6, N'', N'admin', N'Chiếc', 0, 5190000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD856', N'Apple TV 4K 32GB Adapter  ', N'/Asset/Images/sanPham/TV/TV2.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:45:15.463' AS DateTime), 6, N'', N'admin', N'Chiếc', 0, 4490000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD857', N'Remote Apple TV 2021  ', N'/Asset/Images/sanPham/TV/TV3.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:45:48.593' AS DateTime), 6, N'', N'admin', N'Chiếc', 0, 1999000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD858', N'Apple TV 2020  ', N'/Asset/Images/sanPham/TV/TV4.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:49:08.953' AS DateTime), 6, N'', N'admin', N'Chiếc', 0, 3999000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD859', N'Apple TV Gen4 64GB  ', N'/Asset/Images/sanPham/TV/TV5.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:50:03.337' AS DateTime), 6, N'', N'admin', N'Chiếc', 0, 5900000, 0, N'Apple Inc')
GO
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD860', N'Tivi Box Apple TV Gen4 32GB  ', N'/Asset/Images/sanPham/TV/TV6.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:51:41.703' AS DateTime), 6, N'', N'admin', N'Chiếc', 0, 6000000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD862', N'Apple TV 4K 32GB  ', N'/Asset/Images/sanPham/TV/TV7.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:53:45.267' AS DateTime), 6, N'', N'admin', N'Chiếc', 0, 4300000, 0, N'Apple Inc')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'Y98HEAD863', N'Apple TV Gen 5 (4K)  ', N'/Asset/Images/sanPham/TV/TV8.jpg', N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
						+ Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
						+ Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít', CAST(N'2021-12-11T16:54:41.750' AS DateTime), 6, N'', N'admin', N'Chiếc', 0, 4450000, 0, N'Apple Inc')
GO
INSERT [dbo].[TaiKhoan] ([taiKhoan], [matKhau], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu], [hinhAnh]) VALUES (N'admin', N'abc', N'Nguyễn Đức', N'trường', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1, N'935694223', N'nqhung@gmail.com', N'472 CMT8, P.11,Q3, TP.HCM', 1, N'', N'/Asset/Images/sanPham/TaiKhoan/Hinh1.jpg')
INSERT [dbo].[TaiKhoan] ([taiKhoan], [matKhau], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu], [hinhAnh]) VALUES (N'hoanvuonq', N'151002', N'Nguyễn Hoàng', N'Vương', CAST(N'2002-10-15T00:00:00.000' AS DateTime), 1, N'0589025209', N'hoanvuonq2002@gmail.com', N'472 CMT8, P.11,Q3, TP.HCM ', 1, N'', N'/Asset/Images/sanPham/TaiKhoan/hv1.jpg')
INSERT [dbo].[TaiKhoan] ([taiKhoan], [matKhau], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu], [hinhAnh]) VALUES (N'minh', N'123', N'Nguyễn Minh', N'Quang', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1, N'935694223', N'minhminh@gmail.com', N'472 CMT8, P.11,Q3, TP.HCM', 1, N'', N'/Asset/Images/sanPham/TaiKhoan/Hinh2.jpg')
GO
ALTER TABLE [dbo].[BaiViet] ADD  DEFAULT ((0)) FOR [daDuyet]
GO
ALTER TABLE [dbo].[BaiViet] ADD  DEFAULT ((0)) FOR [soLanDoc]
GO
ALTER TABLE [dbo].[DonHang] ADD  DEFAULT ((1)) FOR [daKichHoat]
GO
ALTER TABLE [dbo].[KhachHang] ADD  DEFAULT ((1)) FOR [gioiTinh]
GO
ALTER TABLE [dbo].[LoaiSP] ADD  DEFAULT ('') FOR [ghiChu]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ('') FOR [hinhDD]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ('') FOR [ndTomTat]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT (getdate()) FOR [ngayDang]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ('') FOR [noiDung]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT (N'Cái') FOR [dvt]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [daDuyet]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [giaBan]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [giamGia]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ('') FOR [nhaSanXuat]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  DEFAULT ((1)) FOR [gioiTinh]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  DEFAULT ((0)) FOR [trangThai]
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD FOREIGN KEY([taiKhoan])
REFERENCES [dbo].[TaiKhoan] ([taiKhoan])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CtDonHang]  WITH CHECK ADD FOREIGN KEY([maSP])
REFERENCES [dbo].[SanPham] ([maSP])
GO
ALTER TABLE [dbo].[CtDonHang]  WITH CHECK ADD FOREIGN KEY([soDH])
REFERENCES [dbo].[DonHang] ([soDH])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([maKH])
REFERENCES [dbo].[KhachHang] ([maKH])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([taiKhoan])
REFERENCES [dbo].[TaiKhoan] ([taiKhoan])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([maLoai])
REFERENCES [dbo].[LoaiSP] ([maLoai])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([taiKhoan])
REFERENCES [dbo].[TaiKhoan] ([taiKhoan])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([giamGia]>=(0) AND [giamGia]<=(100)))
GO
USE [master]
GO
ALTER DATABASE [ShopOnline_Demo] SET  READ_WRITE 
GO
