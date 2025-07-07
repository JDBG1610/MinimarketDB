USE [master]
GO
/****** Object:  Database [ventasEvo]    Script Date: 7/07/2025 13:00:28 ******/
CREATE DATABASE [ventasEvo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ventasEvo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ventasEvo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ventasEvo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ventasEvo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ventasEvo] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ventasEvo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ventasEvo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ventasEvo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ventasEvo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ventasEvo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ventasEvo] SET ARITHABORT OFF 
GO
ALTER DATABASE [ventasEvo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ventasEvo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ventasEvo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ventasEvo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ventasEvo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ventasEvo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ventasEvo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ventasEvo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ventasEvo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ventasEvo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ventasEvo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ventasEvo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ventasEvo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ventasEvo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ventasEvo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ventasEvo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ventasEvo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ventasEvo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ventasEvo] SET  MULTI_USER 
GO
ALTER DATABASE [ventasEvo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ventasEvo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ventasEvo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ventasEvo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ventasEvo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ventasEvo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ventasEvo] SET QUERY_STORE = ON
GO
ALTER DATABASE [ventasEvo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ventasEvo]
GO
/****** Object:  Table [dbo].[caja]    Script Date: 7/07/2025 13:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caja](
	[caja_id] [int] IDENTITY(1,1) NOT NULL,
	[caja_numero] [int] NOT NULL,
	[caja_nombre] [varchar](100) NOT NULL,
	[caja_efectivo] [decimal](30, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[caja_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 7/07/2025 13:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[categoria_id] [int] IDENTITY(1,1) NOT NULL,
	[categoria_nombre] [varchar](50) NOT NULL,
	[categoria_ubicacion] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoria_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 7/07/2025 13:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[cliente_id] [int] IDENTITY(1,1) NOT NULL,
	[cliente_tipo_documento] [varchar](20) NOT NULL,
	[cliente_numero_documento] [varchar](35) NOT NULL,
	[cliente_nombre] [varchar](50) NOT NULL,
	[cliente_apellido] [varchar](50) NOT NULL,
	[cliente_provincia] [varchar](30) NOT NULL,
	[cliente_ciudad] [varchar](30) NOT NULL,
	[cliente_direccion] [varchar](70) NOT NULL,
	[cliente_telefono] [varchar](20) NOT NULL,
	[cliente_email] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cliente_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empresa]    Script Date: 7/07/2025 13:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empresa](
	[empresa_id] [int] IDENTITY(1,1) NOT NULL,
	[empresa_nombre] [varchar](90) NOT NULL,
	[empresa_telefono] [varchar](20) NOT NULL,
	[empresa_email] [varchar](50) NOT NULL,
	[empresa_direccion] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[empresa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 7/07/2025 13:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[producto_id] [int] IDENTITY(1,1) NOT NULL,
	[producto_codigo] [varchar](77) NOT NULL,
	[producto_nombre] [varchar](100) NOT NULL,
	[producto_stock_total] [int] NOT NULL,
	[producto_tipo_unidad] [varchar](20) NOT NULL,
	[producto_precio_compra] [decimal](30, 2) NOT NULL,
	[producto_precio_venta] [decimal](30, 2) NOT NULL,
	[producto_marca] [varchar](35) NOT NULL,
	[producto_modelo] [varchar](35) NOT NULL,
	[producto_estado] [varchar](20) NOT NULL,
	[producto_foto] [varchar](500) NOT NULL,
	[categoria_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[producto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 7/07/2025 13:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[usuario_id] [int] IDENTITY(1,1) NOT NULL,
	[usuario_nombre] [varchar](50) NOT NULL,
	[usuario_apellido] [varchar](50) NOT NULL,
	[usuario_email] [varchar](50) NOT NULL,
	[usuario_usuario] [varchar](30) NOT NULL,
	[usuario_clave] [varchar](535) NOT NULL,
	[usuario_foto] [varchar](200) NOT NULL,
	[caja_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usuario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 7/07/2025 13:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[venta_id] [bigint] IDENTITY(1,1) NOT NULL,
	[venta_codigo] [varchar](200) NOT NULL,
	[venta_fecha] [date] NOT NULL,
	[venta_hora] [varchar](17) NOT NULL,
	[venta_total] [decimal](30, 2) NOT NULL,
	[venta_pagado] [decimal](30, 2) NOT NULL,
	[venta_cambio] [decimal](30, 2) NOT NULL,
	[usuario_id] [int] NOT NULL,
	[cliente_id] [int] NOT NULL,
	[caja_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[venta_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[venta_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
	SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
    [ProveedorID] [int] IDENTITY(1,1) NOT NULL,
      NOT NULL,
      NOT NULL,
      NOT NULL,
      NOT NULL,
PRIMARY KEY CLUSTERED 
(
    [ProveedorID] ASC
)WITH (
    PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta_detalle]    Script Date: 7/07/2025 13:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta_detalle](
	[venta_detalle_id] [int] IDENTITY(1,1) NOT NULL,
	[venta_detalle_cantidad] [int] NOT NULL,
	[venta_detalle_precio_compra] [decimal](30, 2) NOT NULL,
	[venta_detalle_precio_venta] [decimal](30, 2) NOT NULL,
	[venta_detalle_total] [decimal](30, 2) NOT NULL,
	[venta_detalle_descripcion] [varchar](200) NOT NULL,
	[venta_codigo] [varchar](200) NOT NULL,
	[producto_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[venta_detalle_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_producto_categoria] FOREIGN KEY([categoria_id])
REFERENCES [dbo].[categoria] ([categoria_id])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_producto_categoria]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_caja] FOREIGN KEY([caja_id])
REFERENCES [dbo].[caja] ([caja_id])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_caja]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_caja] FOREIGN KEY([caja_id])
REFERENCES [dbo].[caja] ([caja_id])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_caja]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_cliente] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[cliente] ([cliente_id])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_cliente]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_usuario] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuario] ([usuario_id])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_usuario]
GO
ALTER TABLE [dbo].[venta_detalle]  WITH CHECK ADD  CONSTRAINT [FK_venta_detalle_producto] FOREIGN KEY([producto_id])
REFERENCES [dbo].[producto] ([producto_id])
GO
ALTER TABLE [dbo].[venta_detalle] CHECK CONSTRAINT [FK_venta_detalle_producto]
GO
ALTER TABLE [dbo].[venta_detalle]  WITH CHECK ADD  CONSTRAINT [FK_venta_detalle_venta] FOREIGN KEY([venta_codigo])
REFERENCES [dbo].[venta] ([venta_codigo])
GO
ALTER TABLE [dbo].[venta_detalle] CHECK CONSTRAINT [FK_venta_detalle_venta]
GO
/****** Object:  StoredProcedure [dbo].[RegistrarProveedor]    Script Date: 7/07/2025 13:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarProveedor]
    @Nombre NVARCHAR(100),
    @RUC CHAR(11),
    @Direccion NVARCHAR(200),
    @Telefono NVARCHAR(20)
AS
BEGIN
    INSERT INTO Proveedor (Nombre, RUC, Direccion, Telefono)
    VALUES (@Nombre, @RUC, @Direccion, @Telefono)
END
GO
USE [master]
GO
ALTER DATABASE [ventasEvo] SET  READ_WRITE 
GO
