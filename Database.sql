create database [Personel]
go

USE [Personel]
GO
/****** Object:  Table [dbo].[Departs]    Script Date: 01/19/2017 08:41:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departs](
	[Id] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01/19/2017 08:41:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Fullname] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Users] ([Username], [Password], [Fullname]) VALUES (N'bi', N'321', N'Le Van Bi')
INSERT [dbo].[Users] ([Username], [Password], [Fullname]) VALUES (N'teo', N'123', N'Nguyen Van Teo')
/****** Object:  Table [dbo].[Students]    Script Date: 01/19/2017 08:41:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[masv] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[mark] [float] NULL,
	[major] [nvarchar](50) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[masv] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Students] ON
INSERT [dbo].[Students] ([masv], [name], [mark], [major]) VALUES (1, N'Le Thi Teo', 9, N'WEB')
INSERT [dbo].[Students] ([masv], [name], [mark], [major]) VALUES (2, N'Nguyen Thi Tam', 8.7, N'APP')
INSERT [dbo].[Students] ([masv], [name], [mark], [major]) VALUES (5, N'Phan Van Bi', 7, N'APP')
SET IDENTITY_INSERT [dbo].[Students] OFF
/****** Object:  Table [dbo].[Staffs]    Script Date: 01/19/2017 08:41:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staffs](
	[Id] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Birthday] [date] NOT NULL,
	[Photo] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](25) NOT NULL,
	[Salary] [float] NOT NULL,
	[Notes] [varchar](500) NULL,
	[DepartId] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Records]    Script Date: 01/19/2017 08:41:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Records](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[Reason] [varchar](200) NOT NULL,
	[Date] [date] NOT NULL,
	[StaffId] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK__Records__StaffId__0DAF0CB0]    Script Date: 01/19/2017 08:41:00 ******/
ALTER TABLE [dbo].[Records]  WITH CHECK ADD FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staffs] ([Id])
ON UPDATE CASCADE
GO
/****** Object:  ForeignKey [FK__Staffs__DepartId__08EA5793]    Script Date: 01/19/2017 08:41:00 ******/
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD FOREIGN KEY([DepartId])
REFERENCES [dbo].[Departs] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
