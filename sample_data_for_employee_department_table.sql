USE [EmployeeCaseStudy]
GO
/****** Object:  Table [dbo].[dept]    Script Date: 9/1/2019 2:54:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dept](
	[id] [int] NULL,
	[dept_name] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp]    Script Date: 9/1/2019 2:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp](
	[ID] [int] NULL,
	[name] [varchar](25) NULL,
	[manager_id] [int] NULL,
	[dept_id] [int] NULL,
	[Salary] [int] NULL,
	[DOB] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[dept] ([id], [dept_name]) VALUES (1, N'IT')
GO
INSERT [dbo].[dept] ([id], [dept_name]) VALUES (2, N'Admin')
GO
INSERT [dbo].[emp] ([ID], [name], [manager_id], [dept_id], [Salary], [DOB]) VALUES (1, N'emp 1', 0, 1, 6000, CAST(N'1982-08-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[emp] ([ID], [name], [manager_id], [dept_id], [Salary], [DOB]) VALUES (2, N'emp 2', 0, 5, 6000, CAST(N'1982-07-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[emp] ([ID], [name], [manager_id], [dept_id], [Salary], [DOB]) VALUES (3, N'emp 3', 1, 1, 2000, CAST(N'1983-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[emp] ([ID], [name], [manager_id], [dept_id], [Salary], [DOB]) VALUES (3, N'emp 3', 1, 1, 2000, CAST(N'1983-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[emp] ([ID], [name], [manager_id], [dept_id], [Salary], [DOB]) VALUES (13, N'emp 13', 2, 5, 2000, CAST(N'1984-03-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[emp] ([ID], [name], [manager_id], [dept_id], [Salary], [DOB]) VALUES (11, N'emp 11', 2, 1, 2000, CAST(N'1989-07-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[emp] ([ID], [name], [manager_id], [dept_id], [Salary], [DOB]) VALUES (11, N'emp 11', 2, 1, 2000, CAST(N'1989-07-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[emp] ([ID], [name], [manager_id], [dept_id], [Salary], [DOB]) VALUES (9, N'emp 9', 1, 5, 3000, CAST(N'1990-09-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[emp] ([ID], [name], [manager_id], [dept_id], [Salary], [DOB]) VALUES (8, N'emp 8', 3, 1, 3500, CAST(N'1990-05-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[emp] ([ID], [name], [manager_id], [dept_id], [Salary], [DOB]) VALUES (7, N'emp 7', 2, 5, NULL, NULL)
GO
