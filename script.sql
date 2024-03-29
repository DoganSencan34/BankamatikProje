USE [master]
GO
/****** Object:  Database [Bankamatik]    Script Date: 30.09.2019 20:19:51 ******/
CREATE DATABASE [Bankamatik]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bankamatik', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Bankamatik.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Bankamatik_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Bankamatik_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Bankamatik] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bankamatik].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bankamatik] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bankamatik] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bankamatik] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bankamatik] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bankamatik] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bankamatik] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bankamatik] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bankamatik] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bankamatik] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bankamatik] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bankamatik] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bankamatik] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bankamatik] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bankamatik] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bankamatik] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bankamatik] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bankamatik] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bankamatik] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bankamatik] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bankamatik] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bankamatik] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bankamatik] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bankamatik] SET RECOVERY FULL 
GO
ALTER DATABASE [Bankamatik] SET  MULTI_USER 
GO
ALTER DATABASE [Bankamatik] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bankamatik] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bankamatik] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bankamatik] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Bankamatik] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bankamatik', N'ON'
GO
USE [Bankamatik]
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 30.09.2019 20:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[MusteriID] [int] IDENTITY(1,1) NOT NULL,
	[TC] [nvarchar](11) NULL,
	[Isim] [nvarchar](50) NULL,
	[Soyisim] [nvarchar](50) NULL,
	[Telefon] [nvarchar](11) NULL,
	[Email] [nvarchar](50) NULL,
	[Adres] [nvarchar](max) NULL,
	[Sifre] [nvarchar](50) NULL,
	[Bakiye] [decimal](18, 2) NULL,
	[HesapNo] [nvarchar](50) NULL,
	[IBAN] [nvarchar](50) NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[musteri]    Script Date: 30.09.2019 20:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[musteri]
AS
select * from Musteriler

GO
SET IDENTITY_INSERT [dbo].[Musteriler] ON 

INSERT [dbo].[Musteriler] ([MusteriID], [TC], [Isim], [Soyisim], [Telefon], [Email], [Adres], [Sifre], [Bakiye], [HesapNo], [IBAN]) VALUES (1, N'23453193112', N'Doğan', N'Şencan', N'05050105629', N'sencanndogann@gmail.com', N'Batı mah.Sabri Taşkın Cad. Pendik/İstanbul', N'1', CAST(232.18 AS Decimal(18, 2)), N'15248596215', N'TR 15 4252 5245 5251 2525 2255 25')
INSERT [dbo].[Musteriler] ([MusteriID], [TC], [Isim], [Soyisim], [Telefon], [Email], [Adres], [Sifre], [Bakiye], [HesapNo], [IBAN]) VALUES (2, N'23456193058', N'Fatih', N'Aga', N'05452452525', N'sdsdsd', N'dsdsdsd', N'1', CAST(856.09 AS Decimal(18, 2)), N'12121212121', N'TR 55 4252 5245 5251 2525 2255 25')
INSERT [dbo].[Musteriler] ([MusteriID], [TC], [Isim], [Soyisim], [Telefon], [Email], [Adres], [Sifre], [Bakiye], [HesapNo], [IBAN]) VALUES (1002, N'45215252522', N'Deneme', N'Deneme', N'12345678', N'dsadasd', N'asdasda', N'1', CAST(500.00 AS Decimal(18, 2)), N'89214490988', N'TR 18 1507 6279 7773 4384 7876 1994 31')
SET IDENTITY_INSERT [dbo].[Musteriler] OFF
/****** Object:  StoredProcedure [dbo].[SP_HESAP_ARA]    Script Date: 30.09.2019 20:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_HESAP_ARA]
(
@HESAP_NO nvarchar(50)
)
AS 
BEGIN
 select COUNT(*) from Musteriler where HesapNo=@HESAP_NO
END

GO
/****** Object:  StoredProcedure [dbo].[SP_IBAN_ARA]    Script Date: 30.09.2019 20:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_IBAN_ARA]
(
@IBAN_NO nvarchar(50)
)
AS 
BEGIN
 select COUNT(*) from Musteriler where IBAN=@IBAN_NO 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Kullanici_Kontrol]    Script Date: 30.09.2019 20:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_Kullanici_Kontrol]
(@TC nvarchar(30),
@Sifre nvarchar(30))
as 
begin
	select Count(*) from Musteriler where TC=@TC and Sifre=@Sifre 
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Mail_Guncelle]    Script Date: 30.09.2019 20:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_Mail_Guncelle]
(
@TC nvarchar(11),
@Mail nvarchar(50)
)
as 
begin
	update Musteriler set Email=@Mail where TC=@TC
end

GO
/****** Object:  StoredProcedure [dbo].[Sp_Musteri_Bilgileri_Getir]    Script Date: 30.09.2019 20:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_Musteri_Bilgileri_Getir]
(@TC nvarchar(30))
as 
begin
	select * from Musteriler where TC=@TC
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Musteri_Ekle]    Script Date: 30.09.2019 20:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_Musteri_Ekle]
@TC nvarchar(11),
@Isim nvarchar(50),
@Soyisim nvarchar(50),
@Telefon nvarchar(11),
@Email nvarchar(50),
@Adres nvarchar(max),
@Sifre nvarchar(50),
@Bakiye decimal(18,2),
@HesapNo nvarchar(50),
@IBAN nvarchar(50)
as 
begin
	insert into Musteriler values(@TC,@Isim,@Soyisim,@Telefon,@Email,@Adres,@Sifre,@Bakiye,@HesapNo,@IBAN)
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Para_Cekim]    Script Date: 30.09.2019 20:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_Para_Cekim]
(
@TC nvarchar(11),
@CekilenPara float
)
as 
begin
	update Musteriler set Bakiye=@CekilenPara where TC=@TC
end
GO
/****** Object:  StoredProcedure [dbo].[SP_PARA_TRANSFER_HESAP]    Script Date: 30.09.2019 20:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_PARA_TRANSFER_HESAP]
(
@HESAP_NO nvarchar(50),
@Para float
)
AS 
BEGIN
 Declare @P float
 SELECT @P=SUM(Bakiye+@Para) from Musteriler where HesapNo=@HESAP_NO
 update  Musteriler set Bakiye=@P where HesapNo=@HESAP_NO
END

GO
/****** Object:  StoredProcedure [dbo].[SP_PARA_TRANSFER_IBAN]    Script Date: 30.09.2019 20:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_PARA_TRANSFER_IBAN]
(
@IBAN_NO nvarchar(50),
@Para float
)
AS 
BEGIN
 Declare @P float
 SELECT @P=SUM(Bakiye+@Para) from Musteriler where IBAN=@IBAN_NO 
 update  Musteriler set Bakiye=@P where IBAN=@IBAN_NO 
 END

GO
/****** Object:  StoredProcedure [dbo].[Sp_Sifre_Guncelle]    Script Date: 30.09.2019 20:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_Sifre_Guncelle]
(
@TC nvarchar(11),
@Sifre nvarchar(50)
)
as 
begin
	update Musteriler set Sifre=@Sifre where TC=@TC
end

GO
/****** Object:  StoredProcedure [dbo].[Sp_Telefon_Guncelle]    Script Date: 30.09.2019 20:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_Telefon_Guncelle]
(
@TC nvarchar(11),
@Telefon nvarchar(50)
)
as 
begin
	update Musteriler set Telefon=@Telefon where TC=@TC
end

GO
USE [master]
GO
ALTER DATABASE [Bankamatik] SET  READ_WRITE 
GO
