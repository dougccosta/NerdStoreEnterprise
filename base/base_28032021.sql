USE [NerdStoreEnterprise]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/28/2021 10:35:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 3/28/2021 10:35:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/28/2021 10:35:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/28/2021 10:35:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/28/2021 10:35:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/28/2021 10:35:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/28/2021 10:35:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 3/28/2021 10:35:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produtos]    Script Date: 3/28/2021 10:35:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produtos](
	[Id] [uniqueidentifier] NOT NULL,
	[Nome] [varchar](250) NOT NULL,
	[Descricao] [varchar](500) NOT NULL,
	[Ativo] [bit] NOT NULL,
	[Valor] [decimal](18, 2) NOT NULL,
	[DataCadastro] [datetime2](7) NOT NULL,
	[Imagem] [varchar](250) NOT NULL,
	[QuantidadeEstoque] [int] NOT NULL,
 CONSTRAINT [PK_Produtos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210307150530_Initial', N'3.1.3')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210319105942_Initial', N'3.1.3')
GO
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] ON 
GO
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (1, N'a242cc3b-1fec-44cc-9883-7168470857fe', N'Catalogo', N'Ler')
GO
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] OFF
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a242cc3b-1fec-44cc-9883-7168470857fe', N'teste@teste.com', N'TESTE@TESTE.COM', N'teste@teste.com', N'TESTE@TESTE.COM', 1, N'AQAAAAEAACcQAAAAEENYHeF91aqkpLGYDP2PWOjJR6R98S3jKKjLxikfKzT1sxXBLpR5IfjpswOkIisesQ==', N'ZTTQT3DDQU3QRKSGFHCXHMEFST36WDPJ', N'aac0220d-ce80-402c-8eab-e9129ae25c22', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a19c-08eb80a9060b', N'Camiseta Code Life Preta', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(90.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'camiseta2.jpg', 100)
GO
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'78162be3-61c4-4959-89d7-5ebfb476427e', N'Caneca No Coffee No Code', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca4.jpg', 100)
GO
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'6ecaaa6b-ad9f-422c-b3bb-6013ec27b4bb', N'Camiseta Debugar Preta', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(75.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'camiseta4.jpg', 150)
GO
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'6ecaaa6b-ad9f-422c-b3bb-6013ec27c4bb', N'Camiseta Code Life Cinza', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(80.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'camiseta3.jpg', 7)
GO
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'52dd696b-0882-4a73-9525-6af55dd416a4', N'Caneca Star Bugs Coffee', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(20.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca1.jpg', 0)
GO
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'191ddd3e-acd4-4c3b-ae74-8e473993c5da', N'Caneca Programmer Code', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(15.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca2.jpg', 1)
GO
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'fc184e11-014c-4978-aa10-9eb5e1af369b', N'Camiseta Software Developer', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(100.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'camiseta1.jpg', 9)
GO
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'20e08cd4-2402-4e76-a3c9-a026185b193d', N'Caneca Turn Coffee in Code', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(20.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca3.jpg', 0)
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
