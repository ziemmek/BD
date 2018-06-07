USE [Boro�_Konrad]
GO

/****** Object:  Table [dbo].[Zam�wienia]    Script Date: 2018-06-06 10:20:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Archiwum_sprzeda�y](
	[IDzam�wienia] [int] NOT NULL,
	[IDklienta] [nvarchar](5) NOT NULL,
	[IDpracownika] [int] NULL,
	[DataZam�wienia] [datetime] NULL,
	[DataWymagana] [datetime] NULL,
	[DataWysy�ki] [datetime] NULL,
	[IDspedytora] [int] NULL,
	[Fracht] [money] NULL,
	[NazwaOdbiorcy] [nvarchar](40) NULL,
	[AdresOdbiorcy] [nvarchar](60) NULL,
	[MiastoOdbiorcy] [nvarchar](15) NULL,
	[RegionOdbiorcy] [nvarchar](15) NULL,
	[KodPocztowyOdbiorcy] [nvarchar](10) NULL,
	[KrajOdbiorcy] [nvarchar](15) NULL,
	[IDproduktu] [int] NOT NULL,
	[CenaJednostkowa] [money] NOT NULL,
	[Ilo��] [smallint] NOT NULL,
	[Rabat] [real] NOT NULL
) ON [PRIMARY]

GO


