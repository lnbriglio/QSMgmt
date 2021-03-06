USE [master]
GO
/****** Object:  Database [Agil-Devtil]    Script Date: 2/10/2016 11:59:13 a. m. ******/
CREATE DATABASE [Agil-Devtil]
GO
ALTER DATABASE [Agil-Devtil] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Agil-Devtil].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Agil-Devtil] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Agil-Devtil] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Agil-Devtil] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Agil-Devtil] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Agil-Devtil] SET ARITHABORT OFF 
GO
ALTER DATABASE [Agil-Devtil] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Agil-Devtil] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Agil-Devtil] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Agil-Devtil] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Agil-Devtil] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Agil-Devtil] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Agil-Devtil] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Agil-Devtil] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Agil-Devtil] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Agil-Devtil] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Agil-Devtil] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Agil-Devtil] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Agil-Devtil] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Agil-Devtil] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [Agil-Devtil] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Agil-Devtil] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Agil-Devtil] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Agil-Devtil] SET RECOVERY FULL 
GO
ALTER DATABASE [Agil-Devtil] SET  MULTI_USER 
GO
ALTER DATABASE [Agil-Devtil] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Agil-Devtil] SET DB_CHAINING OFF 
GO
USE [Agil-Devtil]
GO
/****** Object:  Table [dbo].[Approval]    Script Date: 2/10/2016 11:59:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Approval](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Erased] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[BacklogItem]    Script Date: 2/10/2016 11:59:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BacklogItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreationDate] [datetime] NOT NULL,
	[Erased] [bit] NOT NULL DEFAULT ((0)),
	[ProjectId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ChangeRequest]    Script Date: 2/10/2016 11:59:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChangeRequest](
	[Id] [int] NOT NULL,
	[ApprovalId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[ImpactId] [int] NOT NULL,
	[PriorityId] [int] NOT NULL,
	[Applicant] [nvarchar](255) NULL,
	[Area] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ChangeType]    Script Date: 2/10/2016 11:59:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChangeType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Erased] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Company]    Script Date: 2/10/2016 11:59:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Erased] [bit] NOT NULL DEFAULT ((0)),
	[Domain] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Impact]    Script Date: 2/10/2016 11:59:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Impact](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Erased] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Priority]    Script Date: 2/10/2016 11:59:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priority](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Erased] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Project]    Script Date: 2/10/2016 11:59:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Erased] [bit] NOT NULL DEFAULT ((0)),
	[CompanyId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Sprint]    Script Date: 2/10/2016 11:59:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sprint](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Erased] [bit] NOT NULL DEFAULT ((0)),
	[ProjectId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Task]    Script Date: 2/10/2016 11:59:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreationDate] [datetime] NOT NULL,
	[Erased] [bit] NOT NULL DEFAULT ((0)),
	[EstimatedTime] [int] NOT NULL,
	[RemainingTime] [int] NOT NULL,
	[TaskStateId] [int] NOT NULL,
	[SprintId] [int] NULL,
	[BacklogItemId] [int] NOT NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[TaskState]    Script Date: 2/10/2016 11:59:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskState](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Erased] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[TaskUpdate]    Script Date: 2/10/2016 11:59:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskUpdate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[EventDate] [datetime] NOT NULL,
	[Erased] [bit] NOT NULL DEFAULT ((0)),
	[ElapsedTime] [int] NOT NULL,
	[TaskId] [int] NULL,
	[PreviousTaskStateId] [int] NOT NULL,
	[TaskStateId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Team]    Script Date: 2/10/2016 11:59:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Erased] [bit] NOT NULL DEFAULT ((0)),
	[ProjectId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[TeamMember]    Script Date: 2/10/2016 11:59:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMember](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Capacity] [int] NOT NULL DEFAULT ((0)),
	[Erased] [bit] NOT NULL DEFAULT ((0)),
	[UserId] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Test]    Script Date: 2/10/2016 11:59:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[Id] [int] NOT NULL,
	[Steps] [nvarchar](max) NOT NULL,
	[VersionOriginId] [int] NOT NULL,
	[TestOutcomeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[TestOutcome]    Script Date: 2/10/2016 11:59:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestOutcome](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Erased] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[User]    Script Date: 2/10/2016 11:59:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](25) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Erased] [bit] NOT NULL DEFAULT ((0)),
	[CompanyId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[VersionOrigin]    Script Date: 2/10/2016 11:59:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VersionOrigin](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Erased] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
INSERT [dbo].[Approval] ([Id], [Name], [Erased]) VALUES (1, N'Si', 0)
GO
INSERT [dbo].[Approval] ([Id], [Name], [Erased]) VALUES (2, N'No', 0)
GO
SET IDENTITY_INSERT [dbo].[BacklogItem] ON 

GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (1, N'Nueva pantalla de login', N'QUiero una pantalla de log in nueva', CAST(N'2016-05-05 04:07:24.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (2, N'Documentar todo', N'Hay que hacer documentos de desarrollo y testing', CAST(N'2016-05-15 14:41:44.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (3, N'Cambio en los permisos de clientes', N'Se requiere cambiar los permisos que tienen los usuarios para poder acceder a la solapa "Transacciones Bancarias"', CAST(N'2016-05-29 21:20:07.000' AS DateTime), 1, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (4, N'Implementación Nuevo Sistema de Efectivo Mínimo', N'Implementar un sistema actualizado que reemplace al sistema vigente de Efectivo Mínimo, que permita el proceso de información de forma más confiable.
', CAST(N'2016-05-29 22:09:51.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (8, N'Definición Proceso Líneas Productivas', N'Definir un procedimiento formal, comunicar a los responsables e incorporar un sistema para procesar la información del Régimen de Líneas Productivas controlando automáticamente la información del negocio y contaduría, la información generada por auditoria y datos necesarios para realizar el Anexo K.
', CAST(N'2016-05-29 23:06:43.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (9, N'Centralización y Optimización Proceso de generación de presentaciones SisCen ', N'Relevar el proceso de generación de datos en las presentaciones SisCen, para poder resolver las diferencias y consecuentes rechazos en la presentación al organismo de contralor.', CAST(N'2016-06-15 22:13:43.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (10, N'Mapa de trazabilidad de datos', N'Generar un mapa de trazabilidad de datos y un DER para conocer atributos de las bases de datos y entender como se replican los datos entre los dos sistemas. 
', CAST(N'2016-06-15 22:17:14.000' AS DateTime), 1, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (11, N'Revisión de Inconsistencias SisCen y Automatización de Controles', N'Realizar un análisis de integridad detallado sobre las diferencias en la presentación de los distintos SisCen.
', CAST(N'2016-06-15 22:59:51.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (12, N'Revisión de Integridad del DataWarehouse', N'Relevar, optimizar y documentar el proceso de actualización del Data Warehouse de punta a punta, a fin de identificar el input para cada RRII y adecuar el grado de completitud de la información requerido por las normas, definiendo roles y responsabilidades de las áreas intervinientes.
', CAST(N'2016-06-15 23:58:10.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (13, N'Definición de Responsables por Régimen Informativo', N'Definir roles y responsabilidades de los Responsables por Régimen Informativo; comunicar e implementar la asignación de Responsables por Régimen Informativo; y Documentar en un Manual de Procedimiento.
', CAST(N'2016-06-16 00:03:49.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (14, N'Optimización del Proceso de Ajustes Fecha Valor', N'Definir y documentar el proceso de Registración de Ajustes con Fecha Valor, estableciendo controles suficientes para asegurar la veracidad y confiabilidad de la información y estandarizar los movimientos contables a imputar desde las áreas de Préstamos y Contaduría.
', CAST(N'2016-06-16 00:22:32.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (15, N'Ajustes aplicativo SSAS Efectivo Mínimo', N'Automatizar la información de Efectivo Mínimo directamente desde el aplicativo SSAS.
', CAST(N'2016-06-16 00:32:19.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (16, N'Optimización Proceso de Presentación del Anexo K', N'Revisar, optimizar y documentar el proceso de presentación del Anexo K según regulaciones vigentes, optimizando la participación del sector de Créditos  y automatizando la actualización de clientes vinculados.', CAST(N'2016-06-16 00:00:00.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (17, N'Optimización sistema de Pago de Remuneraciones mediante Acreditación en Cuentas Bancarias', N'Redefinir el proceso de generación del Régimen Informativo "Pago de Remuneraciones mediante Acreditación en Cuentas Bancarias" incorporando controles que garanticen la integridad y confiabilidad de la información.', CAST(N'2016-06-16 00:00:00.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (18, N'Implementación nueva herramienta administración y generación del Régimen Informativo ', N'Implementar una herramienta para la administración y generación de la totalidad de los Regímenes Informativos al BCRA, incluyendo el SisCen.  La misma deberá permitir la trazabilidad de la información y el correcto mantenimiento de los Regímenes incluidos (ABM) en el marco de las regulaciones vigentes, para asegurar la integridad, validez, confiabilidad y razonabilidad de la información a presentar ante el organismo de contralor.', CAST(N'2016-06-16 12:58:47.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (19, N'Desarrollo de Software Prevención de Lavado de Dinero', N'Implementar un aplicativo para automatizar la información correspondiente al Régimen Informativo Prevención de Lavado de Dinero, incluyendo la información correspondiente a cheque cancelatorios que actualmente se hace de forma manual.', CAST(N'2016-06-16 13:22:04.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (20, N'Desarrollo de Software Capitales Mínimos', N'Desarrollar o implementar un aplicativo que permita procesar la información necesaria para presentar el Régimen Informativo de Capitales Mínimos, incluyendo la cartera Mi Pyme y minorista.', CAST(N'2016-06-16 13:45:19.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (21, N'Desarrollo de Software PGC', N'Incorporar un nuevo sistema o automatizar la generación de la Posición General de Cambios, para disminuir las tareas manuales y eficientizar el proceso e incorporar al sistema la actualización automática de las cotizaciones.', CAST(N'2016-06-16 13:49:27.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (22, N'ontrol Diferencias Impositivas Tarjetas de Crédito', N'Automatizar el control sobre diferencias impositivas de Tarjetas de Crédito.', CAST(N'2016-06-16 00:00:00.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (23, N'Automatización Controles Fraccionamiento', N'Automatizar el cruce de la información de Fraccionamiento de Riesgo Crediticio.', CAST(N'2016-06-16 00:00:00.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (24, N'Automatización Planilla D', N'Relevar el proceso y automatizar la generación de la información para deudas del exterior y demás conceptos alcanzados que se presentan en "Planilla D".', CAST(N'2016-06-16 00:00:00.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (25, N'Sistema único e integrado de Operaciones', N'Contar con un sistema único de operaciones integrado.
', CAST(N'2016-06-18 13:55:34.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (26, N'Definir procedimiento de acceso, administración y resguardo de información sensible', N'Mejorar la seguridad en los accesos a la información sensible que administra el sistema de pago
', CAST(N'2016-06-18 13:57:23.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (27, N'Incorporar validaciones en la plataforma para ingreso y retiro de dinero', N'Garantizar la identidad del usuario mediante la incorporación de validaciones adicionales en la plataforma', CAST(N'2016-06-18 13:59:35.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (28, N'Automatizar interface con medios de cobro', N'Automatizar la conexión de la plataforma de los medios de cobro para obtener los archivos e incorporar controles lógicos estándares de validación de los mismos, estandarizando el proceso de ingreso de información de los distintos entes externos a nivel regional .
', CAST(N'2016-06-18 14:03:21.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (29, N'Automatizar status de pagos entidades recaudadoras', N'Parametrizar automáticamente el status de pago proveniente de entidades recaudadoras, generando un reporte de seguimiento automático con el fin de realizar los controles correspondientes.
', CAST(N'2016-06-18 14:04:09.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (30, N'Incorporación información adicional “Usuario/Pago sin Identificar”', N'Reducir el número de casos de usuarios/pagos sin identificar obteniendo un campo adicional que permita su identificación 
', CAST(N'2016-06-18 14:05:20.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (31, N'Analizar las configuraciones, requerimientos técnicos e interfaces', N'Analizar las configuraciones, requerimientos técnicos e interfaces.', CAST(N'2016-06-18 14:06:39.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (32, N'Automatizar análisis de fraude Boleto Bradesco', N'Automatizar el análisis de fraude para pagos de Boletos Bradesco y redefinir los roles y responsabilidades involucrados en el proceso
', CAST(N'2016-06-18 14:08:06.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (33, N'Automatizar procesamiento por depósito bancario', N'Obtener información adicional de los pagos por depósitos bancarios con el fin de agilizar el procesamiento de los ingresos por pagos realizados a través de depósitos bancarios.
', CAST(N'2016-06-18 14:10:50.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (34, N'Automatizar control de Tarjetas de Crédito extranjeras', N'Detectar y derivar automáticamente los pagos por Tarjetas de Crédito extranjeras a través de un workflow al Call Center
', CAST(N'2016-06-18 14:11:59.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (35, N'Automatizar Gestión de Chargebacks', N'Automatizar el proceso de recupero de Chargeback eliminando de esta manera las tareas que actualmente se realizan de manera manual y obteniendo así mayor eficiencia en el proceso.
', CAST(N'2016-06-18 14:14:03.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (36, N'Reporte automático comisiones', N'Implementar reporte automático para realizar controles de pricing que contenga un listado de usuarios que mantengan excepciones/ bonificaciones a una fecha determinada, como así también los usuarios que hayan sufrido modificación de la comisión cobrada distinguiendo on y off.
', CAST(N'2016-06-18 14:15:04.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (37, N'Automatización proceso Regalos y Promos ', N'Evaluar la automatización del proceso, estandarizando los input  de Regalos y Promos. ', CAST(N'2016-06-18 14:19:16.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (38, N'Implementar herramienta de conciliación ', N'Estudiar la posibilidad de incorporar una herramienta de conciliación con el fin de reducir riesgos por errores/omisiones , tomando de manera automática los archivos de los medios de cobro y extracto bancario y que permita realizar el seguimiento de partidas pendientes. 
', CAST(N'2016-06-18 14:21:08.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (39, N'Automatizar subida respuestas Bancos/Tarjetas de Crédito Usuario Certificado', N'Evaluar la posibilidad de automatizar la subida de las respuestas obtenidas del Banco y Tarjetas de Crédito de manera que el estado de los pagos se actualice sin intervención manual.
', CAST(N'2016-06-18 14:25:29.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (40, N'Incorporar Santander Río y Pago mis cuentas al sistema de pago', N'Habilitar los medios de pago que actualmente no se encuentran disponibles en el sistema de pago.', CAST(N'2016-06-18 14:26:29.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (41, N'Automatizar y centralizar transferencias y retornos por retiros (Banco único)', N'Implementar una única plataforma regional y evaluar la posibilidad de generar una interfaz automática entre SAP, las entidades financieras y el Site  con el fin de reducir cargas manuales.
', CAST(N'2016-06-19 00:47:16.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (42, N'Automatizar y centralizar transferencias y retornos por retiros (Banco único)', N'Implementar una única plataforma regional y evaluar la posibilidad de generar una interfaz automática entre SAP, las entidades financieras y el Site  con el fin de reducir cargas manuales.
', CAST(N'2016-06-19 00:47:16.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (43, N'Validación del monto y saldo acumulado por retiros ', N'Implementar control automático en la plataforma para retiros de dinero, de manera que verifique y analice las cuentas y operaciones de los usuarios.', CAST(N'2016-06-19 00:49:06.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (44, N'Automatizar análisis fraude de retiros', N'Automatizar el análisis de fraude de retiros donde una vez ejecutadas las validaciones, el estado de la solicitud cambie automáticamente.
', CAST(N'2016-06-19 00:51:22.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (45, N'Implementar herramienta de cashflow', N'Evaluar herramienta para llevar el cashflow del sistema de pago', CAST(N'2016-06-19 00:53:56.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (46, N'Revisión accesos a los sistemas', N'Analizar los perfiles, accesos y permisos actuales de los usuarios con el fin de evaluar si son adecuados y limitar aquellos que excedan sus responsabilidades.
', CAST(N'2016-06-19 00:00:00.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (47, N'Procesamiento online Tarjetas de Crédito', N'Evaluar la factibilidad de estandarizar el procesamiento de Tarjetas de Crédito realizándolo de manera online como en el resto de las subsidiarias.', CAST(N'2016-06-19 00:00:00.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (48, N'Revisar configuración cuenta puente ', N'Revisar la configuración de la cuenta puente, definiendo atributos exclusivos que difieran de una cuenta usuario. Evaluar la funcionalidad actual del administrador que da soporte a las transferencias de manera que la imputación a la cuenta puente se realice de manera automática.
', CAST(N'2016-06-19 00:00:00.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (49, N'Revisar configuración Administrador Usuario Certificado', N'Revisar la configuración del Administrador a fin de minimizar la carga manual.
', CAST(N'2016-06-19 00:00:00.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[BacklogItem] ([Id], [Title], [Description], [CreationDate], [Erased], [ProjectId]) VALUES (50, N'fadfs', N'asdfasd', CAST(N'2016-07-17 00:00:00.000' AS DateTime), 0, 1)
GO
SET IDENTITY_INSERT [dbo].[BacklogItem] OFF
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (1, 2, 1, 2, 3, N'-', N'-')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (2, 1, 1, 1, 4, N'-', N'-')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (3, 2, 1, 3, 3, N'-', N'-')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (4, 1, 3, 1, 1, N'-', N'-')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (8, 1, 2, 3, 4, N'-', N'-')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (9, 1, 1, 4, 3, N'Sofia Boadle', N'SisCen')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (10, 2, 1, 3, 1, N'Jose Garay', N'SisCen')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (12, 2, 2, 2, 2, N'Federico Álvarez', N'Regímenes Informativos')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (13, 2, 2, 2, 1, N'Federico Álvarez', N'Compliance ')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (14, 1, 1, 3, 4, N'Laura Shuman', N'Préstamos y Contaduría')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (18, 1, 2, 1, 1, N'Graciela Durcal', N'DataWarehouse')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (19, 1, 1, 2, 2, N'Omar Garay', N'Prevención de Lavado de Dinero')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (20, 1, 1, 1, 2, N'Javier Corona', N'Capitales Mínimos ')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (21, 2, 2, 2, 3, N'Claudio Casillo', N'Posición General de Cambios')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (25, 1, 1, 1, 2, N'Lucio González', N'TI')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (26, 2, 2, 2, 3, N'Lucas Perez Corti', N'TI')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (27, 1, 3, 1, 1, N'Marcela Calcargno', N'TI')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (28, 1, 2, 3, 4, N'Romina Truncillo', N'TI')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (29, 1, 1, 4, 3, N'Mariel Lubinka', N'TI')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (30, 1, 1, 2, 3, N'Carla Cavalieri', N'Base de datos')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (31, 2, 3, 1, 1, N'Analia Luzuriaga', N'Strategy & Operations')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (32, 2, 1, 4, 4, N'Lucas Perez Corti', N'TI')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (33, 2, 1, 2, 3, N'Lucio González', N'TI')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (34, 1, 2, 3, 2, N'Federico De Marco', N'TI')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (35, 2, 1, 3, 2, N'Federico De Marco', N'TI')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (36, 2, 1, 4, 2, N'Carlos Algarel', N'Strategy & Operations')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (37, 1, 1, 2, 3, N'Lucas Perez Corti', N'Marketing')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (38, 1, 1, 3, 4, N'Fernanda Rachello', N'TI')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (39, 2, 1, 3, 4, N'Fernanda Rachello', N'TI')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (40, 1, 2, 4, 3, N'Lucas Perez Corti', N'TI')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (41, 1, 1, 1, 4, N'Fernanda Rachello', N'TI')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (42, 1, 1, 1, 4, N'Fernanda Rachello', N'TI')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (43, 2, 2, 3, 3, N'Carla Cavalieri', N'TI')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (44, 1, 1, 3, 4, N'Fernanda Rachello', N'TI')
GO
INSERT [dbo].[ChangeRequest] ([Id], [ApprovalId], [ChangeTypeId], [ImpactId], [PriorityId], [Applicant], [Area]) VALUES (45, 2, 3, 3, 3, N'Fernanda Rachello', N'TI')
GO
INSERT [dbo].[ChangeType] ([Id], [Name], [Erased]) VALUES (1, N'Normal', 0)
GO
INSERT [dbo].[ChangeType] ([Id], [Name], [Erased]) VALUES (2, N'Estandar', 0)
GO
INSERT [dbo].[ChangeType] ([Id], [Name], [Erased]) VALUES (3, N'De emergencia', 0)
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

GO
INSERT [dbo].[Company] ([Id], [Name], [Description], [Erased], [Domain]) VALUES (1, N'Demo company', N'A demo dedicated company', 0, N'demo.com')
GO
INSERT [dbo].[Company] ([Id], [Name], [Description], [Erased], [Domain]) VALUES (2, N'LSCA', N'Pagan poco', 0, N'lsca.com')
GO
INSERT [dbo].[Company] ([Id], [Name], [Description], [Erased], [Domain]) VALUES (3, N'Deloitte ', NULL, 0, N'deloitte.com')
GO
INSERT [dbo].[Company] ([Id], [Name], [Description], [Erased], [Domain]) VALUES (4, N'Nec', N'Soluciones tecnologicas', 0, N'nec.com')
GO
INSERT [dbo].[Company] ([Id], [Name], [Description], [Erased], [Domain]) VALUES (5, N'Empresa1', N'Empresa del rubro Bancario.', 0, N'empresa1.com')
GO
INSERT [dbo].[Company] ([Id], [Name], [Description], [Erased], [Domain]) VALUES (6, N'Empresa2', N'Empresa dedicada a la intermediación entre usuarios inscritos a su servicio de compras, ventas, pagos y subastas por Internet.
Los usuarios pueden vender tanto productos nuevos como usados a precio fijo o en la modalidad de subastas. ', 0, N'empresa2.com')
GO
INSERT [dbo].[Company] ([Id], [Name], [Description], [Erased], [Domain]) VALUES (7, N'Empresa3', N'Agencia de viajes online. Cuenta con presencia en 21 países. ', 0, N'empresa3.com')
GO
INSERT [dbo].[Company] ([Id], [Name], [Description], [Erased], [Domain]) VALUES (8, N'Universidad de Moron', N'Entidad educativa', 0, N'unimoron.com')
GO
INSERT [dbo].[Company] ([Id], [Name], [Description], [Erased], [Domain]) VALUES (9, N'ABC', N'ABC', 0, N'empresa9.com')
GO
INSERT [dbo].[Company] ([Id], [Name], [Description], [Erased], [Domain]) VALUES (10, N'XYZ', NULL, 0, N'empresa10.com')
GO
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
INSERT [dbo].[Impact] ([Id], [Name], [Erased]) VALUES (1, N'Riesgo nivel 1', 0)
GO
INSERT [dbo].[Impact] ([Id], [Name], [Erased]) VALUES (2, N'Riesgo nivel 2', 0)
GO
INSERT [dbo].[Impact] ([Id], [Name], [Erased]) VALUES (3, N'Riesgo nivel 3', 0)
GO
INSERT [dbo].[Impact] ([Id], [Name], [Erased]) VALUES (4, N'Riesgo nivel 4', 0)
GO
INSERT [dbo].[Priority] ([Id], [Name], [Erased]) VALUES (1, N'Inmediata', 0)
GO
INSERT [dbo].[Priority] ([Id], [Name], [Erased]) VALUES (2, N'Alta', 0)
GO
INSERT [dbo].[Priority] ([Id], [Name], [Erased]) VALUES (3, N'Media', 0)
GO
INSERT [dbo].[Priority] ([Id], [Name], [Erased]) VALUES (4, N'Baja', 0)
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

GO
INSERT [dbo].[Project] ([Id], [Name], [Description], [Erased], [CompanyId]) VALUES (1, N'Main project', N'Proyecto principal', 0, 1)
GO
INSERT [dbo].[Project] ([Id], [Name], [Description], [Erased], [CompanyId]) VALUES (2, N'Envios Agentes Oficiales', N'Agentes Oficiales', 0, 2)
GO
INSERT [dbo].[Project] ([Id], [Name], [Description], [Erased], [CompanyId]) VALUES (3, N'Proyecto Prueba', N'-', 0, 4)
GO
INSERT [dbo].[Project] ([Id], [Name], [Description], [Erased], [CompanyId]) VALUES (4, N'Compliance TI', N'Re-estructuración del área de Compliance en base a los procesos de Gestión del Cambio y de Validación y Pruebas.', 0, 5)
GO
INSERT [dbo].[Project] ([Id], [Name], [Description], [Erased], [CompanyId]) VALUES (5, N'xyz', N'-', 1, 5)
GO
INSERT [dbo].[Project] ([Id], [Name], [Description], [Erased], [CompanyId]) VALUES (6, N'Oportunidades de Mejora de Implementación de sistemas', N'En este proyecto se plantea un modelo de Madurez Objetivo de un sistema de pago, considerando la situación actual respecto de las mejores prácticas. 

Se presentan las descripciones de las Oportunidades de Mejora Detectadas: identificación de las oportunidades de mejora detectadas a lo largo de cada proceso indicando la situación actual y la iniciativa correspondiente.
', 0, 6)
GO
INSERT [dbo].[Project] ([Id], [Name], [Description], [Erased], [CompanyId]) VALUES (7, N'xyz', NULL, 1, 6)
GO
INSERT [dbo].[Project] ([Id], [Name], [Description], [Erased], [CompanyId]) VALUES (8, N'xyz', NULL, 1, 6)
GO
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
SET IDENTITY_INSERT [dbo].[Sprint] ON 

GO
INSERT [dbo].[Sprint] ([Id], [Name], [StartDate], [EndDate], [Erased], [ProjectId]) VALUES (1, N'Old', CAST(N'2016-05-04 00:00:00.000' AS DateTime), CAST(N'2016-05-04 00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sprint] ([Id], [Name], [StartDate], [EndDate], [Erased], [ProjectId]) VALUES (2, N'Current', CAST(N'2016-05-05 00:00:00.000' AS DateTime), CAST(N'2016-06-05 00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sprint] ([Id], [Name], [StartDate], [EndDate], [Erased], [ProjectId]) VALUES (3, N'Next', CAST(N'2016-06-06 00:00:00.000' AS DateTime), CAST(N'2016-07-05 00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sprint] ([Id], [Name], [StartDate], [EndDate], [Erased], [ProjectId]) VALUES (4, N'Sprint Nº 1', CAST(N'2016-06-13 00:00:00.000' AS DateTime), CAST(N'2016-06-14 00:00:00.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[Sprint] ([Id], [Name], [StartDate], [EndDate], [Erased], [ProjectId]) VALUES (5, N'Sprint Nº 2', CAST(N'2016-05-14 00:00:00.000' AS DateTime), CAST(N'2016-06-15 00:00:00.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[Sprint] ([Id], [Name], [StartDate], [EndDate], [Erased], [ProjectId]) VALUES (6, N'Sprint Nº 3', CAST(N'2016-06-15 00:00:00.000' AS DateTime), CAST(N'2016-06-16 00:00:00.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[Sprint] ([Id], [Name], [StartDate], [EndDate], [Erased], [ProjectId]) VALUES (7, N'Sprint Nº 4', CAST(N'2016-06-16 00:00:00.000' AS DateTime), CAST(N'2016-06-20 00:00:00.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[Sprint] ([Id], [Name], [StartDate], [EndDate], [Erased], [ProjectId]) VALUES (8, N'Sprint A', CAST(N'2016-06-18 00:00:00.000' AS DateTime), CAST(N'2016-06-21 00:00:00.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[Sprint] ([Id], [Name], [StartDate], [EndDate], [Erased], [ProjectId]) VALUES (9, N'Sprint B', CAST(N'2016-06-21 00:00:00.000' AS DateTime), CAST(N'2016-06-23 00:00:00.000' AS DateTime), 0, 6)
GO
INSERT [dbo].[Sprint] ([Id], [Name], [StartDate], [EndDate], [Erased], [ProjectId]) VALUES (10, N'Sprint C', CAST(N'2016-06-23 00:00:00.000' AS DateTime), CAST(N'2016-06-25 00:00:00.000' AS DateTime), 0, 6)
GO
SET IDENTITY_INSERT [dbo].[Sprint] OFF
GO
SET IDENTITY_INSERT [dbo].[Task] ON 

GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (1, N'Analizar pantalla login', N'Analizar la nueva pantalla de login', CAST(N'2016-05-05 04:07:50.000' AS DateTime), 0, 8, 8, 1, 2, 1, NULL)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (2, N'Tarea muy compleja', NULL, CAST(N'2016-05-05 04:10:31.000' AS DateTime), 0, 255, 255, 1, 2, 1, NULL)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (3, N'Relevar y analizar los requerimientos del nuevo sistema', N'-Relevar los requerimientos por parte de los usuarios.
-Relevar el origen de la información con los referentes.
-Documentar y validar los relevamientos con los referentes 
-Consensuar definiciones con Desarrollo de Sistemas.
-Indagar sobre las herramientas tecnológicas disponibles para realizar el desarrollo propio del sistema, como así también para adquirir un software de terceros.
', CAST(N'2016-05-29 22:13:48.000' AS DateTime), 0, 100, 100, 1, 4, 4, 6)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (4, N'Definir si el desarrollo será interno o de terceros', N'Desarrollo Interno:
- Evaluar si los recursos disponibles son suficientes y adecuados.
- Evaluar esfuerzo y costos.

Desarrollo de Terceros: 
- Evaluar la oferta de sistemas de industria disponibles en el mercado:
- Preparar modelo de “request for proposal” (RFP) en base a lo definido en el análisis y diseño del sistema.
- Definir pautas y criterios de evaluación.
- Investigar los proveedores de sistemas que se estima cumplen con los requerimientos. 
- Contactarse y solicitar el RFP a los proveedores.
- Realizar visitas, demos y prototipos.
- Evaluar ofertas técnicas y económicas.
- Realizar matriz comparativa entre las soluciones de mercado.
', CAST(N'2016-05-29 22:15:31.000' AS DateTime), 0, 30, 0, 3, 5, 4, 7)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (5, N'Definir equipos de trabajo y asignar líder del proyecto, objetivos, tiempos y recursos. ', NULL, CAST(N'2016-05-29 22:17:14.000' AS DateTime), 0, 20, 14, 2, 4, 4, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (6, N'Graficar el mapa de aplicaciones y las interrelaciones entre los sistemas existentes y el nuevo.', NULL, CAST(N'2016-05-29 22:18:31.000' AS DateTime), 0, 10, 8, 2, 6, 4, 9)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (7, N'Prever la infraestructura requerida y prepararla ', N'Hardware, comunicaciones, redes, bases de datos, software de base, aplicación de actualizaciones, etc.
', CAST(N'2016-05-29 22:19:07.000' AS DateTime), 0, 20, 0, 3, 6, 4, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (8, N'Definir un cronograma de implementación', N'Definir un cronograma de implementación, que incluya reuniones de medición parcial de avance y seguimiento de inconvenientes.
', CAST(N'2016-05-29 22:20:02.000' AS DateTime), 0, 15, 15, 1, 6, 4, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (9, N'Relevar y consensuar temas puntuales del proceso con las áreas involucradas.', NULL, CAST(N'2016-05-29 22:27:12.000' AS DateTime), 0, 5, 3, 1, 6, 4, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (10, N'Planificar la implementación ', N'Desarrollo Interno:
- Desarrollo del sistema con la tecnología seleccionada aplicando metodología de desarrollo. 
- Administrar el versionado del sistema aplicando adecuadas metodologías de ciclo de vida del software.

Desarrollo de Terceros:
- Realizar la negociación con el proveedor elegido y el contrato.
- Coordinar con el proveedor la implementación.
', CAST(N'2016-05-29 22:50:38.000' AS DateTime), 0, 20, 16, 1, 6, 4, 9)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (11, N'Implementar el sistema en el ambiente de desarrollo, documentando todos los pasos.', NULL, CAST(N'2016-05-29 22:52:05.000' AS DateTime), 0, 100, 80, 1, 7, 4, 6)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (12, N'Diseñar, ejecutar  y documentar un programa de pruebas internas y con usuarios ', NULL, CAST(N'2016-05-29 22:52:50.000' AS DateTime), 0, 40, 23, 2, 7, 4, 7)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (13, N'Analizar y documentar los resultados del pasaje a producción. ', NULL, CAST(N'2016-05-29 22:54:31.000' AS DateTime), 0, 15, 0, 3, 7, 4, 9)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (14, N'Analizar y documentar los resultados de la migración y conversión de datos, si aplicase.', NULL, CAST(N'2016-05-29 22:54:58.000' AS DateTime), 0, 15, 0, 3, 7, 4, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (15, N'Implementar en ambiente de producción, documentando lo realizado.', NULL, CAST(N'2016-05-29 22:55:30.000' AS DateTime), 0, 20, 20, 1, 7, 4, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (16, N'Organizar reuniones', N'Organizar reuniones con los referentes del DataWarehouse y del Sistema ID, para comprender en detalle, como funciona dicho sistema y como almacenan información.', CAST(N'2016-06-15 22:16:13.000' AS DateTime), 0, 10, 10, 1, 4, 9, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (17, N'Mapa de trazabilidad de datos', N'Generar un mapa de trazabilidad de datos y un DER para conocer atributos de las bases de datos y entender como se replican los datos entre los dos sistemas. ', CAST(N'2016-06-15 22:32:03.000' AS DateTime), 0, 15, 13, 2, 5, 9, 7)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (18, N'Documentar los hallazgos', N'Documentar los hallazgos y cambios que se deban realizar
', CAST(N'2016-06-15 22:33:54.000' AS DateTime), 0, 5, 4, 1, 6, 9, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (19, N'Automatizar tareas ', N'Automatizar aquellas tareas que sean posibles', CAST(N'2016-06-15 22:35:21.000' AS DateTime), 0, 20, 20, 1, 7, 9, 12)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (20, N'Revisión de Inconsistencias SisCen y Automatización de Controles', N'Realizar un análisis de integridad detallado sobre las diferencias en la presentación de los distintos SisCen.
', CAST(N'2016-06-15 22:59:51.000' AS DateTime), 0, 20, 11, 2, 4, 11, 7)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (21, N'Establecer responsables', N'Establecer y describir los puestos requeridos en cada Régimen Informativo, pudiendo crear aquellos que se consideren necesarios.
', CAST(N'2016-06-15 23:59:41.000' AS DateTime), 0, 4, 0, 3, 5, 12, 9)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (22, N'Describir los perfiles de los puestos.', N'Describir los perfiles de los puestos.
', CAST(N'2016-06-16 00:01:07.000' AS DateTime), 0, 6, 6, 1, 6, 12, 9)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (23, N'Definir resposables de datos', N'Establecer y describir los puestos requeridos en cada Régimen Informativo, pudiendo crear aquellos que se consideren necesarios.
', CAST(N'2016-06-16 00:06:39.000' AS DateTime), 0, 3, 2, 1, 4, 13, 6)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (24, N'Describir los perfiles de los puestos.', N'Describir los perfiles de los puestos.
', CAST(N'2016-06-16 00:07:23.000' AS DateTime), 0, 4, 4, 1, 5, 13, 7)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (25, N'Especificar los objetivos, tareas y responsabilidades de los puestos.', N'Especificar los objetivos, tareas y responsabilidades de los puestos.
', CAST(N'2016-06-16 00:07:52.000' AS DateTime), 0, 12, 12, 1, 6, 13, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (26, N'Definir niveles de reporte ', N'Definir niveles de reporte y ubicación en la estructura organizacional.
', CAST(N'2016-06-16 00:08:25.000' AS DateTime), 0, 4, 4, 1, 6, 13, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (27, N'Documentar ', N'Documentar el trabajo realizado. 
', CAST(N'2016-06-16 00:09:02.000' AS DateTime), 0, 5, 5, 1, 6, 13, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (28, N'Asignar personal', N'Asignar al personal que ocupará los puestos y comunicar formalmente sus tareas.
', CAST(N'2016-06-16 00:09:33.000' AS DateTime), 0, 3, 0, 3, 7, 13, 9)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (29, N'Comunicar al personal ', N'Comunicar al personal de los regímenes impactados las definiciones sobre los roles, el circuito de flujo de información y la contribución e impacto que tiene cada persona sobre el circuito entero para que éste funcione de manera correcta.
', CAST(N'2016-06-16 00:10:09.000' AS DateTime), 0, 5, 5, 1, 7, 13, 9)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (30, N'Realizar relevamiento de los procesos actuales', N'Realizar un relevamiento de los procesos actuales.
', CAST(N'2016-06-16 00:23:45.000' AS DateTime), 0, 30, 30, 1, 4, 14, 12)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (31, N'Analizar y evaluar la eficacia y eficiencia de cada Régimen Informativo.', N'Analizar y evaluar la eficacia y eficiencia de cada Régimen Informativo.
', CAST(N'2016-06-16 00:24:44.000' AS DateTime), 0, 50, 50, 1, 4, 14, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (32, N'Diseñar el circuitos ideal de trabajo', N'Diseñar el circuitos ideal de trabajo, flujo de datos, documentación y controles, validándolos con los referentes claves', CAST(N'2016-06-16 00:25:25.000' AS DateTime), 0, 50, 51, 1, 5, 14, 9)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (33, N'Identificar responsables de las tareas, controles manuales y automáticos.', N'Identificar responsables de las tareas, controles manuales y automáticos.
', CAST(N'2016-06-16 00:26:47.000' AS DateTime), 0, 8, 8, 1, 6, 14, 6)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (34, N'Identificar los sistemas de información intervinientes.', N'Identificar los sistemas de información intervinientes.
', CAST(N'2016-06-16 00:27:56.000' AS DateTime), 0, 8, 8, 1, 6, 14, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (35, N'Identificar la documentación interviniente', N'Identificar la documentación interviniente, ya sea manual o electrónica.
', CAST(N'2016-06-16 00:28:48.000' AS DateTime), 0, 15, 15, 1, 7, 14, 12)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (36, N'Ajustes aplicativo SSAS Efectivo Mínimo', N'Automatizar la información de Efectivo Mínimo directamente desde el aplicativo SSAS.
', CAST(N'2016-06-16 00:32:19.000' AS DateTime), 0, 120, 100, 1, 4, 15, 12)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (37, N'Optimización Proceso de Presentación del Anexo K', N'Revisar, optimizar y documentar el proceso de presentación del Anexo K según regulaciones vigentes, optimizando la participación del sector de Créditos  y automatizando la actualización de clientes vinculados.', CAST(N'2016-06-16 00:00:00.000' AS DateTime), 0, 20, 0, 3, 5, 16, 6)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (38, N'Optimización sistema de Pago de Remuneraciones mediante Acreditación en Cuentas Bancarias', N'Redefinir el proceso de generación del Régimen Informativo "Pago de Remuneraciones mediante Acreditación en Cuentas Bancarias" incorporando controles que garanticen la integridad y confiabilidad de la información.', CAST(N'2016-06-16 00:00:00.000' AS DateTime), 0, 80, 0, 3, 6, 17, 12)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (39, N'Evaluar alternativas de implementación de un nuevo sistema', N'-Relevar y analizar los requerimientos del nuevo sistema: 
-Relevar los requerimientos por parte de los usuarios.
-Relevar el origen de la información con los referentes.
-Documentar y validar los relevamientos con los referentes 
-Consensuar definiciones con Desarrollo de Sistemas.
-Indagar sobre las herramientas tecnológicas disponibles para realizar el desarrollo propio del sistema, como así también para adquirir un software de terceros.
', CAST(N'2016-06-16 13:01:29.000' AS DateTime), 0, 52, 48, 1, 4, 18, 9)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (40, N'Definir si el desarrollo será interno o de terceros', N'Desarrollo Interno
- Evaluar si los recursos disponibles son suficientes y adecuados.
- Evaluar esfuerzo y costos.

Desarrollo de Terceros: Evaluar la oferta de sistemas de industria disponibles en el mercado:
- Preparar modelo de “request for proposal” (RFP) en base a lo definido en el análisis y diseño del sistema.
- Definir pautas y criterios de evaluación.
- Investigar los proveedores de sistemas que se estima cumplen con los requerimientos. 
- Contactarse y solicitar el RFP a los proveedores.
- Realizar visitas, demos y prototipos.
- Evaluar ofertas técnicas y económicas.
- Realizar matriz comparativa entre las soluciones de mercado.
', CAST(N'2016-06-16 13:03:54.000' AS DateTime), 0, 90, 65, 1, 5, 18, 12)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (41, N'Definir equipos de trabajo', N'Definir equipos de trabajo y asignar líder del proyecto, objetivos, tiempos y recursos. ', CAST(N'2016-06-16 13:05:02.000' AS DateTime), 0, 8, 8, 1, 6, 18, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (42, N'Graficar el mapa de aplicaciones', N'Graficar el mapa de aplicaciones y las interrelaciones entre los sistemas existentes y el nuevo.
', CAST(N'2016-06-16 13:06:20.000' AS DateTime), 0, 25, 20, 1, 6, 18, 7)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (43, N'Prever la infraestructura requerida y prepararla ', N'Prever la infraestructura requerida y prepararla (hardware, comunicaciones, redes, bases de datos, software de base, aplicación de actualizaciones, etc.).
', CAST(N'2016-06-16 13:07:03.000' AS DateTime), 0, 50, 35, 1, 6, 18, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (44, N'Definir cronograma de implementación', N'Definir un cronograma de implementación, que incluya reuniones de medición parcial de avance y seguimiento de inconvenientes.
', CAST(N'2016-06-16 13:08:33.000' AS DateTime), 0, 15, 12, 1, 7, 18, 9)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (45, N'Planificar la implementación ', N'Planificar la implementación evaluando escenarios y alternativas de resolución, cuando sea necesario.
', CAST(N'2016-06-16 13:09:19.000' AS DateTime), 0, 30, 30, 1, 7, 18, 7)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (46, N'Implementar el sistema en el ambiente de desarrollo', N'Implementar el sistema en el ambiente de desarrollo, documentando todos los pasos.', CAST(N'2016-06-16 13:10:42.000' AS DateTime), 0, 40, 40, 1, 7, 18, 6)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (47, N'Programa de pruebas', N'Diseñar, ejecutar  y documentar un programa de pruebas internas y con usuarios para ejecutar en el ambiente de prueba.  
', CAST(N'2016-06-16 13:11:57.000' AS DateTime), 0, 50, 50, 1, 7, 18, 7)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (48, N'Analizar y documentar los resultados del pasaje a producción. ', N'Analizar y documentar los resultados del pasaje a producción. ', CAST(N'2016-06-16 13:12:52.000' AS DateTime), 0, 12, 12, 1, 7, 18, 12)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (49, N'Analizar y documentar los resultados de la migración', N'Analizar y documentar los resultados de la migración y conversión de datos, si aplicase.
', CAST(N'2016-06-16 13:13:32.000' AS DateTime), 0, 25, 25, 1, 7, 18, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (50, N'Implementar en ambiente de producción', N'Implementar en ambiente de producción, documentando lo realizado.
', CAST(N'2016-06-16 13:14:34.000' AS DateTime), 0, 10, 10, 1, 7, 18, 6)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (51, N'Configurar perfiles de accesos de usuarios', N'Configurar perfiles de accesos de usuarios y estructura de seguridad informática siguiendo los principios de las mejores prácticas y segregación de funciones.
', CAST(N'2016-06-16 13:15:22.000' AS DateTime), 0, 8, 8, 1, 7, 18, 9)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (52, N'Evaluar alternativas de implementación de un nuevo sistema', N'-Relevar y analizar los requerimientos del nuevo sistema: 
-Relevar los requerimientos por parte de los usuarios.
-Relevar el origen de la información con los referentes.
-Documentar y validar los relevamientos con los referentes 
-Consensuar definiciones con Desarrollo de Sistemas.
-Indagar sobre las herramientas tecnológicas disponibles para realizar el desarrollo propio del sistema, como así también para adquirir un software de terceros.
', CAST(N'2016-06-16 13:23:04.000' AS DateTime), 0, 50, 48, 1, 5, 19, NULL)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (53, N'Definir si el desarrollo será interno o de terceros', N'Desarrollo Interno
- Evaluar si los recursos disponibles son suficientes y adecuados.
- Evaluar esfuerzo y costos.

Desarrollo de Terceros: Evaluar la oferta de sistemas de industria disponibles en el mercado:
- Preparar modelo de “request for proposal” (RFP) en base a lo definido en el análisis y diseño del sistema.
- Definir pautas y criterios de evaluación.
- Investigar los proveedores de sistemas que se estima cumplen con los requerimientos. 
- Contactarse y solicitar el RFP a los proveedores.
- Realizar visitas, demos y prototipos.
- Evaluar ofertas técnicas y económicas.
- Realizar matriz comparativa entre las soluciones de mercado.
', CAST(N'2016-06-16 13:30:36.000' AS DateTime), 0, 15, 14, 1, 5, 19, 12)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (54, N'Definir equipos de trabajo', N'Definir equipos de trabajo y asignar líder del proyecto, objetivos, tiempos y recursos. ', CAST(N'2016-06-16 13:31:32.000' AS DateTime), 0, 8, 8, 1, 5, 19, 9)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (55, N'Graficar el mapa de aplicaciones', N'Graficar el mapa de aplicaciones y las interrelaciones entre los sistemas existentes y el nuevo.
', CAST(N'2016-06-16 13:32:23.000' AS DateTime), 0, 20, 20, 1, 5, 19, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (56, N'Planificar la implementación', N'Planificar la implementación evaluando escenarios y alternativas de resolución, cuando sea necesario.
', CAST(N'2016-06-16 13:33:55.000' AS DateTime), 0, 15, 12, 1, 6, 19, 7)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (57, N'Implementar el sistema en el ambiente de desarrollo', N'Implementar el sistema en el ambiente de desarrollo, documentando todos los pasos. ', CAST(N'2016-06-16 13:35:01.000' AS DateTime), 0, 20, 20, 1, 6, 19, 6)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (58, N'Programa de pruebas', N'Diseñar, ejecutar  y documentar un programa de pruebas internas y con usuarios para ejecutar en el ambiente de prueba.  
', CAST(N'2016-06-16 13:35:36.000' AS DateTime), 0, 25, 22, 1, 7, 19, 7)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (59, N'Analizar y documentar los resultados del pasaje a producción. ', N'Analizar y documentar los resultados del pasaje a producción. 
', CAST(N'2016-06-16 13:36:22.000' AS DateTime), 0, 12, 12, 1, 7, 19, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (60, N'Realizar controles para asegurar la integridad de datos.', N'Realizar controles para asegurar la integridad de datos.
', CAST(N'2016-06-16 13:37:35.000' AS DateTime), 0, 10, 10, 1, 7, 19, 9)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (61, N'Configurar perfiles de accesos de usuarios', N'Configurar perfiles de accesos de usuarios y estructura de seguridad informática siguiendo los principios de las mejores prácticas y segregación de funciones.
', CAST(N'2016-06-16 13:38:08.000' AS DateTime), 0, 8, 8, 1, 7, 19, 12)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (62, N'Definir si el desarrollo será interno o de terceros', N'Desarrollo Interno
- Evaluar si los recursos disponibles son suficientes y adecuados.
- Evaluar esfuerzo y costos.
Desarrollo de Terceros: Evaluar la oferta de sistemas de industria disponibles en el mercado:
- Preparar modelo de “request for proposal” (RFP) en base a lo definido en el análisis y diseño del sistema.
- Definir pautas y criterios de evaluación.
- Investigar los proveedores de sistemas que se estima cumplen con los requerimientos. 
- Contactarse y solicitar el RFP a los proveedores.
- Realizar visitas, demos y prototipos.
- Evaluar ofertas técnicas y económicas.
- Realizar matriz comparativa entre las soluciones de mercado.
', CAST(N'2016-06-16 13:52:48.000' AS DateTime), 0, 15, 13, 1, 4, 20, 6)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (63, N'Definir si el desarrollo será interno o de terceros', N'Desarrollo Interno
- Evaluar si los recursos disponibles son suficientes y adecuados.
- Evaluar esfuerzo y costos.
Desarrollo de Terceros: Evaluar la oferta de sistemas de industria disponibles en el mercado:
- Preparar modelo de “request for proposal” (RFP) en base a lo definido en el análisis y diseño del sistema.
- Definir pautas y criterios de evaluación.
- Investigar los proveedores de sistemas que se estima cumplen con los requerimientos. 
- Contactarse y solicitar el RFP a los proveedores.
- Realizar visitas, demos y prototipos.
- Evaluar ofertas técnicas y económicas.
- Realizar matriz comparativa entre las soluciones de mercado.
', CAST(N'2016-06-16 13:54:02.000' AS DateTime), 0, 15, 15, 1, 4, 21, 7)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (64, N'Definir equipos de trabajo ', N'Definir equipos de trabajo y asignar líder del proyecto, objetivos, tiempos y recursos. ', CAST(N'2016-06-16 14:07:10.000' AS DateTime), 0, 16, 16, 1, 6, 20, 7)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (65, N'Definir equipos de trabajo', N'Definir equipos de trabajo y asignar líder del proyecto, objetivos, tiempos y recursos. ', CAST(N'2016-06-16 14:16:29.000' AS DateTime), 0, 16, 16, 1, 5, 21, 9)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (66, N'Planificar la implementación ', N'Planificar la implementación evaluando escenarios y alternativas de resolución, cuando sea necesario.
', CAST(N'2016-06-16 14:17:34.000' AS DateTime), 0, 20, 20, 1, 6, 20, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (67, N'Planificar la implementación ', N'Planificar la implementación evaluando escenarios y alternativas de resolución, cuando sea necesario.
', CAST(N'2016-06-16 14:18:10.000' AS DateTime), 0, 20, 20, 1, 6, 21, 12)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (68, N'Implementar el sistema en el ambiente de desarrollo', N'Implementar el sistema en el ambiente de desarrollo, documentando todos los pasos.', CAST(N'2016-06-16 14:18:53.000' AS DateTime), 0, 15, 15, 1, 7, 20, 12)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (69, N'Implementar el sistema en el ambiente de desarrollo', N'Implementar el sistema en el ambiente de desarrollo, documentando todos los pasos.', CAST(N'2016-06-16 14:19:26.000' AS DateTime), 0, 20, 20, 1, 7, 21, 12)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (70, N'Diseñar, ejecutar  y documentar un programa de pruebas ', N'Diseñar, ejecutar  y documentar un programa de pruebas internas y con usuarios para ejecutar en el ambiente de prueba. ', CAST(N'2016-06-16 14:19:58.000' AS DateTime), 0, 35, 35, 1, 7, 20, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (71, N'Configurar perfiles de accesos de usuarios ', N'Configurar perfiles de accesos de usuarios y estructura de seguridad informática siguiendo los principios de las mejores prácticas y segregación de funciones.
', CAST(N'2016-06-16 14:21:01.000' AS DateTime), 0, 16, 15, 1, 7, 20, 9)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (72, N'ontrol Diferencias Impositivas Tarjetas de Crédito', N'Automatizar el control sobre diferencias impositivas de Tarjetas de Crédito.', CAST(N'2016-06-16 00:00:00.000' AS DateTime), 0, 20, 20, 1, 6, 22, 6)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (73, N'Automatización Controles Fraccionamiento', N'Automatizar el cruce de la información de Fraccionamiento de Riesgo Crediticio.', CAST(N'2016-06-16 00:00:00.000' AS DateTime), 0, 23, 23, 1, 7, 23, 6)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (74, N'Automatización Planilla D', N'Relevar el proceso y automatizar la generación de la información para deudas del exterior y demás conceptos alcanzados que se presentan en "Planilla D".', CAST(N'2016-06-16 00:00:00.000' AS DateTime), 0, 14, 0, 3, 5, 24, 8)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (75, N'Revisión accesos a los sistemas', N'Analizar los perfiles, accesos y permisos actuales de los usuarios con el fin de evaluar si son adecuados y limitar aquellos que excedan sus responsabilidades.
', CAST(N'2016-06-19 00:00:00.000' AS DateTime), 0, 10, 8, 1, 8, 46, 13)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (76, N'Procesamiento online Tarjetas de Crédito', N'Evaluar la factibilidad de estandarizar el procesamiento de Tarjetas de Crédito realizándolo de manera online como en el resto de las subsidiarias.', CAST(N'2016-06-19 00:00:00.000' AS DateTime), 0, 9, 0, 3, 9, 47, 14)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (77, N'Revisar configuración cuenta puente ', N'Revisar la configuración de la cuenta puente, definiendo atributos exclusivos que difieran de una cuenta usuario. Evaluar la funcionalidad actual del administrador que da soporte a las transferencias de manera que la imputación a la cuenta puente se realice de manera automática.
', CAST(N'2016-06-19 00:00:00.000' AS DateTime), 0, 20, 20, 1, 10, 48, 15)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (78, N'Revisar configuración Administrador Usuario Certificado', N'Revisar la configuración del Administrador a fin de minimizar la carga manual.
', CAST(N'2016-06-19 00:00:00.000' AS DateTime), 0, 8, 0, 3, 9, 49, 19)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (79, N'Evaluar la conveniencia de las alternativas de implementación de un sistema único', N'Desarrollo Propio:
-Evaluar si los recursos disponibles son suficientes y adecuados.
-Evaluar esfuerzo y costos.

Adquisición de Software
Evaluar la oferta de sistemas de industria disponibles en el mercado:
-Preparar modelo de “request for proposal” (RFP) en base a lo definido en el análisis y diseño del sistema vertical.
-Definir pautas y criterios de evaluación.
-Investigar los proveedores de sistemas que se estima cumplen con los requerimientos. 
-Contactarse y solicitar el RFP a los proveedores.
-Realizar visitas, demos y prototipos.
-Evaluar ofertas técnicas y económicas.
-Realizar matriz comparativa entre las soluciones de mercado.
', CAST(N'2016-06-19 01:11:57.000' AS DateTime), 0, 8, 5, 1, 8, 25, 13)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (80, N'Definir equipos de trabajo ', N'Definir equipos de trabajo y asignar líder del proyecto, objetivos, tiempos y recursos.', CAST(N'2016-06-19 01:18:43.000' AS DateTime), 0, 8, 0, 3, 9, 25, 14)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (81, N'Definir un cronograma de implementación', N'Definir un cronograma de implementación, que incluya reuniones de medición parcial de avance y seguimiento de inconvenientes.
', CAST(N'2016-06-19 01:20:28.000' AS DateTime), 0, 20, 10, 1, 9, 25, 15)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (82, N'Planificar la implementación', N'Planificar la implementación evaluando escenarios y alternativas de resolución, cuando sea necesario.
', CAST(N'2016-06-19 01:21:28.000' AS DateTime), 0, 15, 5, 2, 9, 25, 16)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (83, N'Implementar el sistema', N'Implementar el sistema en el ambiente de desarrollo, documentando todos los pasos. 
', CAST(N'2016-06-19 01:22:17.000' AS DateTime), 0, 40, 40, 1, 10, 25, 17)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (84, N'Realizar controles para asegurar la integridad de datos.', N'Realizar controles para asegurar la integridad de datos.
', CAST(N'2016-06-19 01:23:01.000' AS DateTime), 0, 15, 15, 1, 10, 25, 18)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (85, N'Configurar perfiles de accesos de usuarios', N'Configurar perfiles de accesos de usuarios y estructura de seguridad informática siguiendo los principios de las mejores prácticas y segregación de funciones.
', CAST(N'2016-06-19 01:23:34.000' AS DateTime), 0, 15, 15, 1, 10, 25, 19)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (86, N'Definir la clasificación de la información', N'Definir la clasificación de la información de acuerdo con su sensibilidad y criticidad.
', CAST(N'2016-06-19 01:24:47.000' AS DateTime), 0, 8, 8, 1, 8, 26, 18)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (87, N'Relevar los procesos de negocio', N'Relevar los procesos de negocio con las áreas involucradas, para detectar el envío o recepción de archivos con información sensible.
', CAST(N'2016-06-19 01:29:13.000' AS DateTime), 0, 22, 21, 1, 8, 26, 19)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (88, N'Relevar los requerimientos de los usuarios.', N'Relevar los requerimientos de los usuarios.
', CAST(N'2016-06-19 01:30:17.000' AS DateTime), 0, 30, 30, 1, 9, 26, 20)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (89, N'Documentar y validar los relevamientos con las áreas  involucradas.', N'Documentar y validar los relevamientos con las áreas  involucradas.
', CAST(N'2016-06-19 01:30:53.000' AS DateTime), 0, 15, 10, 2, 9, 26, 16)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (90, N'Definir un procedimiento de seguridad de los datos', N'Definir un procedimiento de seguridad de los datos, como por ejemplo: incorporación de clave a los archivos o encriptación de los archivos etc.
', CAST(N'2016-06-19 01:32:10.000' AS DateTime), 0, 16, 16, 1, 10, 26, 17)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (91, N'Analizar las configuraciones y requerimientos técnicos necesarios.', N'Analizar las configuraciones y requerimientos técnicos necesarios.
', CAST(N'2016-06-19 01:32:57.000' AS DateTime), 0, 22, 22, 1, 10, 26, 14)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (92, N'Evaluar la implementación de validaciones adicionales en la plataforma.', N'Evaluar la implementación de validaciones adicionales en la plataforma.
', CAST(N'2016-06-19 01:35:12.000' AS DateTime), 0, 23, 23, 1, 8, 27, 13)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (93, N'Analizar las configuraciones, requerimientos técnicos e interfaces', N'Analizar las configuraciones, requerimientos técnicos e interfaces, necesarias para la incorporación de las validaciones.
', CAST(N'2016-06-19 01:35:54.000' AS DateTime), 0, 32, 0, 3, 9, 27, 15)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (94, N'Implementar las validaciones definidas en la plataforma', N'Implementar las validaciones definidas en la plataforma.
', CAST(N'2016-06-19 01:36:42.000' AS DateTime), 0, 20, 20, 1, 10, 27, 16)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (95, N'Evaluar opciones', N'A: Conexión con medios de cobro          
B: Desarrollo archivo intermedio

OPCION A:
-Evaluar la posibilidad de automatizar la conexión entre los medios de pago (excepto Tarjetas de -Crédito) y la plataforma, para obtener los archivos necesarios para el procesamiento y su posterior control.
-Evaluar con servicios ofrecidos por los medios de cobro respecto de conexión automática.
-Evaluar los requerimientos de los archivos de los medios de cobro.
-Identificar controles necesarios para realizar las validaciones de los archivos.
-Analizar las configuraciones, requerimientos técnicos e interfaces, necesarias para realizar la automatización.
-Analizar qué información adicional de los usuarios es posible y necesaria para realizar validaciones internas adicionales de las operaciones.
-Evaluar la posibilidad de que los archivos que proveen los medios de pago contengan información adicional de los usuarios.

OPCION B:
En aquellos casos donde no fuera posible la estandarización de la interface con los medios de cobro:
-Crear internamente una interfaz/archivo estándar que sirva de middleware para procesar el ingreso de información de los distintos de las distintas entidades y desarrollar un proceso que obtenga los archivos de los medios de cobro e incorpore a un área común de trabajo (este nuevo desarrollo) la información recibida de manera de eliminar el procesamiento manual y reducir el número de administradores.
-Desarrollar el formato del archivo estándar de manera tal que acepte: conciliar, identificar información para enviar a clientes, procesar por única interfaz los cobros y aprobar, rechazar en base de datos.
-Desarrollar el archivo parametrizando los campos en base a los datos de  todos los archivos de los medios de cobro, considerando el más complejo (Ej. Visa).
', CAST(N'2016-06-21 17:17:20.000' AS DateTime), 0, 18, 18, 1, 8, 28, 20)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (96, N'Estandarizar el proceso', N'Estandarizar el proceso de ingreso de información de los distintos medios de cobro para todas las subsidiarias evitando reprocesamiento y manipulación de información.  
', CAST(N'2016-06-21 17:22:52.000' AS DateTime), 0, 25, 25, 1, 9, 28, 15)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (97, N'Relevar la operatoria', N'Relevar la operatoria del procesamiento de los pagos en entidades recaudadoras con las áreas involucradas.
', CAST(N'2016-06-21 17:24:50.000' AS DateTime), 0, 16, 16, 1, 8, 29, 14)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (98, N'Analizar y definir todos los estados posibles para el pago.', N'Analizar y definir todos los estados posibles para el pago.
', CAST(N'2016-06-21 17:25:42.000' AS DateTime), 0, 20, 14, 2, 9, 29, 13)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (99, N'Analizar las configuraciones, requerimientos técnicos e interfaces', N'Analizar las configuraciones, requerimientos técnicos e interfaces, necesarias para realizar la automatización.
', CAST(N'2016-06-21 17:26:14.000' AS DateTime), 0, 20, 0, 3, 9, 29, 16)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (100, N'Desarrollar nueva funcionalidad y reporte', N'Desarrollar nueva funcionalidad y reporte.', CAST(N'2016-06-21 17:26:56.000' AS DateTime), 0, 40, 40, 1, 10, 29, 19)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (101, N'Implementar la automatización y la generación de reporte', N'Implementar la automatización y la generación de reporte.
', CAST(N'2016-06-21 17:27:30.000' AS DateTime), 0, 12, 12, 1, 10, 29, 15)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (102, N'Realizar análisis', N'Realizar un análisis de todos los campos incluidos en los archivos provenientes de los entes externos.
', CAST(N'2016-06-21 17:28:30.000' AS DateTime), 0, 25, 25, 1, 8, 30, 20)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (103, N'Definir campos adicionales', N'Definir qué campo adicional es necesario para poder identificar al usuario del sistema de pago. Considerar por ejemplo: DNI, número de operación, usuario (e-mail) etc.
', CAST(N'2016-06-21 17:30:12.000' AS DateTime), 0, 8, 8, 1, 8, 30, 18)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (104, N'Analizar ente externo', N'Analizar la posibilidad de requerir al ente externo un campo adicional dentro de los archivos txt.
', CAST(N'2016-06-21 17:32:02.000' AS DateTime), 0, 10, 5, 2, 9, 30, 13)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (105, N'Solicitar campo adicional', N'Solicitar al ente externo un campo adicional que contenga información sobre el usuario del sistema de pago.
', CAST(N'2016-06-21 17:32:36.000' AS DateTime), 0, 16, 16, 1, 10, 30, 17)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (106, N'Relevar la operatoria', N'Relevar la operatoria del procesamiento de los pagos por transferencias con las áreas involucradas.
', CAST(N'2016-06-21 17:35:25.000' AS DateTime), 0, 8, 8, 1, 8, 31, 13)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (107, N'Relevar los requerimientos de los usuarios', N'Relevar los requerimientos de los usuarios.
', CAST(N'2016-06-21 17:36:10.000' AS DateTime), 0, 30, 30, 1, 8, 31, 14)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (108, N'Evaluar la posibilidad de automatizar la conciliación de las trasferencias', N'Evaluar la posibilidad de automatizar la conciliación de las trasferencias.
', CAST(N'2016-06-21 17:36:46.000' AS DateTime), 0, 20, 15, 2, 9, 31, 14)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (109, N'Definir la lógica del sistema', N'Definir la lógica del sistema para poder realizar el procesamiento de manera automática, tomando los pagos que se encuentran en la plataforma como en la liquidación de las transferencias.
', CAST(N'2016-06-21 17:37:32.000' AS DateTime), 0, 40, 20, 2, 9, 31, 15)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (110, N'Analizar las configuraciones, requerimientos técnicos e interfaces', N'Analizar las configuraciones, requerimientos técnicos e interfaces.', CAST(N'2016-06-21 17:38:10.000' AS DateTime), 0, 16, 16, 1, 10, 31, 18)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (111, N'Indagar sobre las herramientas tecnológicas disponibles', N'Indagar sobre las herramientas tecnológicas disponibles para la automatización, evaluando nuevas tecnologías y/o adaptables al sistema a desarrollar/adquirir/adaptar.
', CAST(N'2016-06-21 17:39:09.000' AS DateTime), 0, 12, 12, 1, 10, 31, 19)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (112, N'Relevar el proceso', N'Relevar el proceso de análisis de fraude de Boleto Bradesco.
', CAST(N'2016-06-21 17:41:46.000' AS DateTime), 0, 15, 15, 1, 8, 32, 13)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (113, N'Evaluar la incorporación de la validación al administrador', N'Evaluar la incorporación de la validación al administrador, o evaluar algún sistema que permita realizar el análisis de Boletos Bradesco de forma automática.
', CAST(N'2016-06-21 17:43:01.000' AS DateTime), 0, 12, 12, 1, 8, 32, 16)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (114, N'Determinar las validaciones necesarias para el correcto análisis', N'Determinar las validaciones necesarias para el correcto análisis.
', CAST(N'2016-06-21 17:43:53.000' AS DateTime), 0, 25, 25, 1, 9, 32, 14)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (115, N'Analizar las configuraciones, requerimientos técnicos e interfaces', N'Analizar las configuraciones, requerimientos técnicos e interfaces, necesarias para realizar la automatización.
', CAST(N'2016-06-21 17:44:30.000' AS DateTime), 0, 20, 0, 3, 9, 32, 17)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (116, N'Definir los estados posibles', N'Definir los estados posibles, incorporando al procesamiento automático que el cambio de estado sea el resultado final del análisis.
', CAST(N'2016-06-21 17:45:21.000' AS DateTime), 0, 15, 15, 1, 9, 32, 14)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (117, N'Realizar los desarrollos.', N'Realizar los desarrollos.
', CAST(N'2016-06-21 17:45:58.000' AS DateTime), 0, 80, 80, 1, 10, 32, 18)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (118, N'Ejecutar pruebas', N'Ejecutar pruebas.
', CAST(N'2016-06-21 17:46:30.000' AS DateTime), 0, 20, 20, 1, 10, 32, 18)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (119, N'Implementar', N'Implementar.
', CAST(N'2016-06-21 17:47:03.000' AS DateTime), 0, 10, 10, 1, 10, 32, 14)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (120, N'Realizar un análisis de todos los campos incluidos en los archivos provenientes de los entes externos', N'Realizar un análisis de todos los campos incluidos en los archivos provenientes de los entes externos.
', CAST(N'2016-06-21 17:48:10.000' AS DateTime), 0, 20, 20, 1, 8, 33, 13)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (121, N'Definir campos adicionales', N'Definir qué campo adicional es necesario para poder identificar al usuario del sistema de pago. Considerar por ejemplo: DNI, número de operación, usuario (e-mail) etc.
', CAST(N'2016-06-21 17:48:57.000' AS DateTime), 0, 10, 10, 1, 9, 33, 15)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (122, N'Analizar campos adicionales', N'Analizar la posibilidad de requerir al ente externo un campo adicional dentro de los archivos txt.
', CAST(N'2016-06-21 17:50:53.000' AS DateTime), 0, 10, 10, 1, 10, 33, 19)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (123, N'Solicitar campo adicional', N'Solicitar al ente externo un campo adicional que contenga información sobre el usuario del sistema de pago.
', CAST(N'2016-06-21 17:52:08.000' AS DateTime), 0, 5, 5, 1, 10, 33, 28)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (124, N'Relevar la operatoria', N'Relevar la operatoria del procesamiento de pagos con tarjetas de crédito, con las áreas involucradas.
', CAST(N'2016-06-21 17:53:33.000' AS DateTime), 0, 16, 16, 1, 8, 34, 13)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (125, N'Automatizar la identificación de  los pagos realizados con tarjetas de crédito', N'Evaluar la posibilidad de automatizar la identificación de  los pagos realizados con tarjetas de crédito extranjeras y el envío de los mismos mediante workflow al Call Center.
', CAST(N'2016-06-21 17:55:18.000' AS DateTime), 0, 20, 20, 1, 9, 34, 14)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (126, N'Analizar las configuraciones, requerimientos técnicos e interfaces', N'Analizar las configuraciones, requerimientos técnicos e interfaces, necesarias para realizar la automatización.
', CAST(N'2016-06-21 17:56:10.000' AS DateTime), 0, 15, 15, 1, 9, 34, 18)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (127, N'Indagar sobre las herramientas tecnológicas disponibles para la automatización, evaluando nuevas tecnologías y/o adaptables al sistema a desarrollar/adquirir/adaptar. ', N'Indagar sobre las herramientas tecnológicas disponibles para la automatización, evaluando nuevas tecnologías y/o adaptables al sistema a desarrollar/adquirir/adaptar. 
', CAST(N'2016-06-21 17:56:38.000' AS DateTime), 0, 12, 12, 1, 10, 34, 15)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (128, N'fadfs', N'asdfasd', CAST(N'2016-07-17 00:00:00.000' AS DateTime), 0, 10, 10, 1, 2, 50, 1)
GO
INSERT [dbo].[Task] ([Id], [Title], [Description], [CreationDate], [Erased], [EstimatedTime], [RemainingTime], [TaskStateId], [SprintId], [BacklogItemId], [UserId]) VALUES (129, N'A', NULL, CAST(N'2016-09-18 19:00:44.000' AS DateTime), 1, 12, 12, 1, 4, 4, 6)
GO
SET IDENTITY_INSERT [dbo].[Task] OFF
GO
INSERT [dbo].[TaskState] ([Id], [Name], [Erased]) VALUES (1, N'Por hacer', 0)
GO
INSERT [dbo].[TaskState] ([Id], [Name], [Erased]) VALUES (2, N'En ejecución', 0)
GO
INSERT [dbo].[TaskState] ([Id], [Name], [Erased]) VALUES (3, N'Hecho', 0)
GO
SET IDENTITY_INSERT [dbo].[TaskUpdate] ON 

GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (1, NULL, CAST(N'2016-05-29 22:25:18.000' AS DateTime), 0, 10, 4, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (2, NULL, CAST(N'2016-05-29 23:03:19.000' AS DateTime), 0, 3, 14, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (3, NULL, CAST(N'2016-05-29 23:03:51.000' AS DateTime), 0, 9, 14, 2, 3)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (4, NULL, CAST(N'2016-06-02 21:24:14.000' AS DateTime), 0, 2, 6, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (5, NULL, CAST(N'2016-06-09 14:27:17.000' AS DateTime), 0, 7, 7, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (6, NULL, CAST(N'2016-06-09 14:27:35.000' AS DateTime), 0, 10, 7, 2, 3)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (7, N'-', CAST(N'2016-06-15 22:40:43.000' AS DateTime), 0, 6, 5, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (8, N'Ninguno', CAST(N'2016-06-16 14:44:57.000' AS DateTime), 0, 8, 20, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (9, N'Se empezó el tratamiento', CAST(N'2016-06-17 18:43:14.000' AS DateTime), 0, 15, 38, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (10, N'Sistema Optimizado', CAST(N'2016-06-17 18:44:53.000' AS DateTime), 0, 35, 38, 2, 3)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (11, N'-', CAST(N'2016-06-17 20:35:00.000' AS DateTime), 0, 0, 21, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (12, N'-', CAST(N'2016-06-17 20:35:19.000' AS DateTime), 0, 4, 21, 2, 3)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (13, N'-', CAST(N'2016-06-17 20:35:31.000' AS DateTime), 0, 20, 4, 2, 3)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (14, N'-', CAST(N'2016-06-17 20:35:43.000' AS DateTime), 0, 15, 37, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (15, N'-', CAST(N'2016-06-17 20:35:54.000' AS DateTime), 0, 5, 37, 2, 3)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (16, NULL, CAST(N'2016-06-17 20:46:46.000' AS DateTime), 0, 8, 13, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (17, NULL, CAST(N'2016-06-17 20:46:55.000' AS DateTime), 0, 7, 13, 2, 3)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (18, NULL, CAST(N'2016-06-17 20:47:04.000' AS DateTime), 0, 3, 28, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (19, NULL, CAST(N'2016-06-17 20:47:13.000' AS DateTime), 0, 0, 28, 2, 3)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (20, N'-', CAST(N'2016-06-17 20:55:38.000' AS DateTime), 0, 16, 12, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (21, N'Sin comentarios', CAST(N'2016-07-10 18:39:51.000' AS DateTime), 0, 5, 76, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (22, NULL, CAST(N'2016-07-10 18:40:07.000' AS DateTime), 0, 2, 76, 2, 3)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (23, N'Sin comentarios', CAST(N'2016-07-10 18:40:19.000' AS DateTime), 0, 4, 78, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (24, N'- ', CAST(N'2016-07-10 18:40:32.000' AS DateTime), 0, 4, 78, 2, 3)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (25, NULL, CAST(N'2016-07-10 18:57:56.000' AS DateTime), 0, 5, 80, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (26, NULL, CAST(N'2016-07-10 18:58:05.000' AS DateTime), 0, 2, 80, 2, 3)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (27, NULL, CAST(N'2016-07-10 18:59:40.000' AS DateTime), 0, 10, 82, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (28, NULL, CAST(N'2016-07-10 18:59:54.000' AS DateTime), 0, 5, 89, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (29, NULL, CAST(N'2016-07-10 19:00:03.000' AS DateTime), 0, 5, 93, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (30, NULL, CAST(N'2016-07-10 19:00:11.000' AS DateTime), 0, 6, 98, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (31, NULL, CAST(N'2016-07-10 19:00:18.000' AS DateTime), 0, 27, 93, 2, 3)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (32, NULL, CAST(N'2016-07-10 19:00:40.000' AS DateTime), 0, 10, 115, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (33, NULL, CAST(N'2016-07-10 19:00:49.000' AS DateTime), 0, 10, 115, 2, 3)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (34, NULL, CAST(N'2016-07-10 19:00:59.000' AS DateTime), 0, 3, 99, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (35, NULL, CAST(N'2016-07-10 19:01:06.000' AS DateTime), 0, 17, 99, 2, 3)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (36, NULL, CAST(N'2016-07-10 19:01:13.000' AS DateTime), 0, 5, 104, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (37, NULL, CAST(N'2016-07-10 19:01:21.000' AS DateTime), 0, 5, 108, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (38, NULL, CAST(N'2016-07-10 19:01:31.000' AS DateTime), 0, 20, 109, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (39, NULL, CAST(N'2016-09-27 15:05:24.000' AS DateTime), 0, 2, 17, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (40, NULL, CAST(N'2016-09-27 15:06:13.000' AS DateTime), 0, 5, 74, 1, 2)
GO
INSERT [dbo].[TaskUpdate] ([Id], [Comment], [EventDate], [Erased], [ElapsedTime], [TaskId], [PreviousTaskStateId], [TaskStateId]) VALUES (41, NULL, CAST(N'2016-09-27 15:06:27.000' AS DateTime), 0, 9, 74, 2, 3)
GO
SET IDENTITY_INSERT [dbo].[TaskUpdate] OFF
GO
SET IDENTITY_INSERT [dbo].[Team] ON 

GO
INSERT [dbo].[Team] ([Id], [Name], [Erased], [ProjectId]) VALUES (1, N'Team Main project', 0, 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [Erased], [ProjectId]) VALUES (2, N'Team Envios Agentes Oficiales', 0, 2)
GO
INSERT [dbo].[Team] ([Id], [Name], [Erased], [ProjectId]) VALUES (3, N'Team Proyecto Prueba', 0, 3)
GO
INSERT [dbo].[Team] ([Id], [Name], [Erased], [ProjectId]) VALUES (4, N'Team Compliance TI', 0, 4)
GO
INSERT [dbo].[Team] ([Id], [Name], [Erased], [ProjectId]) VALUES (5, N'-', 1, 5)
GO
INSERT [dbo].[Team] ([Id], [Name], [Erased], [ProjectId]) VALUES (6, N'Team Oportunidades de Mejora de Implementación de sistemas', 0, 6)
GO
INSERT [dbo].[Team] ([Id], [Name], [Erased], [ProjectId]) VALUES (7, N'Team xyz', 1, 7)
GO
INSERT [dbo].[Team] ([Id], [Name], [Erased], [ProjectId]) VALUES (8, N'Team xyz', 1, 8)
GO
SET IDENTITY_INSERT [dbo].[Team] OFF
GO
SET IDENTITY_INSERT [dbo].[TeamMember] ON 

GO
INSERT [dbo].[TeamMember] ([Id], [Capacity], [Erased], [UserId], [TeamId]) VALUES (1, 4, 0, 1, 1)
GO
INSERT [dbo].[TeamMember] ([Id], [Capacity], [Erased], [UserId], [TeamId]) VALUES (2, 2, 0, 2, 1)
GO
INSERT [dbo].[TeamMember] ([Id], [Capacity], [Erased], [UserId], [TeamId]) VALUES (3, 5, 0, 3, 2)
GO
INSERT [dbo].[TeamMember] ([Id], [Capacity], [Erased], [UserId], [TeamId]) VALUES (4, 8, 0, 6, 4)
GO
INSERT [dbo].[TeamMember] ([Id], [Capacity], [Erased], [UserId], [TeamId]) VALUES (5, 5, 0, 7, 4)
GO
INSERT [dbo].[TeamMember] ([Id], [Capacity], [Erased], [UserId], [TeamId]) VALUES (6, 8, 0, 8, 4)
GO
INSERT [dbo].[TeamMember] ([Id], [Capacity], [Erased], [UserId], [TeamId]) VALUES (7, 6, 0, 9, 4)
GO
INSERT [dbo].[TeamMember] ([Id], [Capacity], [Erased], [UserId], [TeamId]) VALUES (8, 4, 0, 12, 4)
GO
INSERT [dbo].[TeamMember] ([Id], [Capacity], [Erased], [UserId], [TeamId]) VALUES (9, 8, 0, 13, 6)
GO
INSERT [dbo].[TeamMember] ([Id], [Capacity], [Erased], [UserId], [TeamId]) VALUES (10, 8, 0, 14, 6)
GO
INSERT [dbo].[TeamMember] ([Id], [Capacity], [Erased], [UserId], [TeamId]) VALUES (11, 8, 0, 15, 6)
GO
INSERT [dbo].[TeamMember] ([Id], [Capacity], [Erased], [UserId], [TeamId]) VALUES (12, 6, 0, 16, 6)
GO
INSERT [dbo].[TeamMember] ([Id], [Capacity], [Erased], [UserId], [TeamId]) VALUES (13, 6, 0, 17, 6)
GO
INSERT [dbo].[TeamMember] ([Id], [Capacity], [Erased], [UserId], [TeamId]) VALUES (14, 8, 0, 18, 6)
GO
INSERT [dbo].[TeamMember] ([Id], [Capacity], [Erased], [UserId], [TeamId]) VALUES (15, 8, 0, 19, 6)
GO
INSERT [dbo].[TeamMember] ([Id], [Capacity], [Erased], [UserId], [TeamId]) VALUES (16, 8, 0, 20, 6)
GO
INSERT [dbo].[TeamMember] ([Id], [Capacity], [Erased], [UserId], [TeamId]) VALUES (17, 4, 1, 28, 6)
GO
SET IDENTITY_INSERT [dbo].[TeamMember] OFF
GO
INSERT [dbo].[Test] ([Id], [Steps], [VersionOriginId], [TestOutcomeId]) VALUES (11, N'-Ahondar en detalle el análisis de los SisCen, haciendo hincapié en sus presentaciones.
-Determinar que datos toma cada sistema para su generación.
-Documentar los hallazgos y validarlos con los referentes.
', 2, 1)
GO
INSERT [dbo].[Test] ([Id], [Steps], [VersionOriginId], [TestOutcomeId]) VALUES (15, N'-Relevar la operatoria de los procesos involucrados.
-Definir controles para la verificación y análisis de los procesos.
-Evaluar la posibilidad que los controles sean automáticos y en caso de serlos, definir como lo haría el sistema en términos generales.
-Analizar las configuraciones, requerimientos técnicos e interfaces, necesarias para realizar la automatización.
-Implementar la automatización.
-Ejecutar pruebas.
-Implementar.
', 1, 1)
GO
INSERT [dbo].[Test] ([Id], [Steps], [VersionOriginId], [TestOutcomeId]) VALUES (16, N'-Realizar un relevamiento de los procesos actuales.
-Analizar y evaluar la eficacia y eficiencia de cada Régimen Informativo.
-Diseñar el circuitos ideal de trabajo, flujo de datos, documentación y controles, validándolos con los referentes claves.
-Identificar responsables de las tareas, controles manuales y automáticos.
-Identificar los sistemas de información intervinientes.
-Identificar la documentación interviniente, ya sea manual o electrónica.
', 1, 2)
GO
INSERT [dbo].[Test] ([Id], [Steps], [VersionOriginId], [TestOutcomeId]) VALUES (17, N'-Realizar un relevamiento de los procesos actuales.
-Analizar y evaluar la eficacia y eficiencia de cada Régimen Informativo.
-Diseñar el circuitos ideal de trabajo, flujo de datos, documentación y controles, validándolos con los referentes claves.
-Identificar responsables de las tareas, controles manuales y automáticos.
-Identificar los sistemas de información intervinientes.
-Identificar la documentación interviniente, ya sea manual o electrónica.
', 2, 2)
GO
INSERT [dbo].[Test] ([Id], [Steps], [VersionOriginId], [TestOutcomeId]) VALUES (22, N'-Relevar la operatoria de los procesos involucrados.
-Definir controles para la verificación y análisis de los procesos.
-Evaluar la posibilidad que los controles sean automáticos y en caso de serlos, definir como lo haría el sistema en términos generales.
-Analizar las configuraciones, requerimientos técnicos e interfaces, necesarias para realizar la automatización.
-Implementar la automatización.
-Ejecutar pruebas.
-Implementar.
', 1, 1)
GO
INSERT [dbo].[Test] ([Id], [Steps], [VersionOriginId], [TestOutcomeId]) VALUES (23, N'Relevar la operatoria de los procesos involucrados.
Definir controles para la verificación y análisis de los procesos.
Evaluar la posibilidad que los controles sean automáticos y en caso de serlos, definir como lo haría el sistema en términos generales.
-Analizar las configuraciones, requerimientos técnicos e interfaces, necesarias para realizar la automatización.
-Implementar la automatización.
-Ejecutar pruebas.
-Implementar.
', 2, 1)
GO
INSERT [dbo].[Test] ([Id], [Steps], [VersionOriginId], [TestOutcomeId]) VALUES (24, N'-Relevar la operatoria de los procesos involucrados.
-Definir controles para la verificación y análisis de los procesos.
-Evaluar la posibilidad que los controles sean automáticos y en caso de serlos, definir como lo haría el sistema en términos generales.
-Analizar las configuraciones, requerimientos técnicos e interfaces, necesarias para realizar la automatización.
-Implementar la automatización.
-Ejecutar pruebas.
-Implementar.
', 2, 2)
GO
INSERT [dbo].[Test] ([Id], [Steps], [VersionOriginId], [TestOutcomeId]) VALUES (46, N'-Inventariar los administradores.
-Identificar aquellos administradores con perfil único.
-Priorizar los administradores que soporten los procesos más críticos.
-Determinar los diferentes perfiles de acceso posibles (alta, modificación, consulta).
-Determinar las posiciones asociadas a cada perfil para cada administrador.
-Formular un plan de actualización.
-Evaluar la posibilidad de redefinir el acceso a los administradores.
-Implementar los nuevos perfiles.
-Definir esquema de acceso por niveles de usuarios/roles/ambientes.
', 1, 1)
GO
INSERT [dbo].[Test] ([Id], [Steps], [VersionOriginId], [TestOutcomeId]) VALUES (47, N'-Relevar la operatoria del procesamiento de Tarjetas de Crédito online de los demás países. 
-Analizar  la posibilidad de estandarizar la operatoria.
-Evaluar las particularidades del procesamiento de las tarjetas de crédito de Chile y Colombia.
-Relevar los requerimientos con los usuarios.
-Indagar sobre los controles necesarios para una correcta operatoria.
-Analizar las configuraciones, requerimientos técnicos e interfaces, necesarias para realizar la automatización.
', 2, 2)
GO
INSERT [dbo].[Test] ([Id], [Steps], [VersionOriginId], [TestOutcomeId]) VALUES (48, N'-Relevar configuración actual de la cuenta puente.
-Determinar los atributos que debería tener la cuenta.
-Definir la nueva configuración de la cuenta puente.
-Asignar responsable de la cuenta puente.
-Definir la responsabilidad y rol del responsable de la cuenta.
-Analizar la restricción de acceso/transacciones de la cuenta.
-Implementar la nueva configuración de la cuenta puente.
-Determinar los controles que debe tener la cuenta, considerando por ejemplo: quien hizo movimientos, montos transferidos, usuarios afectados, operación asociada a ese monto, etc.
-Relevar y analizar funcionalidad actual del administrador.
-Evaluar la posibilidad de automatizar las imputaciones a la cuenta puente. 
-Evaluar la posibilidad de que los controles sean automáticos. Determinar la funcionalidad necesaria del administrador.
-Analizar las configuraciones, requerimientos técnicos e interfaces, necesarias para realizar la automatización.
-Desarrollar nuevas funcionalidades.
-Ejecutar pruebas.
-Implementar.
', 1, 2)
GO
INSERT [dbo].[Test] ([Id], [Steps], [VersionOriginId], [TestOutcomeId]) VALUES (49, N'-Revisar configuración actual.
-Relevar requerimiento del negocio.
-Analizar la viabilidad de actualizar el administrador actual ó bien, desarrollar uno nuevo que incorpore correctamente la funcionalidad.
-Realizar los desarrollos correspondientes.
-Ejecutar pruebas.
-Capacitar al usuario.
-Implementar.
', 2, 1)
GO
INSERT [dbo].[Test] ([Id], [Steps], [VersionOriginId], [TestOutcomeId]) VALUES (50, N'asdfasd', 2, 1)
GO
INSERT [dbo].[TestOutcome] ([Id], [Name], [Erased]) VALUES (1, N'Si', 0)
GO
INSERT [dbo].[TestOutcome] ([Id], [Name], [Erased]) VALUES (2, N'No', 0)
GO
SET IDENTITY_INSERT [dbo].[User] ON 

GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (1, N'admin@demo.com', N'Leandro', N'Briglio', N'1234', 0, 1)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (2, N'yanina@gmail.com', N'Yani', N'La', N'1234', 0, 1)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (3, N'sebaflorin@gmail.com', N'Sebastian', N'Florin', N'diegomuno', 0, 2)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (4, N'karen@deloitte.com', N'Karen', N'Franco', N'karen', 0, 3)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (5, N'jose@nec.com', N'Jose', N'Franco', N'jose', 0, 4)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (6, N'egonzalez@empresa1.com', N'Ezequiel', N'González', N'ezequiel', 0, 5)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (7, N'mgmiranda@empresa1.com', N'Mercedes', N'González Miranda', N'mercedes', 0, 5)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (8, N'jalcain@empresa1.com', N'Javier', N'Alcain', N'javier', 0, 5)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (9, N'apereyra@empresa1.com', N'Ariel Alejandro', N'Pereyra', N'ariel', 0, 5)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (10, N'aquevedo@empresa1.com', N'Analia', N'Quevedo', N'analia', 0, 5)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (11, N'ealvarez@empresa1.com', N'Emmanuel ', N'Alvarez', N'emmanuel', 0, 5)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (12, N'pdodino@empresa1.com', N'Pablo Javier', N'Dodino', N'pablo', 0, 5)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (13, N'jinovo@empresa2.com', N'Juan Ignacio', N'Novo', N'juan', 0, 6)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (14, N'cleonard@empresa2.com', N'Carolina', N'Leonard', N'carolina', 0, 6)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (15, N'mbaraschi@empresa2.com', N'Mayra', N'Baraschi', N'mayra', 0, 6)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (16, N'rcretella@empresa2.com', N'Rubén', N'Cretella', N'ruben', 0, 6)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (17, N'jcorona@empresa2.com', N'Javier', N'Corona', N'javier', 0, 6)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (18, N'ooliva@empresa2.com', N'Oliver', N'Oliva', N'oliver', 0, 6)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (19, N'dsantaran@empresa2.com', N'Daniela', N'Santarán', N'daniela', 0, 6)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (20, N'dmelaragno@empresa2.com', N'Daniela', N'Melaragno', N'daniela', 0, 6)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (21, N'cvaldivia@empresa3.com', N'Carolina', N'Valdivia', N'carolina', 0, 7)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (22, N'hcristaldo@empresa3.com', N'Hector', N'Cristaldo', N'hector', 0, 7)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (23, N'dcardenuto@empresa3.com', N'Daiana', N'Cardenuto', N'daiana', 0, 7)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (24, N'mmaragliano@empresa3.com', N'Matias', N'Maragliano', N'matias', 0, 7)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (25, N'mmaio@empresa3.com', N'Martin', N'Maio', N'martin', 0, 7)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (26, N'mmamarelli@empresa3.com', N'Marcelo', N'Mamarelli', N'marcelo', 0, 7)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (27, N'mpanizzi@unimoron.com', N'Marisa', N'Panizzi', N'marisa', 0, 8)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (28, N'jfranco@empresa2.com', N'Jose', N'Franco', N'jose', 0, 6)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (29, N'lauraf@empresa9.com', N'Laura', N'Fernandez', N'laura', 0, 9)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (30, N'tamaraP@empresa9.com', N'Tamara', N'Perez', N'tamara', 0, 9)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (31, N'lucase@empresa10.com', N'Lucas', N'Espingola', N'lucas', 0, 10)
GO
INSERT [dbo].[User] ([Id], [Email], [FirstName], [LastName], [Password], [Erased], [CompanyId]) VALUES (32, N'dsantaran@empresa2.com', N'Daniela', N'Santaran', N'daniela', 1, 6)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[VersionOrigin] ([Id], [Name], [Erased]) VALUES (1, N'Si', 0)
GO
INSERT [dbo].[VersionOrigin] ([Id], [Name], [Erased]) VALUES (2, N'No', 0)
GO
/****** Object:  Index [NCI_BackLogItem]    Script Date: 2/10/2016 11:59:19 a. m. ******/
CREATE NONCLUSTERED INDEX [NCI_BackLogItem] ON [dbo].[BacklogItem]
(
	[CreationDate] ASC,
	[Erased] ASC,
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [NCI_Change]    Script Date: 2/10/2016 11:59:19 a. m. ******/
CREATE NONCLUSTERED INDEX [NCI_Change] ON [dbo].[ChangeRequest]
(
	[ApprovalId] ASC,
	[ChangeTypeId] ASC,
	[ImpactId] ASC,
	[PriorityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [NCI_Project]    Script Date: 2/10/2016 11:59:19 a. m. ******/
CREATE NONCLUSTERED INDEX [NCI_Project] ON [dbo].[Project]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [NCI_Sprint]    Script Date: 2/10/2016 11:59:19 a. m. ******/
CREATE NONCLUSTERED INDEX [NCI_Sprint] ON [dbo].[Sprint]
(
	[Erased] ASC,
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [NCI_Task_General]    Script Date: 2/10/2016 11:59:19 a. m. ******/
CREATE NONCLUSTERED INDEX [NCI_Task_General] ON [dbo].[Task]
(
	[Erased] ASC,
	[BacklogItemId] ASC,
	[SprintId] ASC,
	[CreationDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [NCI_Task_StateId]    Script Date: 2/10/2016 11:59:19 a. m. ******/
CREATE NONCLUSTERED INDEX [NCI_Task_StateId] ON [dbo].[Task]
(
	[TaskStateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [NCI_TaskUpdate]    Script Date: 2/10/2016 11:59:19 a. m. ******/
CREATE NONCLUSTERED INDEX [NCI_TaskUpdate] ON [dbo].[TaskUpdate]
(
	[Erased] ASC,
	[TaskId] ASC,
	[EventDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [NCI_Team]    Script Date: 2/10/2016 11:59:19 a. m. ******/
CREATE NONCLUSTERED INDEX [NCI_Team] ON [dbo].[Team]
(
	[Erased] ASC,
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [NCI_TeamMember]    Script Date: 2/10/2016 11:59:19 a. m. ******/
CREATE NONCLUSTERED INDEX [NCI_TeamMember] ON [dbo].[TeamMember]
(
	[Erased] ASC,
	[TeamId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [NCI_Test]    Script Date: 2/10/2016 11:59:19 a. m. ******/
CREATE NONCLUSTERED INDEX [NCI_Test] ON [dbo].[Test]
(
	[VersionOriginId] ASC,
	[TestOutcomeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NCI_User_Name_Company]    Script Date: 2/10/2016 11:59:19 a. m. ******/
CREATE NONCLUSTERED INDEX [NCI_User_Name_Company] ON [dbo].[User]
(
	[Erased] ASC,
	[Email] ASC,
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
ALTER TABLE [dbo].[BacklogItem]  WITH CHECK ADD FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[ChangeRequest]  WITH CHECK ADD FOREIGN KEY([ApprovalId])
REFERENCES [dbo].[Approval] ([Id])
GO
ALTER TABLE [dbo].[ChangeRequest]  WITH CHECK ADD FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeType] ([Id])
GO
ALTER TABLE [dbo].[ChangeRequest]  WITH CHECK ADD FOREIGN KEY([ImpactId])
REFERENCES [dbo].[Impact] ([Id])
GO
ALTER TABLE [dbo].[ChangeRequest]  WITH CHECK ADD FOREIGN KEY([PriorityId])
REFERENCES [dbo].[Priority] ([Id])
GO
ALTER TABLE [dbo].[ChangeRequest]  WITH CHECK ADD FOREIGN KEY([Id])
REFERENCES [dbo].[BacklogItem] ([Id])
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Sprint]  WITH CHECK ADD FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD FOREIGN KEY([BacklogItemId])
REFERENCES [dbo].[BacklogItem] ([Id])
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD FOREIGN KEY([SprintId])
REFERENCES [dbo].[Sprint] ([Id])
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD FOREIGN KEY([TaskStateId])
REFERENCES [dbo].[TaskState] ([Id])
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TaskUpdate]  WITH CHECK ADD FOREIGN KEY([PreviousTaskStateId])
REFERENCES [dbo].[TaskState] ([Id])
GO
ALTER TABLE [dbo].[TaskUpdate]  WITH CHECK ADD FOREIGN KEY([TaskId])
REFERENCES [dbo].[Task] ([Id])
GO
ALTER TABLE [dbo].[TaskUpdate]  WITH CHECK ADD FOREIGN KEY([TaskStateId])
REFERENCES [dbo].[TaskState] ([Id])
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[TeamMember]  WITH CHECK ADD FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[TeamMember]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD FOREIGN KEY([Id])
REFERENCES [dbo].[BacklogItem] ([Id])
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD FOREIGN KEY([TestOutcomeId])
REFERENCES [dbo].[TestOutcome] ([Id])
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD FOREIGN KEY([VersionOriginId])
REFERENCES [dbo].[VersionOrigin] ([Id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Agil-Devtil] SET  READ_WRITE 
GO
