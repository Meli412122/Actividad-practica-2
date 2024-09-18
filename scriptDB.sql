USE [Facturacion]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 17/9/2024 23:51:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[Id_Articulo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[PrecioUnitario] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 17/9/2024 23:51:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[Id_DetalleFactura] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NULL,
	[IdArticulo] [int] NULL,
	[Cantidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_DetalleFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 17/9/2024 23:51:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[Id_Factura] [int] IDENTITY(1,1) NOT NULL,
	[NumeroFactura] [int] NULL,
	[Fecha] [datetime] NULL,
	[FormaPagoId] [int] NULL,
	[Cliente] [varchar](100) NULL,
	[Cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormaPago]    Script Date: 17/9/2024 23:51:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormaPago](
	[Id_FormaPago] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_FormaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD FOREIGN KEY([IdArticulo])
REFERENCES [dbo].[Articulo] ([Id_Articulo])
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([Id_Factura])
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD FOREIGN KEY([FormaPagoId])
REFERENCES [dbo].[FormaPago] ([Id_FormaPago])
GO
/****** Object:  StoredProcedure [dbo].[ConsultarArticulos]    Script Date: 17/9/2024 23:51:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarArticulos]
	AS
BEGIN
    SELECT * FROM Articulo;  
END

GO
/****** Object:  StoredProcedure [dbo].[ConsultarFacturas]    Script Date: 17/9/2024 23:51:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarFacturas]
	AS
BEGIN
    SELECT * FROM Factura  
END


GO
/****** Object:  StoredProcedure [dbo].[ConsultarFormasPago]    Script Date: 17/9/2024 23:51:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarFormasPago]
AS
BEGIN
    SELECT * FROM FormaPago;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarDetalleFactura]    Script Date: 17/9/2024 23:51:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertarDetalleFactura] 
    @nro_orden INT,
    @id INT, 
    @idArticulo INT, 
    @cantidad INT
AS
BEGIN
    INSERT INTO DetalleFactura(IdFactura, Id_DetalleFactura, IdArticulo, Cantidad)
    VALUES (@nro_orden, @id, @idArticulo, @cantidad);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarFacturaMaster]    Script Date: 17/9/2024 23:51:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarFacturaMaster] 
    @fecha DATE, 
    @cliente VARCHAR(50),
    @nro_factura INT,
    @formaPago INT,
    @cantidad INT,
    @idFactura INT OUTPUT
AS
BEGIN
    INSERT INTO Factura(NumeroFactura, Fecha, Cliente, FormaPagoId, Cantidad)
    VALUES (@nro_factura, @fecha, @cliente, @formaPago, @cantidad);
    SET @idFactura = SCOPE_IDENTITY();
END
GO
