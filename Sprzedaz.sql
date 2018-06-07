USE NorthZJ
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Juroszek
-- Create date: 20.04.2018
-- Description:	WartoscZamowien
-- =============================================
GO
IF OBJECT_ID (N'dbo.Wartosc', N'IF') IS NOT NULL
    DROP FUNCTION dbo.Wartosc;
GO
CREATE FUNCTION dbo.Wartosc (@Rok DATE)
RETURNS TABLE
AS
RETURN 
(
    SELECT zam.IDzam�wienia As ID, kl.NazwaFirmy AS Firma, zam.DataZam�wienia as Rok,
           SUM(oz.Ilo��*oz.CenaJednostkowa) AS 'Wartosc'
    FROM dbo.Zam�wienia AS zam 
		INNER JOIN dbo.[Opisy zam�wie�] AS oz 
           ON zam.IDzam�wienia = oz.IDzam�wienia
        INNER JOIN dbo.Klienci AS kl
           ON zam.IDklienta = kl.IDKlienta
    WHERE zam.DataZam�wienia = @rok
    GROUP BY zam.IDzam�wienia, kl.NazwaFirmy, zam.DataZam�wienia
);
GO