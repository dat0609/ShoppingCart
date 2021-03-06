USE [master]
GO
/****** Object:  Database [BookStore]    Script Date: 12/17/2020 11:51:31 AM ******/
CREATE DATABASE [BookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BookStore.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BookStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BookStore_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BookStore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookStore] SET  MULTI_USER 
GO
ALTER DATABASE [BookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BookStore] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BookStore]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 12/17/2020 11:51:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [nvarchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[product_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/17/2020 11:51:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [nvarchar](50) NULL,
	[totalPrice] [float] NULL,
	[date] [date] NULL CONSTRAINT [DF_Orders_date]  DEFAULT (getdate()),
	[status] [int] NULL,
	[shipping_id] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 12/17/2020 11:51:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[description] [nvarchar](2500) NULL,
	[create_date] [date] NULL CONSTRAINT [DF_product_create_date]  DEFAULT (getdate()),
	[status] [int] NULL,
	[image] [nvarchar](50) NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[role]    Script Date: 12/17/2020 11:51:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [nvarchar](50) NOT NULL,
	[role_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[shipping]    Script Date: 12/17/2020 11:51:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shipping](
	[shipping_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](520) NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](250) NULL,
 CONSTRAINT [PK_shipping] PRIMARY KEY CLUSTERED 
(
	[shipping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/17/2020 11:51:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[role_id] [int] NULL,
	[create_date] [datetime] NULL CONSTRAINT [DF_Users_create_date]  DEFAULT (getdate()),
	[active_code] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[view]    Script Date: 12/17/2020 11:51:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[view](
	[hitcount] [int] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([detail_id], [order_id], [product_id], [price], [quantity], [product_name]) VALUES (1, 1, N'1', 250000, 1, N'Kim Bình Mai')
INSERT [dbo].[order_detail] ([detail_id], [order_id], [product_id], [price], [quantity], [product_name]) VALUES (2, 1, N'2', 260000, 1, N'Kim Bình Mai 2')
INSERT [dbo].[order_detail] ([detail_id], [order_id], [product_id], [price], [quantity], [product_name]) VALUES (3, 1, N'3', 210000, 1, N'Kim Bình Mai 3')
INSERT [dbo].[order_detail] ([detail_id], [order_id], [product_id], [price], [quantity], [product_name]) VALUES (4, 2, N'2', 260000, 1, N'Kim Bình Mai 2')
INSERT [dbo].[order_detail] ([detail_id], [order_id], [product_id], [price], [quantity], [product_name]) VALUES (5, 2, N'1', 250000, 1, N'Kim Bình Mai')
INSERT [dbo].[order_detail] ([detail_id], [order_id], [product_id], [price], [quantity], [product_name]) VALUES (6, 3, N'2', 260000, 2, N'Kim Bình Mai 2')
INSERT [dbo].[order_detail] ([detail_id], [order_id], [product_id], [price], [quantity], [product_name]) VALUES (7, 3, N'3', 210000, 1, N'Kim Bình Mai 3')
INSERT [dbo].[order_detail] ([detail_id], [order_id], [product_id], [price], [quantity], [product_name]) VALUES (8, 4, N'7', 240000, 1, N'Phong Đòn Gánh')
INSERT [dbo].[order_detail] ([detail_id], [order_id], [product_id], [price], [quantity], [product_name]) VALUES (9, 4, N'4', 200000, 1, N'Kim Bình Mai 4')
INSERT [dbo].[order_detail] ([detail_id], [order_id], [product_id], [price], [quantity], [product_name]) VALUES (10, 5, N'2', 260000, 1, N'Kim Bình Mai 2')
INSERT [dbo].[order_detail] ([detail_id], [order_id], [product_id], [price], [quantity], [product_name]) VALUES (11, 5, N'3', 210000, 1, N'Kim Bình Mai 3')
INSERT [dbo].[order_detail] ([detail_id], [order_id], [product_id], [price], [quantity], [product_name]) VALUES (12, 6, N'14', 299999, 2, N'Độc Cô Cửu Kiếm')
INSERT [dbo].[order_detail] ([detail_id], [order_id], [product_id], [price], [quantity], [product_name]) VALUES (13, 6, N'19', 345000, 1, N'Nhục Bồ Đoàn')
INSERT [dbo].[order_detail] ([detail_id], [order_id], [product_id], [price], [quantity], [product_name]) VALUES (14, 7, N'2', 260000, 1, N'Kim Bình Mai 2')
INSERT [dbo].[order_detail] ([detail_id], [order_id], [product_id], [price], [quantity], [product_name]) VALUES (15, 8, N'2', 260000, 1, N'Kim Bình Mai 2')
SET IDENTITY_INSERT [dbo].[order_detail] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [date], [status], [shipping_id]) VALUES (1, N'quan', 720000, CAST(N'2020-12-14' AS Date), 1, 1)
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [date], [status], [shipping_id]) VALUES (2, N'quan', 510000, CAST(N'2020-12-14' AS Date), 1, 2)
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [date], [status], [shipping_id]) VALUES (3, N'quan', 730000, CAST(N'2020-12-14' AS Date), 1, 3)
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [date], [status], [shipping_id]) VALUES (4, N'quan', 440000, CAST(N'2020-12-15' AS Date), 1, 4)
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [date], [status], [shipping_id]) VALUES (5, N'sang', 470000, CAST(N'2020-12-16' AS Date), 1, 5)
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [date], [status], [shipping_id]) VALUES (6, N'tuan', 944998, CAST(N'2020-12-17' AS Date), 1, 6)
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [date], [status], [shipping_id]) VALUES (7, N'tuan', 260000, CAST(N'2020-12-17' AS Date), 1, 7)
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [date], [status], [shipping_id]) VALUES (8, N'tuan', 260000, CAST(N'2020-12-17' AS Date), 1, 8)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (1, N'Kim Bình Mai', 250000, 10, N'Bản năm 1995 do Đài Loan và Hong Kong hợp tác sản xuất bao gồm 6 tập', CAST(N'2020-12-09' AS Date), 1, N'1.gif')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (2, N'Kim Bình Mai 31231', 210000, 15, N'Bản năm 1995 do Đài Loan và Hong Kong hợp tác sản xuất bao gồm 6 tập', CAST(N'2020-12-09' AS Date), 1, N'2.jpg')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (3, N'Kim Bình Mai 3', 210000, 15, N'Bản năm 1995 do Đài Loan và Hong Kong hợp tác sản xuất bao gồm 6 tập', CAST(N'2020-12-09' AS Date), 1, N'1.gif')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (4, N'Kim Bình Mai 4', 200000, 15, N'Bản năm 1995 do Đài Loan và Hong Kong hợp tác sản xuất bao gồm 6 tập', CAST(N'2020-12-09' AS Date), 1, N'3.jpg')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (5, N'Kim Bình Mai 5', 185000, 15, N'Bản năm 1995 do Đài Loan và Hong Kong hợp tác sản xuất bao gồm 6 tập', CAST(N'2020-12-09' AS Date), 1, N'3.jpg')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (6, N'Kim Bình Mai 6', 230000, 15, N'Bản năm 1995 do Đài Loan và Hong Kong hợp tác sản xuất bao gồm 6 tập', CAST(N'2020-12-09' AS Date), 1, N'2.jpg')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (7, N'Phong Đòn Gánh', 240000, 20, N'Là một trong bảy mươi hai tuyệt kỹ của phái Thiếu Lâm, căn bản luyện từ Vi Đà Chưởng mà luyện lên dần, luyện rồi sẽ không bao giờ hết, chưởng lực càng luyện càng mạnh mẽ, chiêu số càng luyện càng tinh thuần, quả đúng là không bờ bến, tinh yếu vô cùng.', CAST(N'2020-12-09' AS Date), 1, N'volam1.jfif')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (8, N'Ngũ Âm Chân Kinh', 450000, 2, N'Võ công thượng thừa trong Hiệp Khách Hành, được khắc trên Đảo Hiệp Khách.', CAST(N'2020-12-10' AS Date), 1, N'volam2.jfif')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (9, N'Thiên Thái Huyền Kinh', 410000, 6, N'Võ công trong Thiên Long Bát Bộ, do Tiêu Dao Tử sáng tạo ra và truyền lại cho Thiên Sơn Đồng Lão, bí kíp có thể giúp cho người luyện Cải Lão Hoàn Đồng.', CAST(N'2020-12-10' AS Date), 1, N'volam3.jfif')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (10, N'Bắc Minh Thần Công', 396000, 7, N'Võ công trong Thiên Long Bát Bộ do tổ sư Tiêu Dao sáng tạo và truyền cho Vô Nhai Tử. Võ công này có thể hút nội lực của kẻ địch và có thể truyền thừa cho đệ tử. Nội lực được lưu giữ từ đời này sang đời khác, đệ tử đời sau mạnh hơn đời trước không giới hạn.', CAST(N'2020-12-10' AS Date), 1, N'volam4.jfif')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (11, N'Cửu Dương Thần Công', 299000, 5, N'Võ công trong Ỷ Thiên Đồ Long Ký, bí kíp rèn luyện nội công thượng thừa, có thể so sánh với Dịch Cân Kinh của Thiếu Lâm.', CAST(N'2020-12-10' AS Date), 1, N'volam5.jfif')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (12, N'Dịch Cân Kinh', 499000, 9, N'Nội công tối thượng do Đạt Ma Sư Tổ sáng tạo. Bộ kinh gồm 12 thức là những bí kíp đề khí và lực đi với nhau.', CAST(N'2020-12-10' AS Date), 1, N'volam6.jfif')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (13, N'Cửu Âm Chân Kinh', 669000, 9, N'Võ công do Hoàng Thường, 1 vị quan chiều Tống sáng tạo ra. Gồm 2 quyển thượng và hạ, quyển thượng bao gồm bí kíp tu luyện nội công, quyển hạ bao gồm những chiêu thức khắc địch chế thắng.', CAST(N'2020-12-10' AS Date), 1, N'volam7.jfif')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (14, N'Độc Cô Cửu Kiếm', 299999, 19, N'Là bí kíp kiếm thuật tối thượng được sáng tạo bởi Độc Cô Cầu Bại. Là kiếm pháp lấy vô chiêu phá hữu chiêu. Tổng quát thức, phá kiếm thức, phá đao thức, phá chưởng thức, phá thương thức, phá tiên thức, phá sách thức, phá tiễn thức, phá khí thức.', CAST(N'2020-12-10' AS Date), 1, N'volam8.jfif')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (15, N'Lục Mạch Thần Kiếm', 361000, 13, N'Xuất hiện trong tiểu thuyết Thiên Long Bát Bộ, là tuyệt kỹ độc môn trấn phái của họ Đoàn Đại Lý.', CAST(N'2020-12-10' AS Date), 1, N'volam9.jfif')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (16, N'Qùy Hoa Bảo Điển', 360000, 10, N'Xuất hiện trong tiểu thuyết Tiếu Ngạo Giang Hồ, là bí kíp làm nên tên tuổi của Đông Phương Bất Bại. Bí kíp gồm 2 quyển thượng và họa, gồm thượng kinh và hạ kinh, 1 âm 1 dương.', CAST(N'2020-12-10' AS Date), 1, N'volam1.jfif')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (17, N'La Hán Phục Ma Thần Công', 299000, 2, N'Là môn nội công tối thượng của phật môn, được cao tăng Thiếu Lâm sáng tạo, nhưng vì quá hung hiểm sợ rơi vào tay kẻ xấu nên ông đã cất nó đi. Là một bộ tướng phật gồm 18 pho tượng, mỗi pho tượng là 1 vị La Hán, trên mình đều vẽ các đường chỉ đen dạy cách vận động chân khí đến huyệt mạch.', CAST(N'2020-12-10' AS Date), 1, N'volam2.jfif')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (18, N'Ám Nhiên Tiêu Hồn Chưởng', 459000, 9, N'Xuất hiện trong tiểu thuyết Thần Điêu Đại Hiệp, là bộ chưởng pháp hộ thân của Dương Quá. Gồm 17 chiêu thức được Dương Quá sáng tạo nên trong thời gian 16 năm chờ đợi Tiểu Long Nữ', CAST(N'2020-12-10' AS Date), 1, N'volam6.jfif')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (19, N'Nhục Bồ Đoàn', 345000, 10, N'Võ công trong Thiên Long Bát Bộ do tổ sư Tiêu Dao sáng tạo và truyền cho Vô Nhai Tử. Võ công này có thể hút nội lực của kẻ địch và có thể truyền thừa cho đệ tử. Nội lực được lưu giữ từ đời này sang đời khác, đệ tử đời sau mạnh hơn đời trước không giới hạn.', CAST(N'2020-12-13' AS Date), 1, N'volam6.jfif')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (20, N'haha', 12312, 12, N'assda', CAST(N'2020-12-14' AS Date), 0, NULL)
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (30, N'Kim Bình Mai 4123', 100000, 25, N'123', CAST(N'2020-12-17' AS Date), 1, N'dacap-1.jfif')
INSERT [dbo].[product] ([product_id], [product_name], [price], [quantity], [description], [create_date], [status], [image]) VALUES (31, N'quocdat', 100000, 25, N'123aa', CAST(N'2020-12-17' AS Date), 1, N'dacap-3jfif.jpg')
SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[shipping] ON 

INSERT [dbo].[shipping] ([shipping_id], [name], [phone], [address]) VALUES (1, N'quocdat', N'12312312', N'Ha loi')
INSERT [dbo].[shipping] ([shipping_id], [name], [phone], [address]) VALUES (2, N'minh', N'03033131', N'a')
INSERT [dbo].[shipping] ([shipping_id], [name], [phone], [address]) VALUES (3, N'minh quan', N'1231231', N'hk')
INSERT [dbo].[shipping] ([shipping_id], [name], [phone], [address]) VALUES (4, N'minh tuan', N'01234566987', N'Ha loi')
INSERT [dbo].[shipping] ([shipping_id], [name], [phone], [address]) VALUES (5, N'dang sang', N'063666666', N'Ha loi')
INSERT [dbo].[shipping] ([shipping_id], [name], [phone], [address]) VALUES (6, N'Do Minh Tuan', N'0123456789', N'Ha loi')
INSERT [dbo].[shipping] ([shipping_id], [name], [phone], [address]) VALUES (7, N'quocdat', N'0868047639', N'asd')
INSERT [dbo].[shipping] ([shipping_id], [name], [phone], [address]) VALUES (8, N'quocdat', N'0868047639', N'12as')
SET IDENTITY_INSERT [dbo].[shipping] OFF
INSERT [dbo].[Users] ([UserId], [name], [address], [email], [role_id], [create_date], [active_code], [phone], [password], [status]) VALUES (N'123aa', N'Qu&#7889;c &#272;&#7841;t', NULL, N'asd@gmail.com', NULL, CAST(N'2020-12-17 09:10:32.127' AS DateTime), N'3Fvnw', N'0123456789', N'1', NULL)
INSERT [dbo].[Users] ([UserId], [name], [address], [email], [role_id], [create_date], [active_code], [phone], [password], [status]) VALUES (N'123as', N'Nhi Tran', NULL, N'haai@gmail.com', NULL, CAST(N'2020-12-17 09:02:15.840' AS DateTime), N'tXpPU', N'1223123122', N'1', NULL)
INSERT [dbo].[Users] ([UserId], [name], [address], [email], [role_id], [create_date], [active_code], [phone], [password], [status]) VALUES (N'a123', N'Nhi Tran', NULL, N'haadi@gmail.com', NULL, CAST(N'2020-12-17 09:12:21.393' AS DateTime), N'oAymA', N'0123456789', N'1', 1)
INSERT [dbo].[Users] ([UserId], [name], [address], [email], [role_id], [create_date], [active_code], [phone], [password], [status]) VALUES (N'asd1231231212', N'quan 123', NULL, N'dat09.dz@g.aasdd', NULL, CAST(N'2020-12-17 09:20:27.630' AS DateTime), N'WNXEu', N'0868047639', N'1', NULL)
INSERT [dbo].[Users] ([UserId], [name], [address], [email], [role_id], [create_date], [active_code], [phone], [password], [status]) VALUES (N'asdasda', N'hong quan 123', NULL, N'dominhtauan23102000@gmail.com', NULL, CAST(N'2020-12-17 09:38:45.023' AS DateTime), N'Rz0Dd', N'0868047639', N'1', NULL)
INSERT [dbo].[Users] ([UserId], [name], [address], [email], [role_id], [create_date], [active_code], [phone], [password], [status]) VALUES (N'dat', N'Quoc Dat', NULL, N'dathaha2000@gmail.com', 1, NULL, NULL, NULL, N'1', 1)
INSERT [dbo].[Users] ([UserId], [name], [address], [email], [role_id], [create_date], [active_code], [phone], [password], [status]) VALUES (N'dat1', N'Dat ', NULL, NULL, 1, CAST(N'2020-12-15 21:01:12.540' AS DateTime), NULL, NULL, N'1', 1)
INSERT [dbo].[Users] ([UserId], [name], [address], [email], [role_id], [create_date], [active_code], [phone], [password], [status]) VALUES (N'datzxcv', N'Nhi Tran', NULL, N'asdasd@gmail.com', NULL, CAST(N'2020-12-08 22:39:34.077' AS DateTime), N'j2NIZ', N'03033131', N'a', NULL)
INSERT [dbo].[Users] ([UserId], [name], [address], [email], [role_id], [create_date], [active_code], [phone], [password], [status]) VALUES (N'quan', N'Hong Quan', N'long thanh', N'datlqse140263@fpt.edu.vn', NULL, CAST(N'2020-12-08 22:39:45.910' AS DateTime), N'z0Za8', N'102221122', N'123', 1)
INSERT [dbo].[Users] ([UserId], [name], [address], [email], [role_id], [create_date], [active_code], [phone], [password], [status]) VALUES (N'quan123', N'hong quan 123', NULL, N'dathaha2000@gmail.com', NULL, CAST(N'2020-12-08 22:40:59.133' AS DateTime), N'vdQkg', N'0868047639', N'd', NULL)
INSERT [dbo].[Users] ([UserId], [name], [address], [email], [role_id], [create_date], [active_code], [phone], [password], [status]) VALUES (N'quan123123', N'quan 123', NULL, N'thanhthuaaan_trng@yahoo.com.vn', NULL, CAST(N'2020-12-17 09:32:46.970' AS DateTime), N'5C10z', N'0868047639', N'1', NULL)
INSERT [dbo].[Users] ([UserId], [name], [address], [email], [role_id], [create_date], [active_code], [phone], [password], [status]) VALUES (N'sang', N'dang sang', NULL, N'sangndxyz@gmail.com', NULL, CAST(N'2020-12-16 07:21:51.657' AS DateTime), N'79R16', N'0614949494', N'1', 1)
INSERT [dbo].[Users] ([UserId], [name], [address], [email], [role_id], [create_date], [active_code], [phone], [password], [status]) VALUES (N'ter', N'minh teo', NULL, N'datlq1se140263@fpt.edu.vn', NULL, CAST(N'2020-12-16 09:26:22.130' AS DateTime), N'uLdQs', N'1223123122', N'1', NULL)
INSERT [dbo].[Users] ([UserId], [name], [address], [email], [role_id], [create_date], [active_code], [phone], [password], [status]) VALUES (N'tuan', N'tuan tuan', NULL, N'dominhtuan23102000@gmail.com', NULL, CAST(N'2020-12-15 20:56:35.970' AS DateTime), N'E8X1k', N'0321313', N'1', 1)
INSERT [dbo].[view] ([hitcount]) VALUES (155)
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([orderId])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_shipping] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[shipping] ([shipping_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_shipping]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
USE [master]
GO
ALTER DATABASE [BookStore] SET  READ_WRITE 
GO
