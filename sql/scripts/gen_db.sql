USE [master]
GO
/****** Object:  Database [municipalidad]    Script Date: 6/6/2020 12:04:37 ******/
CREATE DATABASE [municipalidad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'municipalidad', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\municipalidad.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'municipalidad_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\municipalidad_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [municipalidad] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [municipalidad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [municipalidad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [municipalidad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [municipalidad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [municipalidad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [municipalidad] SET ARITHABORT OFF 
GO
ALTER DATABASE [municipalidad] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [municipalidad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [municipalidad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [municipalidad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [municipalidad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [municipalidad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [municipalidad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [municipalidad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [municipalidad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [municipalidad] SET  DISABLE_BROKER 
GO
ALTER DATABASE [municipalidad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [municipalidad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [municipalidad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [municipalidad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [municipalidad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [municipalidad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [municipalidad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [municipalidad] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [municipalidad] SET  MULTI_USER 
GO
ALTER DATABASE [municipalidad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [municipalidad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [municipalidad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [municipalidad] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [municipalidad] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [municipalidad] SET QUERY_STORE = OFF
GO
USE [municipalidad]
GO
/****** Object:  Table [dbo].[CC_ConsumoAgua]    Script Date: 6/6/2020 12:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CC_ConsumoAgua](
	[id] [int] NOT NULL,
	[ConsumoM3] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CC_Fijo]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CC_Fijo](
	[id] [int] NOT NULL,
	[MontoFijo] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CC_InteresesMoratorios]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CC_InteresesMoratorios](
	[id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CC_Porcentaje]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CC_Porcentaje](
	[id] [int] NOT NULL,
	[ValorPorcentaje] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCenPropiedad]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCenPropiedad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPropiedad] [int] NOT NULL,
	[idConceptoCobro] [int] NOT NULL,
	[fechaInicio] [date] NOT NULL,
	[fechaFin] [date] NULL,
 CONSTRAINT [PK_CCenPropiedad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComprobanteDePago]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComprobanteDePago](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPropiedad] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[total] [money] NOT NULL,
 CONSTRAINT [PK_ComprobanteDePago] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConceptoCobro]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConceptoCobro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[TasaInteresesMoratorios] [real] NOT NULL,
	[DiaEmisionRecibo] [int] NOT NULL,
	[QDiasVencimiento] [int] NOT NULL,
	[EsRecurrente] [bit] NOT NULL,
	[EsImpuesto] [bit] NOT NULL,
 CONSTRAINT [PK_ConceptoCobro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propiedad]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propiedad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NumFinca] [int] NOT NULL,
	[Valor] [money] NOT NULL,
	[Direccion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Propiedad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropiedadDelPropietario]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropiedadDelPropietario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPropiedad] [int] NOT NULL,
	[idPropietario] [int] NOT NULL,
 CONSTRAINT [PK_PropiedadDelPropietario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propietario]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propietario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTipoDocID] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[valorDocID] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Propietario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropietarioJuridico]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropietarioJuridico](
	[id] [int] NOT NULL,
	[idTipoDocID] [int] NOT NULL,
	[representante] [nvarchar](50) NOT NULL,
	[RepDocID] [nvarchar](100) NOT NULL,
	[TipoDocIdRepresentante] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recibo]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recibo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idComprobantePago] [int] NOT NULL,
	[idPropiedad] [int] NOT NULL,
	[idConceptoCobro] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[fechaVencimiento] [date] NOT NULL,
	[monto] [money] NOT NULL,
	[esPendiente] [bit] NOT NULL,
 CONSTRAINT [PK_Recibo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocID]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocID](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TipoDocID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[passwd] [nvarchar](max) NOT NULL,
	[isAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioVsPropiedad]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioVsPropiedad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPropiedad] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
 CONSTRAINT [PK_UsuarioVsPropiedad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CC_ConsumoAgua]  WITH CHECK ADD  CONSTRAINT [FK_CC_ConsumoAgua_ConceptoCobro] FOREIGN KEY([id])
REFERENCES [dbo].[ConceptoCobro] ([id])
GO
ALTER TABLE [dbo].[CC_ConsumoAgua] CHECK CONSTRAINT [FK_CC_ConsumoAgua_ConceptoCobro]
GO
ALTER TABLE [dbo].[CC_Fijo]  WITH CHECK ADD  CONSTRAINT [FK_CC_Fijo_ConceptoCobro] FOREIGN KEY([id])
REFERENCES [dbo].[ConceptoCobro] ([id])
GO
ALTER TABLE [dbo].[CC_Fijo] CHECK CONSTRAINT [FK_CC_Fijo_ConceptoCobro]
GO
ALTER TABLE [dbo].[CC_InteresesMoratorios]  WITH CHECK ADD  CONSTRAINT [FK_CC_InteresesMoratorios_ConceptoCobro] FOREIGN KEY([id])
REFERENCES [dbo].[ConceptoCobro] ([id])
GO
ALTER TABLE [dbo].[CC_InteresesMoratorios] CHECK CONSTRAINT [FK_CC_InteresesMoratorios_ConceptoCobro]
GO
ALTER TABLE [dbo].[CC_Porcentaje]  WITH CHECK ADD  CONSTRAINT [FK_CC_Porcentaje_ConceptoCobro] FOREIGN KEY([id])
REFERENCES [dbo].[ConceptoCobro] ([id])
GO
ALTER TABLE [dbo].[CC_Porcentaje] CHECK CONSTRAINT [FK_CC_Porcentaje_ConceptoCobro]
GO
ALTER TABLE [dbo].[CCenPropiedad]  WITH CHECK ADD  CONSTRAINT [FK_CCenPropiedad_ConceptoCobro] FOREIGN KEY([idConceptoCobro])
REFERENCES [dbo].[ConceptoCobro] ([id])
GO
ALTER TABLE [dbo].[CCenPropiedad] CHECK CONSTRAINT [FK_CCenPropiedad_ConceptoCobro]
GO
ALTER TABLE [dbo].[CCenPropiedad]  WITH CHECK ADD  CONSTRAINT [FK_CCenPropiedad_Propiedad] FOREIGN KEY([idPropiedad])
REFERENCES [dbo].[Propiedad] ([id])
GO
ALTER TABLE [dbo].[CCenPropiedad] CHECK CONSTRAINT [FK_CCenPropiedad_Propiedad]
GO
ALTER TABLE [dbo].[ComprobanteDePago]  WITH CHECK ADD  CONSTRAINT [FK_ComprobanteDePago_Propiedad] FOREIGN KEY([idPropiedad])
REFERENCES [dbo].[Propiedad] ([id])
GO
ALTER TABLE [dbo].[ComprobanteDePago] CHECK CONSTRAINT [FK_ComprobanteDePago_Propiedad]
GO
ALTER TABLE [dbo].[PropiedadDelPropietario]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadDelPropietario_Propiedad1] FOREIGN KEY([idPropiedad])
REFERENCES [dbo].[Propiedad] ([id])
GO
ALTER TABLE [dbo].[PropiedadDelPropietario] CHECK CONSTRAINT [FK_PropiedadDelPropietario_Propiedad1]
GO
ALTER TABLE [dbo].[PropiedadDelPropietario]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadDelPropietario_Propietario1] FOREIGN KEY([idPropietario])
REFERENCES [dbo].[Propietario] ([id])
GO
ALTER TABLE [dbo].[PropiedadDelPropietario] CHECK CONSTRAINT [FK_PropiedadDelPropietario_Propietario1]
GO
ALTER TABLE [dbo].[Propietario]  WITH CHECK ADD  CONSTRAINT [FK_Propietario_TipoDocID] FOREIGN KEY([idTipoDocID])
REFERENCES [dbo].[TipoDocID] ([id])
GO
ALTER TABLE [dbo].[Propietario] CHECK CONSTRAINT [FK_Propietario_TipoDocID]
GO
ALTER TABLE [dbo].[PropietarioJuridico]  WITH CHECK ADD  CONSTRAINT [FK_PropietarioJuridico_Propietario] FOREIGN KEY([id])
REFERENCES [dbo].[Propietario] ([id])
GO
ALTER TABLE [dbo].[PropietarioJuridico] CHECK CONSTRAINT [FK_PropietarioJuridico_Propietario]
GO
ALTER TABLE [dbo].[PropietarioJuridico]  WITH CHECK ADD  CONSTRAINT [FK_PropietarioJuridico_TipoDocID] FOREIGN KEY([idTipoDocID])
REFERENCES [dbo].[TipoDocID] ([id])
GO
ALTER TABLE [dbo].[PropietarioJuridico] CHECK CONSTRAINT [FK_PropietarioJuridico_TipoDocID]
GO
ALTER TABLE [dbo].[Recibo]  WITH CHECK ADD  CONSTRAINT [FK_Recibo_ComprobanteDePago] FOREIGN KEY([idComprobantePago])
REFERENCES [dbo].[ComprobanteDePago] ([id])
GO
ALTER TABLE [dbo].[Recibo] CHECK CONSTRAINT [FK_Recibo_ComprobanteDePago]
GO
ALTER TABLE [dbo].[Recibo]  WITH CHECK ADD  CONSTRAINT [FK_Recibo_ConceptoCobro] FOREIGN KEY([idConceptoCobro])
REFERENCES [dbo].[ConceptoCobro] ([id])
GO
ALTER TABLE [dbo].[Recibo] CHECK CONSTRAINT [FK_Recibo_ConceptoCobro]
GO
ALTER TABLE [dbo].[Recibo]  WITH CHECK ADD  CONSTRAINT [FK_Recibo_Propiedad] FOREIGN KEY([idPropiedad])
REFERENCES [dbo].[Propiedad] ([id])
GO
ALTER TABLE [dbo].[Recibo] CHECK CONSTRAINT [FK_Recibo_Propiedad]
GO
ALTER TABLE [dbo].[UsuarioVsPropiedad]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioVsPropiedad_Propiedad] FOREIGN KEY([idPropiedad])
REFERENCES [dbo].[Propiedad] ([id])
GO
ALTER TABLE [dbo].[UsuarioVsPropiedad] CHECK CONSTRAINT [FK_UsuarioVsPropiedad_Propiedad]
GO
ALTER TABLE [dbo].[UsuarioVsPropiedad]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioVsPropiedad_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[UsuarioVsPropiedad] CHECK CONSTRAINT [FK_UsuarioVsPropiedad_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[csp_agregarPersonaJuridica]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[csp_agregarPersonaJuridica] @fechaInput DATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @OperacionXML XML

		SELECT @OperacionXML = O
		FROM openrowset(BULK 'C:\xml\Operaciones.xml', single_blob) AS Operacion(O)

		DECLARE @hdoc INT

		EXEC sp_xml_preparedocument @hdoc OUT,
			@OperacionXML

		DECLARE @tmpPersonaJuridica TABLE (
			docidPersonaJuridica NVARCHAR(100),
			TipDocIdPJ INT,
			DocidRepresentante NVARCHAR(100),
			Nombre NVARCHAR(50),
			TipDocIdRepresentante INT,
			fechaxml DATE
			)

		INSERT @tmpPersonaJuridica (
			docidPersonaJuridica,
			TipDocIdPJ,
			DocidRepresentante,
			Nombre,
			TipDocIdRepresentante,
			fechaxml
			)
		SELECT docidPersonaJuridica,
			TipDocIdPJ,
			DocidRepresentante,
			Nombre,
			TipDocIdRepresentante,
			fecha
		FROM openxml(@hdoc, '/Operaciones_por_Dia/OperacionDia/PersonaJuridica', 1) WITH (
				docidPersonaJuridica NVARCHAR(100),
				TipDocIdPJ INT,
				DocidRepresentante NVARCHAR(100),
				Nombre NVARCHAR(50),
				TipDocIdRepresentante INT,
				fecha DATE '../@fecha'
				)
		WHERE @fechaInput = fecha

		EXEC sp_xml_removedocument @hdoc;

		--select * from @tmpPersonaJuridica
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT INTO dbo.PropietarioJuridico (
			id,
			idTipoDocID,
			representante,
			RepDocID,
			TipoDocIdRepresentante
			)
		SELECT P.id,
			tpj.TipDocIdPJ,
			tpj.Nombre,
			tpj.DocidRepresentante,
			tpj.TipDocIdRepresentante
		FROM @tmpPersonaJuridica AS tpj
		JOIN Propietario P ON P.valorDocID = tpj.docidPersonaJuridica

		COMMIT

		RETURN 1
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_agregarPropiedades]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[csp_agregarPropiedades] @fechaInput DATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @OperacionXML XML

		SELECT @OperacionXML = O
		FROM openrowset(BULK 'C:\xml\Operaciones.xml', single_blob) AS Operacion(O)

		DECLARE @hdoc INT

		EXEC sp_xml_preparedocument @hdoc OUT,
			@OperacionXML

		DECLARE @tmpProp TABLE (
			NumFinca INT,
			Valor MONEY,
			Direccion NVARCHAR(max),
			fechaxml DATE
			)

		INSERT @tmpProp (
			NumFinca,
			Valor,
			Direccion,
			fechaxml
			)
		SELECT NumFinca,
			Valor,
			Direccion,
			fecha
		FROM openxml(@hdoc, '/Operaciones_por_Dia/OperacionDia/Propiedad', 1) WITH (
				NumFinca INT,
				Valor MONEY,
				Direccion NVARCHAR(MAX),
				fecha DATE '../@fecha'
				)
		WHERE @fechaInput = fecha

		EXEC sp_xml_removedocument @hdoc;
		--select * from @tmpProp

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT dbo.Propiedad (
			NumFinca,
			Valor,
			Direccion
			)
		SELECT tp.NumFinca,
			tp.Valor,
			tp.Direccion
		FROM @tmpProp tp

		COMMIT

		RETURN 1
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_agregarPropietarios]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[csp_agregarPropietarios] @fechaInput DATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @OperacionXML XML

		SELECT @OperacionXML = O
		FROM openrowset(BULK 'C:\xml\Operaciones.xml', single_blob) AS Operacion(O)

		DECLARE @hdoc INT

		EXEC sp_xml_preparedocument @hdoc OUT,
			@OperacionXML

		DECLARE @tmpPropiet TABLE (
			idTipoDocID INT,
			nombre NVARCHAR(50),
			valorDocID NVARCHAR(100),
			fechaxml DATE
			)

		INSERT @tmpPropiet (
			nombre,
			idTipoDocID,
			valorDocID,
			fechaxml
			)
		SELECT Nombre,
			TipoDocIdentidad,
			identificacion,
			fecha
		FROM openxml(@hdoc, '/Operaciones_por_Dia/OperacionDia/Propietario', 1) WITH (
				Nombre NVARCHAR(50),
				TipoDocIdentidad INT,
				identificacion NVARCHAR(100),
				fecha DATE '../@fecha'
				)
		WHERE @fechaInput = fecha

		EXEC sp_xml_removedocument @hdoc;

		-- SELECT *
		-- FROM @tmpPropiet

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT dbo.Propietario (
			nombre,
			idTipoDocID,
			valorDocID
			)
		SELECT tp.nombre,
			tp.idTipoDocID,
			tp.valorDocID
		FROM @tmpPropiet tp

		COMMIT

		RETURN 1
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_linkPropiedadDelPropietario]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_linkPropiedadDelPropietario] @fechaInput DATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @OperacionXML XML

		SELECT @OperacionXML = O
		FROM openrowset(BULK 'C:\xml\Operaciones.xml', single_blob) AS Operacion(O)

		DECLARE @hdoc INT

		EXEC sp_xml_preparedocument @hdoc OUT,
			@OperacionXML

		DECLARE @tmpProtxProp TABLE (
			NumFinca INT,
			identificacion NVARCHAR(100),
			fechaxml DATE
			)

		INSERT @tmpProtxProp (
			NumFinca,
			identificacion,
			fechaxml
			)
		SELECT NumFinca,
			identificacion,
			fecha
		FROM openxml(@hdoc, '/Operaciones_por_Dia/OperacionDia/PropiedadVersusPropietario', 1) WITH (
				NumFinca INT,
				identificacion NVARCHAR(100),
				fecha DATE '../@fecha'
				)
		WHERE @fechaInput = fecha

		--select * from @tmpProtxProp
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT dbo.PropiedadDelPropietario (
			idPropiedad,
			idPropietario
			)
		SELECT P.id,
			PO.id
		FROM @tmpProtxProp AS pp
		JOIN Propietario P ON P.valorDocID = pp.identificacion
		JOIN Propiedad PO ON PO.NumFinca = pp.NumFinca

		--select * from PropiedadDelPropietario
		COMMIT

		RETURN 1
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spLogin]    Script Date: 6/6/2020 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[spLogin] @usernameInput NVARCHAR(100), @passwordInput NVARCHAR(100)
AS
BEGIN

    DECLARE @isAdmin INT = (SELECT U.isAdmin FROM Usuario U WHERE @usernameInput = U.username AND @passwordInput = U.passwd);
    IF @isAdmin = 1
        RETURN @isAdmin
    ELSE IF @isAdmin = 0
        RETURN 0;
    ELSE
        RETURN -1
END
GO
USE [master]
GO
ALTER DATABASE [municipalidad] SET  READ_WRITE 
GO
