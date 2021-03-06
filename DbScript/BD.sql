USE [master]
GO
/****** Object:  Database [VirtualHosp]    Script Date: 6/12/2021 22:11:26 ******/
CREATE DATABASE [VirtualHosp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VirtualHosp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS03\MSSQL\DATA\VirtualHosp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VirtualHosp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS03\MSSQL\DATA\VirtualHosp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VirtualHosp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VirtualHosp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VirtualHosp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VirtualHosp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VirtualHosp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VirtualHosp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VirtualHosp] SET ARITHABORT OFF 
GO
ALTER DATABASE [VirtualHosp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VirtualHosp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VirtualHosp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VirtualHosp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VirtualHosp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VirtualHosp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VirtualHosp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VirtualHosp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VirtualHosp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VirtualHosp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VirtualHosp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VirtualHosp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VirtualHosp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VirtualHosp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VirtualHosp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VirtualHosp] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [VirtualHosp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VirtualHosp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VirtualHosp] SET  MULTI_USER 
GO
ALTER DATABASE [VirtualHosp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VirtualHosp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VirtualHosp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VirtualHosp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VirtualHosp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VirtualHosp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [VirtualHosp] SET QUERY_STORE = OFF
GO
USE [VirtualHosp]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/12/2021 22:11:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consultas]    Script Date: 6/12/2021 22:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[MedicoId] [int] NULL,
	[Estado] [int] NOT NULL,
	[Coseguro] [float] NOT NULL,
	[PacienteId] [int] NULL,
	[ConsultaDescripcion] [nvarchar](max) NULL,
	[RespuestaMedico] [nvarchar](max) NULL,
	[Especialidad] [int] NOT NULL,
 CONSTRAINT [PK_Consultas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudios]    Script Date: 6/12/2021 22:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Especialidad] [int] NOT NULL,
	[PacienteId] [int] NULL,
 CONSTRAINT [PK_Estudios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 6/12/2021 22:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Apellido] [nvarchar](max) NOT NULL,
	[Especialidad] [int] NOT NULL,
	[NumeroMatricula] [int] NOT NULL,
	[Ciudad] [nvarchar](max) NULL,
	[CodigoPostal] [int] NULL,
	[Direccion] [nvarchar](max) NULL,
	[EstadoCivil] [int] NULL,
	[Nacionalidad] [nvarchar](max) NULL,
	[NumeroDocumento] [int] NOT NULL,
	[TipoDocumento] [int] NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[FechaNacimiento] [datetime2](7) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Medicos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 6/12/2021 22:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Apellido] [nvarchar](max) NOT NULL,
	[FechaNacimiento] [datetime2](7) NOT NULL,
	[TipoDocumento] [int] NOT NULL,
	[NumeroDocumento] [int] NOT NULL,
	[EstadoCivil] [int] NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Direccion] [nvarchar](max) NULL,
	[Nacionalidad] [nvarchar](max) NULL,
	[Ciudad] [nvarchar](max) NULL,
	[CodigoPostal] [int] NULL,
	[Password] [nvarchar](30) NOT NULL,
	[Plan] [int] NOT NULL,
	[HistorialMedico] [nvarchar](max) NULL,
	[AntecedentesMedicos] [nvarchar](max) NULL,
	[Medicamentos] [nvarchar](max) NULL,
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes2]    Script Date: 6/12/2021 22:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes2](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Apellido] [nvarchar](max) NOT NULL,
	[FechaNacimiento] [datetime2](7) NOT NULL,
	[TipoDocumento] [int] NOT NULL,
	[NumeroDocumento] [int] NOT NULL,
	[EstadoCivil] [int] NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Direccion] [nvarchar](max) NULL,
	[Nacionalidad] [nvarchar](max) NULL,
	[Ciudad] [nvarchar](max) NULL,
	[CodigoPostal] [int] NULL,
	[Password] [nvarchar](30) NOT NULL,
	[Plan] [int] NOT NULL,
	[HistorialMedico] [nvarchar](max) NULL,
	[AntecedentesMedicos] [nvarchar](max) NULL,
	[Medicamentos] [nvarchar](max) NULL,
 CONSTRAINT [PK_Pacientes2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210603020532_CreateVirtualHostpDb', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210610004847_VirtualHosp.Context.HospitalDbContext', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210704210545_Medicos', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210704213316_Medicos2', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210704213447_Medicos3', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210704213603_Medicos4', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210704213720_Medicos5', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210704213915_Medicos6', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210704220151_Medicos7', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210704220343_Medicos8', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210711235812_consulta1', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210712001619_new1', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210712001734_new2', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210712002409_new3', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210712010057_new4', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210712010122_new5', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210712015737_new6', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210712020802_new7', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210712021640_new8', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210712023048_new9', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210712023553_new10', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210712161037_especialidadConsulta', N'3.1.15')
GO
SET IDENTITY_INSERT [dbo].[Consultas] ON 

INSERT [dbo].[Consultas] ([Id], [Fecha], [MedicoId], [Estado], [Coseguro], [PacienteId], [ConsultaDescripcion], [RespuestaMedico], [Especialidad]) VALUES (2, CAST(N'2021-07-11T00:00:00.0000000' AS DateTime2), 1, 4, 800, 1, N'Tengo un esguince', N'Presencial', 0)
INSERT [dbo].[Consultas] ([Id], [Fecha], [MedicoId], [Estado], [Coseguro], [PacienteId], [ConsultaDescripcion], [RespuestaMedico], [Especialidad]) VALUES (5, CAST(N'2021-07-17T00:00:00.0000000' AS DateTime2), 1, 3, 800, 2, N'No se presento', N'AUSENTE', 1)
INSERT [dbo].[Consultas] ([Id], [Fecha], [MedicoId], [Estado], [Coseguro], [PacienteId], [ConsultaDescripcion], [RespuestaMedico], [Especialidad]) VALUES (7, CAST(N'2021-07-12T00:00:00.0000000' AS DateTime2), 2, 0, 500, 3, N'Primera consulta', NULL, 0)
INSERT [dbo].[Consultas] ([Id], [Fecha], [MedicoId], [Estado], [Coseguro], [PacienteId], [ConsultaDescripcion], [RespuestaMedico], [Especialidad]) VALUES (8, CAST(N'2021-07-12T00:00:00.0000000' AS DateTime2), 3, 4, 650, 2, N'Prueba coseguro', N'Prueba con pagarlo', 0)
INSERT [dbo].[Consultas] ([Id], [Fecha], [MedicoId], [Estado], [Coseguro], [PacienteId], [ConsultaDescripcion], [RespuestaMedico], [Especialidad]) VALUES (9, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2), 5, 4, 500, 5, N'Dolor de cabeza', N'Ibuprofeno', 0)
INSERT [dbo].[Consultas] ([Id], [Fecha], [MedicoId], [Estado], [Coseguro], [PacienteId], [ConsultaDescripcion], [RespuestaMedico], [Especialidad]) VALUES (10, CAST(N'2021-12-07T00:00:00.0000000' AS DateTime2), 4, 4, 650, 2, N'pie esguince', N'se necesita atencion presencial', 0)
INSERT [dbo].[Consultas] ([Id], [Fecha], [MedicoId], [Estado], [Coseguro], [PacienteId], [ConsultaDescripcion], [RespuestaMedico], [Especialidad]) VALUES (11, CAST(N'2021-12-08T00:00:00.0000000' AS DateTime2), NULL, 0, 500, NULL, N'Diente roto', NULL, 0)
SET IDENTITY_INSERT [dbo].[Consultas] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicos] ON 

INSERT [dbo].[Medicos] ([Id], [Nombre], [Apellido], [Especialidad], [NumeroMatricula], [Ciudad], [CodigoPostal], [Direccion], [EstadoCivil], [Nacionalidad], [NumeroDocumento], [TipoDocumento], [Email], [FechaNacimiento], [Password]) VALUES (1, N'Juan', N'Sabe', 1, 10, N'CABA', 1244, N'La Rioja', 0, N'Argentina', 36363636, 0, N'gm92@gg.com', CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), N'test1')
INSERT [dbo].[Medicos] ([Id], [Nombre], [Apellido], [Especialidad], [NumeroMatricula], [Ciudad], [CodigoPostal], [Direccion], [EstadoCivil], [Nacionalidad], [NumeroDocumento], [TipoDocumento], [Email], [FechaNacimiento], [Password]) VALUES (2, N'Juan2', N'Sabe', 0, 10, N'caba', 1244, N'test', 0, N'Colombia', 12121212, 0, N'gmm@tete.com', CAST(N'2222-01-01T00:00:00.0000000' AS DateTime2), N'test2')
INSERT [dbo].[Medicos] ([Id], [Nombre], [Apellido], [Especialidad], [NumeroMatricula], [Ciudad], [CodigoPostal], [Direccion], [EstadoCivil], [Nacionalidad], [NumeroDocumento], [TipoDocumento], [Email], [FechaNacimiento], [Password]) VALUES (3, N'Marta', N'Leopoldo', 2, 9999, N'CABA', 1244, N'Mi casa', 1, N'Peru', 2132132, 0, N'prueba@test.com', CAST(N'2021-07-12T00:00:00.0000000' AS DateTime2), N'test12')
INSERT [dbo].[Medicos] ([Id], [Nombre], [Apellido], [Especialidad], [NumeroMatricula], [Ciudad], [CodigoPostal], [Direccion], [EstadoCivil], [Nacionalidad], [NumeroDocumento], [TipoDocumento], [Email], [FechaNacimiento], [Password]) VALUES (4, N'Gabriel', N'Fontana', 2, 456497, N'CABA', 1244, N'Av Brasil', 2, N'Español', 36787747, 2, N'gmmolina1992@gmail.com', CAST(N'1992-05-16T00:00:00.0000000' AS DateTime2), N'testm2')
INSERT [dbo].[Medicos] ([Id], [Nombre], [Apellido], [Especialidad], [NumeroMatricula], [Ciudad], [CodigoPostal], [Direccion], [EstadoCivil], [Nacionalidad], [NumeroDocumento], [TipoDocumento], [Email], [FechaNacimiento], [Password]) VALUES (5, N'Gonza Martin', N'Molina', 0, 1234, NULL, NULL, NULL, 1, NULL, 36896597, 0, N'gmm99@gmail.com', CAST(N'2021-07-01T00:00:00.0000000' AS DateTime2), N'test123')
INSERT [dbo].[Medicos] ([Id], [Nombre], [Apellido], [Especialidad], [NumeroMatricula], [Ciudad], [CodigoPostal], [Direccion], [EstadoCivil], [Nacionalidad], [NumeroDocumento], [TipoDocumento], [Email], [FechaNacimiento], [Password]) VALUES (6, N'Juan', N'Nuevo1', 0, 1234, N'test', 1244, N'test123', 1, N'Arg', 1234, 0, N'gm@test.com', CAST(N'2021-12-06T00:00:00.0000000' AS DateTime2), N'test123')
SET IDENTITY_INSERT [dbo].[Medicos] OFF
GO
SET IDENTITY_INSERT [dbo].[Pacientes] ON 

INSERT [dbo].[Pacientes] ([Id], [Nombre], [Apellido], [FechaNacimiento], [TipoDocumento], [NumeroDocumento], [EstadoCivil], [Email], [Direccion], [Nacionalidad], [Ciudad], [CodigoPostal], [Password], [Plan], [HistorialMedico], [AntecedentesMedicos], [Medicamentos]) VALUES (1, N'Nombre', N'Apellido', CAST(N'2021-07-08T00:00:00.0000000' AS DateTime2), 0, 165198198, 1, N'gmm2@test.com', NULL, NULL, NULL, NULL, N'test1', 1, NULL, NULL, NULL)
INSERT [dbo].[Pacientes] ([Id], [Nombre], [Apellido], [FechaNacimiento], [TipoDocumento], [NumeroDocumento], [EstadoCivil], [Email], [Direccion], [Nacionalidad], [Ciudad], [CodigoPostal], [Password], [Plan], [HistorialMedico], [AntecedentesMedicos], [Medicamentos]) VALUES (2, N'Gonza', N'Molina', CAST(N'2021-07-02T00:00:00.0000000' AS DateTime2), 0, 121212, 1, N'gmoo@test2.com', N'Casa falsa', N'Argentina', N'CABA', 1244, N'test2', 2, N'Nada', NULL, N'Muchos')
INSERT [dbo].[Pacientes] ([Id], [Nombre], [Apellido], [FechaNacimiento], [TipoDocumento], [NumeroDocumento], [EstadoCivil], [Email], [Direccion], [Nacionalidad], [Ciudad], [CodigoPostal], [Password], [Plan], [HistorialMedico], [AntecedentesMedicos], [Medicamentos]) VALUES (3, N'Sabeeeee', N'Mendoza', CAST(N'2021-06-28T00:00:00.0000000' AS DateTime2), 0, 546546, 3, N'test@mail.com', NULL, NULL, NULL, NULL, N'test6', 0, NULL, NULL, NULL)
INSERT [dbo].[Pacientes] ([Id], [Nombre], [Apellido], [FechaNacimiento], [TipoDocumento], [NumeroDocumento], [EstadoCivil], [Email], [Direccion], [Nacionalidad], [Ciudad], [CodigoPostal], [Password], [Plan], [HistorialMedico], [AntecedentesMedicos], [Medicamentos]) VALUES (4, N'Pablo', N'Aimar', CAST(N'2015-02-11T00:00:00.0000000' AS DateTime2), 1, 45478787, 1, N'testeoRapido@hotmail.com', N'San Juan 2333', N'Frances', N'Cordoba', 1233, N'trato123', 2, N'Lesion rodilla', NULL, N'Ibuprofeno')
INSERT [dbo].[Pacientes] ([Id], [Nombre], [Apellido], [FechaNacimiento], [TipoDocumento], [NumeroDocumento], [EstadoCivil], [Email], [Direccion], [Nacionalidad], [Ciudad], [CodigoPostal], [Password], [Plan], [HistorialMedico], [AntecedentesMedicos], [Medicamentos]) VALUES (5, N'Nombre Paciente', N'Paciente', CAST(N'2021-07-12T00:00:00.0000000' AS DateTime2), 0, 123456, 0, N'123@gm.com', NULL, NULL, NULL, NULL, N'teat123', 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Pacientes] OFF
GO
/****** Object:  Index [IX_Consultas_MedicoId]    Script Date: 6/12/2021 22:11:26 ******/
CREATE NONCLUSTERED INDEX [IX_Consultas_MedicoId] ON [dbo].[Consultas]
(
	[MedicoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Consultas_PacienteId]    Script Date: 6/12/2021 22:11:26 ******/
CREATE NONCLUSTERED INDEX [IX_Consultas_PacienteId] ON [dbo].[Consultas]
(
	[PacienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Estudios_PacienteId]    Script Date: 6/12/2021 22:11:26 ******/
CREATE NONCLUSTERED INDEX [IX_Estudios_PacienteId] ON [dbo].[Estudios]
(
	[PacienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Consultas] ADD  DEFAULT ((0)) FOR [Especialidad]
GO
ALTER TABLE [dbo].[Medicos] ADD  DEFAULT ((0)) FOR [NumeroDocumento]
GO
ALTER TABLE [dbo].[Medicos] ADD  DEFAULT ((0)) FOR [TipoDocumento]
GO
ALTER TABLE [dbo].[Medicos] ADD  DEFAULT (N'') FOR [Email]
GO
ALTER TABLE [dbo].[Medicos] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [FechaNacimiento]
GO
ALTER TABLE [dbo].[Medicos] ADD  DEFAULT (N'') FOR [Password]
GO
ALTER TABLE [dbo].[Consultas]  WITH CHECK ADD  CONSTRAINT [FK_Consultas_Medicos_MedicoId] FOREIGN KEY([MedicoId])
REFERENCES [dbo].[Medicos] ([Id])
GO
ALTER TABLE [dbo].[Consultas] CHECK CONSTRAINT [FK_Consultas_Medicos_MedicoId]
GO
ALTER TABLE [dbo].[Consultas]  WITH CHECK ADD  CONSTRAINT [FK_Consultas_Pacientes_PacienteId] FOREIGN KEY([PacienteId])
REFERENCES [dbo].[Pacientes] ([Id])
GO
ALTER TABLE [dbo].[Consultas] CHECK CONSTRAINT [FK_Consultas_Pacientes_PacienteId]
GO
ALTER TABLE [dbo].[Estudios]  WITH CHECK ADD  CONSTRAINT [FK_Estudios_Pacientes_PacienteId] FOREIGN KEY([PacienteId])
REFERENCES [dbo].[Pacientes] ([Id])
GO
ALTER TABLE [dbo].[Estudios] CHECK CONSTRAINT [FK_Estudios_Pacientes_PacienteId]
GO
/****** Object:  DdlTrigger [TR_DoNotDropTables]    Script Date: 6/12/2021 22:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [TR_DoNotDropTables] 

ON DATABASE

FOR DROP_TABLE

AS

  RAISERROR ('Cannot drop tables!', 10, 1);

  ROLLBACK;

 

GO
ENABLE TRIGGER [TR_DoNotDropTables] ON DATABASE
GO
USE [master]
GO
ALTER DATABASE [VirtualHosp] SET  READ_WRITE 
GO
