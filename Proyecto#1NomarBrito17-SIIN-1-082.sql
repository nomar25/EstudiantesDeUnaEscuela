USE [master]
GO
/****** Base de datos de estudiantes creada por ******/
/****** Nomar brito   17-SIIN-1-082 ******/
/****** No subi la diapositiva a slideShare por que me da error al poner el numero telefonico al crearme una cuenta ******/
/****** Hubiese hecho algo mejor pero el grupo en el que estaba se decidio quemar y no hacer nada asi que hice lo que pude solo (no lo tome como excusa) ******/
CREATE DATABASE [ColegioDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ColegioDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\ColegioDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ColegioDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\ColegioDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ColegioDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ColegioDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ColegioDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ColegioDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ColegioDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ColegioDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ColegioDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ColegioDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ColegioDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ColegioDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ColegioDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ColegioDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ColegioDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ColegioDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ColegioDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ColegioDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ColegioDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ColegioDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ColegioDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ColegioDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ColegioDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ColegioDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ColegioDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ColegioDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ColegioDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ColegioDb] SET  MULTI_USER 
GO
ALTER DATABASE [ColegioDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ColegioDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ColegioDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ColegioDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ColegioDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ColegioDb] SET QUERY_STORE = OFF
GO
USE [ColegioDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ColegioDb]
GO
/****** Object:  Table [dbo].[Calificaciones]    Script Date: 14/04/2019 23:36:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificaciones](
	[CalificacionId] [int] NOT NULL,
	[MateriaId] [int] NULL,
	[EstudianteId] [int] NULL,
	[ProfesorId] [int] NULL,
	[Calificacion1] [float] NULL,
	[Calificacion2] [float] NULL,
	[Calificacion3] [float] NULL,
	[Calificacion4] [float] NULL,
	[Promedio] [float] NULL,
	[ExamenFinal] [float] NULL,
	[CalificacionFinal] [int] NULL,
 CONSTRAINT [PK_Calificaciones] PRIMARY KEY CLUSTERED 
(
	[CalificacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursos]    Script Date: 14/04/2019 23:36:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos](
	[CursoId] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Horario] [varchar](20) NULL,
 CONSTRAINT [PK_Cursos] PRIMARY KEY CLUSTERED 
(
	[CursoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiantes]    Script Date: 14/04/2019 23:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiantes](
	[EstudianteId] [int] NOT NULL,
	[Nombre] [varchar](60) NULL,
	[Matricula] [varchar](20) NULL,
	[CursoId] [int] NULL,
	[FechaNacimiento] [datetime] NULL,
	[Sexo] [char](1) NULL,
	[Direccion] [varchar](250) NULL,
 CONSTRAINT [PK_Estudiantes] PRIMARY KEY CLUSTERED 
(
	[EstudianteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materias]    Script Date: 14/04/2019 23:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materias](
	[MateriaId] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[CursoId] [int] NULL,
	[ProfesorId] [int] NULL,
 CONSTRAINT [PK_Materias] PRIMARY KEY CLUSTERED 
(
	[MateriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesores]    Script Date: 14/04/2019 23:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesores](
	[ProfesorId] [int] NOT NULL,
	[Nombre] [varchar](60) NULL,
	[Direccion] [varchar](250) NULL,
	[Sexo] [char](1) NULL,
	[Telefono] [varchar](13) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Profesores] PRIMARY KEY CLUSTERED 
(
	[ProfesorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Calificaciones] ([CalificacionId], [MateriaId], [EstudianteId], [ProfesorId], [Calificacion1], [Calificacion2], [Calificacion3], [Calificacion4], [Promedio], [ExamenFinal], [CalificacionFinal]) VALUES (1, 1, 1, 1, 10, 10, 10, 10, 40, 50, 90)
INSERT [dbo].[Calificaciones] ([CalificacionId], [MateriaId], [EstudianteId], [ProfesorId], [Calificacion1], [Calificacion2], [Calificacion3], [Calificacion4], [Promedio], [ExamenFinal], [CalificacionFinal]) VALUES (2, 2, 2, 2, 15, 15, 5, 10, 45, 40, 85)
INSERT [dbo].[Calificaciones] ([CalificacionId], [MateriaId], [EstudianteId], [ProfesorId], [Calificacion1], [Calificacion2], [Calificacion3], [Calificacion4], [Promedio], [ExamenFinal], [CalificacionFinal]) VALUES (3, 3, 3, 3, 10, 10, 10, 10, 40, 40, 80)
INSERT [dbo].[Calificaciones] ([CalificacionId], [MateriaId], [EstudianteId], [ProfesorId], [Calificacion1], [Calificacion2], [Calificacion3], [Calificacion4], [Promedio], [ExamenFinal], [CalificacionFinal]) VALUES (4, 4, 4, 4, 10, 15, 20, 5, 50, 30, 80)
INSERT [dbo].[Calificaciones] ([CalificacionId], [MateriaId], [EstudianteId], [ProfesorId], [Calificacion1], [Calificacion2], [Calificacion3], [Calificacion4], [Promedio], [ExamenFinal], [CalificacionFinal]) VALUES (5, 5, 5, 5, 15, 15, 15, 0, 45, 45, 90)
INSERT [dbo].[Calificaciones] ([CalificacionId], [MateriaId], [EstudianteId], [ProfesorId], [Calificacion1], [Calificacion2], [Calificacion3], [Calificacion4], [Promedio], [ExamenFinal], [CalificacionFinal]) VALUES (6, 6, 6, 6, 10, 10, 10, 20, 50, 50, 100)
INSERT [dbo].[Calificaciones] ([CalificacionId], [MateriaId], [EstudianteId], [ProfesorId], [Calificacion1], [Calificacion2], [Calificacion3], [Calificacion4], [Promedio], [ExamenFinal], [CalificacionFinal]) VALUES (7, 7, 7, 7, 10, 5, 15, 5, 35, 50, 85)
INSERT [dbo].[Calificaciones] ([CalificacionId], [MateriaId], [EstudianteId], [ProfesorId], [Calificacion1], [Calificacion2], [Calificacion3], [Calificacion4], [Promedio], [ExamenFinal], [CalificacionFinal]) VALUES (8, 8, 8, 8, 10, 10, 15, 5, 40, 40, 80)
INSERT [dbo].[Calificaciones] ([CalificacionId], [MateriaId], [EstudianteId], [ProfesorId], [Calificacion1], [Calificacion2], [Calificacion3], [Calificacion4], [Promedio], [ExamenFinal], [CalificacionFinal]) VALUES (9, 9, 9, 9, 15, 5, 5, 10, 35, 35, 70)
INSERT [dbo].[Calificaciones] ([CalificacionId], [MateriaId], [EstudianteId], [ProfesorId], [Calificacion1], [Calificacion2], [Calificacion3], [Calificacion4], [Promedio], [ExamenFinal], [CalificacionFinal]) VALUES (10, 10, 10, 10, 10, 5, 20, 15, 50, 45, 95)
INSERT [dbo].[Cursos] ([CursoId], [Nombre], [Horario]) VALUES (1, N'Primero De Bachiller', N'Mañana')
INSERT [dbo].[Cursos] ([CursoId], [Nombre], [Horario]) VALUES (2, N'Segundo De Bachiller', N'Mañana')
INSERT [dbo].[Cursos] ([CursoId], [Nombre], [Horario]) VALUES (3, N'Tercero De Bachiller', N'Mañana')
INSERT [dbo].[Cursos] ([CursoId], [Nombre], [Horario]) VALUES (4, N'Cuarto De Bachiller', N'Mañana')
INSERT [dbo].[Cursos] ([CursoId], [Nombre], [Horario]) VALUES (5, N'Quinto De Bachiller', N'Mañana')
INSERT [dbo].[Cursos] ([CursoId], [Nombre], [Horario]) VALUES (6, N'Primero De Bachilller', N'Tarde')
INSERT [dbo].[Cursos] ([CursoId], [Nombre], [Horario]) VALUES (7, N'Segundo De Bachiller', N'Tarde')
INSERT [dbo].[Cursos] ([CursoId], [Nombre], [Horario]) VALUES (8, N'Tercero De Bachiller', N'Tarde')
INSERT [dbo].[Cursos] ([CursoId], [Nombre], [Horario]) VALUES (9, N'Cuarto De Bachiller', N'Tarde')
INSERT [dbo].[Cursos] ([CursoId], [Nombre], [Horario]) VALUES (10, N'Quinto De Bachiller', N'Tarde')
INSERT [dbo].[Estudiantes] ([EstudianteId], [Nombre], [Matricula], [CursoId], [FechaNacimiento], [Sexo], [Direccion]) VALUES (1, N'Peter Petreli', N'11223344', 1, CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'M', N'Calle11')
INSERT [dbo].[Estudiantes] ([EstudianteId], [Nombre], [Matricula], [CursoId], [FechaNacimiento], [Sexo], [Direccion]) VALUES (2, N'Manuel Perrin', N'22334455', 2, CAST(N'2001-02-02T00:00:00.000' AS DateTime), N'M', N'Calle12')
INSERT [dbo].[Estudiantes] ([EstudianteId], [Nombre], [Matricula], [CursoId], [FechaNacimiento], [Sexo], [Direccion]) VALUES (3, N'Josefina Gaso', N'33445566', 3, CAST(N'2002-03-03T00:00:00.000' AS DateTime), N'F', N'Calle13')
INSERT [dbo].[Estudiantes] ([EstudianteId], [Nombre], [Matricula], [CursoId], [FechaNacimiento], [Sexo], [Direccion]) VALUES (4, N'Mariana Diez', N'44556677', 4, CAST(N'2000-02-02T00:00:00.000' AS DateTime), N'F', N'Calle14')
INSERT [dbo].[Estudiantes] ([EstudianteId], [Nombre], [Matricula], [CursoId], [FechaNacimiento], [Sexo], [Direccion]) VALUES (5, N'Jael Perez', N'55667788', 5, CAST(N'2001-03-03T00:00:00.000' AS DateTime), N'M', N'Calle15')
INSERT [dbo].[Estudiantes] ([EstudianteId], [Nombre], [Matricula], [CursoId], [FechaNacimiento], [Sexo], [Direccion]) VALUES (6, N'Leonel Medina', N'66778899', 6, CAST(N'2002-04-04T00:00:00.000' AS DateTime), N'M', N'Calle16')
INSERT [dbo].[Estudiantes] ([EstudianteId], [Nombre], [Matricula], [CursoId], [FechaNacimiento], [Sexo], [Direccion]) VALUES (7, N'Danilo Fernandez', N'77889900', 7, CAST(N'1999-12-12T00:00:00.000' AS DateTime), N'M', N'Calle17')
INSERT [dbo].[Estudiantes] ([EstudianteId], [Nombre], [Matricula], [CursoId], [FechaNacimiento], [Sexo], [Direccion]) VALUES (8, N'Lord Voldemord', N'88990011', 8, CAST(N'1998-01-01T00:00:00.000' AS DateTime), N'M', N'Hogwarts')
INSERT [dbo].[Estudiantes] ([EstudianteId], [Nombre], [Matricula], [CursoId], [FechaNacimiento], [Sexo], [Direccion]) VALUES (9, N'Gabriel Gaton', N'99001122', 9, CAST(N'1999-02-02T00:00:00.000' AS DateTime), N'M', N'Calle18')
INSERT [dbo].[Estudiantes] ([EstudianteId], [Nombre], [Matricula], [CursoId], [FechaNacimiento], [Sexo], [Direccion]) VALUES (10, N'Bryan Palomin', N'00112233', 10, CAST(N'2001-12-12T00:00:00.000' AS DateTime), N'M', N'Calle19')
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [CursoId], [ProfesorId]) VALUES (1, N'Base De Datos', 1, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [CursoId], [ProfesorId]) VALUES (2, N'Matematica', 2, 2)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [CursoId], [ProfesorId]) VALUES (3, N'Español', 3, 3)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [CursoId], [ProfesorId]) VALUES (4, N'Fisica', 4, 4)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [CursoId], [ProfesorId]) VALUES (5, N'Quimica', 5, 5)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [CursoId], [ProfesorId]) VALUES (6, N'Dibujo', 6, 6)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [CursoId], [ProfesorId]) VALUES (7, N'Formacion', 7, 7)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [CursoId], [ProfesorId]) VALUES (8, N'Civica', 8, 8)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [CursoId], [ProfesorId]) VALUES (9, N'Informatica', 9, 9)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [CursoId], [ProfesorId]) VALUES (10, N'Historia', 10, 10)
INSERT [dbo].[Profesores] ([ProfesorId], [Nombre], [Direccion], [Sexo], [Telefono], [Email]) VALUES (1, N'Starling', N'Calle1', N'M', N'8492077714', N'sgermosen@praysoft.com')
INSERT [dbo].[Profesores] ([ProfesorId], [Nombre], [Direccion], [Sexo], [Telefono], [Email]) VALUES (2, N'Jose', N'Calle2', N'M', N'8091234567', N'jose@hotmail.com')
INSERT [dbo].[Profesores] ([ProfesorId], [Nombre], [Direccion], [Sexo], [Telefono], [Email]) VALUES (3, N'Maria', N'Calle3', N'F', N'8094567899', N'maria@hotmail.com')
INSERT [dbo].[Profesores] ([ProfesorId], [Nombre], [Direccion], [Sexo], [Telefono], [Email]) VALUES (4, N'Patricia', N'Calle4', N'F', N'8291645899', N'patricia@hotmail.com')
INSERT [dbo].[Profesores] ([ProfesorId], [Nombre], [Direccion], [Sexo], [Telefono], [Email]) VALUES (5, N'Maicol', N'Calle5', N'M', N'8094567888', N'maicol@gmail.com')
INSERT [dbo].[Profesores] ([ProfesorId], [Nombre], [Direccion], [Sexo], [Telefono], [Email]) VALUES (6, N'Pedro', N'Calle6', N'M', N'8294567899', N'pedro@gmail.com')
INSERT [dbo].[Profesores] ([ProfesorId], [Nombre], [Direccion], [Sexo], [Telefono], [Email]) VALUES (7, N'Michel', N'Calle7', N'F', N'8094578963', N'michel@hotmail.com')
INSERT [dbo].[Profesores] ([ProfesorId], [Nombre], [Direccion], [Sexo], [Telefono], [Email]) VALUES (8, N'Alberto', N'Calle8', N'M', N'8497856548', N'alberto@hotmail.com')
INSERT [dbo].[Profesores] ([ProfesorId], [Nombre], [Direccion], [Sexo], [Telefono], [Email]) VALUES (9, N'Harry', N'Calle9', N'M', N'8094741256', N'harry@gmail.com')
INSERT [dbo].[Profesores] ([ProfesorId], [Nombre], [Direccion], [Sexo], [Telefono], [Email]) VALUES (10, N'Ramon', N'Calle10', N'M', N'8495665231', N'ramon@hotmail.com')
ALTER TABLE [dbo].[Calificaciones]  WITH CHECK ADD  CONSTRAINT [FK_Calificaciones_Estudiantes] FOREIGN KEY([EstudianteId])
REFERENCES [dbo].[Estudiantes] ([EstudianteId])
GO
ALTER TABLE [dbo].[Calificaciones] CHECK CONSTRAINT [FK_Calificaciones_Estudiantes]
GO
ALTER TABLE [dbo].[Calificaciones]  WITH CHECK ADD  CONSTRAINT [FK_Calificaciones_Materias] FOREIGN KEY([MateriaId])
REFERENCES [dbo].[Materias] ([MateriaId])
GO
ALTER TABLE [dbo].[Calificaciones] CHECK CONSTRAINT [FK_Calificaciones_Materias]
GO
ALTER TABLE [dbo].[Calificaciones]  WITH CHECK ADD  CONSTRAINT [FK_Calificaciones_Profesores] FOREIGN KEY([ProfesorId])
REFERENCES [dbo].[Profesores] ([ProfesorId])
GO
ALTER TABLE [dbo].[Calificaciones] CHECK CONSTRAINT [FK_Calificaciones_Profesores]
GO
ALTER TABLE [dbo].[Estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_Estudiantes_Cursos] FOREIGN KEY([CursoId])
REFERENCES [dbo].[Cursos] ([CursoId])
GO
ALTER TABLE [dbo].[Estudiantes] CHECK CONSTRAINT [FK_Estudiantes_Cursos]
GO
ALTER TABLE [dbo].[Materias]  WITH CHECK ADD  CONSTRAINT [FK_Materias_Cursos] FOREIGN KEY([CursoId])
REFERENCES [dbo].[Cursos] ([CursoId])
GO
ALTER TABLE [dbo].[Materias] CHECK CONSTRAINT [FK_Materias_Cursos]
GO
ALTER TABLE [dbo].[Materias]  WITH CHECK ADD  CONSTRAINT [FK_Materias_Profesores] FOREIGN KEY([ProfesorId])
REFERENCES [dbo].[Profesores] ([ProfesorId])
GO
ALTER TABLE [dbo].[Materias] CHECK CONSTRAINT [FK_Materias_Profesores]
GO
USE [master]
GO
ALTER DATABASE [ColegioDb] SET  READ_WRITE 
GO
