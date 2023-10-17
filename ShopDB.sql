USE [ShopDB]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 2023/10/9 20:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [decimal](8, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[Intro] [text] NULL,
 CONSTRAINT [PK_goods] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseRecords]    Script Date: 2023/10/9 20:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseRecords](
	[UserID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ItemID] [varchar](50) NOT NULL,
	[ActCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PurchaseRecords] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ProductID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2023/10/9 20:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Nickname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([ProductID], [Name], [Price], [Stock], [Intro]) VALUES (1, N'.Net Charts', CAST(99.00 AS Decimal(8, 2)), 10, N'Brings powerful charting capabilities to your .Net applications.')
INSERT [dbo].[Goods] ([ProductID], [Name], [Price], [Stock], [Intro]) VALUES (2, N'.Net Paypal', CAST(69.00 AS Decimal(8, 2)), 100, N'Integrate your .NET apps with PayPal the easy way!')
INSERT [dbo].[Goods] ([ProductID], [Name], [Price], [Stock], [Intro]) VALUES (3, N'.Net ML', CAST(299.00 AS Decimal(8, 2)), 100, N'Supercharged .NET machine learning libraries.')
INSERT [dbo].[Goods] ([ProductID], [Name], [Price], [Stock], [Intro]) VALUES (4, N'.Net Analytics', CAST(299.00 AS Decimal(8, 2)), 100, N'Performs data mining and analytics easily in .NET.')
INSERT [dbo].[Goods] ([ProductID], [Name], [Price], [Stock], [Intro]) VALUES (5, N'.NET Logger', CAST(49.00 AS Decimal(8, 2)), 111, N'Logs and aggregates events easily in your .NET apps.')
INSERT [dbo].[Goods] ([ProductID], [Name], [Price], [Stock], [Intro]) VALUES (6, N'.NET Numerics', CAST(199.00 AS Decimal(8, 2)), 111, N'Powerful numerical methods for your .NET simulations.')
SET IDENTITY_INSERT [dbo].[Goods] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Nickname]) VALUES (1, N'JohnWick', N'123123', N'J.W')
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Nickname]) VALUES (2, N'Matty', N'22222', N'Matt')
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Nickname]) VALUES (3, N'What', N'23333', N'WH')
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Nickname]) VALUES (4, N'wefwr', N'weqweqe', N'ccc')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[PurchaseRecords]  WITH CHECK ADD  CONSTRAINT [FK_Goods_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Goods] ([ProductID])
GO
ALTER TABLE [dbo].[PurchaseRecords] CHECK CONSTRAINT [FK_Goods_ProductID]
GO
ALTER TABLE [dbo].[PurchaseRecords]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[PurchaseRecords] CHECK CONSTRAINT [FK_Users_UserID]
GO
