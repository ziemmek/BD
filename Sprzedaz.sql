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
    SELECT zam.IDzamówienia As ID, kl.NazwaFirmy AS Firma, zam.DataZamówienia as Rok,
           SUM(oz.Iloœæ*oz.CenaJednostkowa) AS 'Wartosc'
    FROM dbo.Zamówienia AS zam 
		INNER JOIN dbo.[Opisy zamówieñ] AS oz 
           ON zam.IDzamówienia = oz.IDzamówienia
        INNER JOIN dbo.Klienci AS kl
           ON zam.IDklienta = kl.IDKlienta
    WHERE zam.DataZamówienia = @rok
    GROUP BY zam.IDzamówienia, kl.NazwaFirmy, zam.DataZamówienia
);
GO