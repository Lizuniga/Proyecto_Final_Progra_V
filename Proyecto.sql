USE [Proyecto]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 6/12/2018 10:23:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulos](
	[Id_Articulo] [numeric](18, 0) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Estado] [varchar](10) NOT NULL,
	[Fecha_Ingreso] [date] NOT NULL,
	[Fecha_Devolucion] [date] NOT NULL,
 CONSTRAINT [PK_Articulos] PRIMARY KEY CLUSTERED 
(
	[Id_Articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 6/12/2018 10:23:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[Id_Evento] [numeric](18, 0) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Fecha_Registro] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Eventos]    Script Date: 6/12/2018 10:23:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eventos](
	[Id_Evento] [numeric](18, 0) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Eventos] PRIMARY KEY CLUSTERED 
(
	[Id_Evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/12/2018 10:23:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id_Rol] [numeric](18, 0) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id_Rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles_Evento]    Script Date: 6/12/2018 10:23:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles_Evento](
	[Id_Rol] [numeric](18, 0) NOT NULL,
	[Id_Evento] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Roles_Evento] PRIMARY KEY CLUSTERED 
(
	[Id_Rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles_Usuarios]    Script Date: 6/12/2018 10:23:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles_Usuarios](
	[Id_Rol] [numeric](18, 0) NOT NULL,
	[Cod_Usuario] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Roles_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id_Rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 6/12/2018 10:23:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Cod_Usuario] [numeric](18, 0) NOT NULL,
	[Promer_Apellido] [varchar](50) NOT NULL,
	[Segundo_Apellido] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Estado] [varchar](2) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Cod_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Roles_Evento]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Evento_Eventos] FOREIGN KEY([Id_Evento])
REFERENCES [dbo].[Eventos] ([Id_Evento])
GO
ALTER TABLE [dbo].[Roles_Evento] CHECK CONSTRAINT [FK_Roles_Evento_Eventos]
GO
ALTER TABLE [dbo].[Roles_Evento]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Evento_Roles] FOREIGN KEY([Id_Rol])
REFERENCES [dbo].[Roles] ([Id_Rol])
GO
ALTER TABLE [dbo].[Roles_Evento] CHECK CONSTRAINT [FK_Roles_Evento_Roles]
GO
ALTER TABLE [dbo].[Roles_Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Usuarios_Roles] FOREIGN KEY([Id_Rol])
REFERENCES [dbo].[Roles] ([Id_Rol])
GO
ALTER TABLE [dbo].[Roles_Usuarios] CHECK CONSTRAINT [FK_Roles_Usuarios_Roles]
GO
ALTER TABLE [dbo].[Roles_Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Usuarios_Usuarios] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuarios] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[Roles_Usuarios] CHECK CONSTRAINT [FK_Roles_Usuarios_Usuarios]
GO
