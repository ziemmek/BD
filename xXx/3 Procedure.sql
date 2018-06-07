-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
	DROP PROCEDURE Archiwizacja
	GO


CREATE PROCEDURE Archiwizacja
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	INSERT INTO [dbo].[Archiwum_sprzeda¿y]
		([IDzamówienia]
			   ,[IDklienta]
			   ,[IDpracownika]
			   ,[DataZamówienia]
			   ,[DataWymagana]
			   ,[DataWysy³ki]
			   ,[IDspedytora]
			   ,[Fracht]
			   ,[NazwaOdbiorcy]
			   ,[AdresOdbiorcy]
			   ,[MiastoOdbiorcy]
			   ,[RegionOdbiorcy]
			   ,[KodPocztowyOdbiorcy]
			   ,[KrajOdbiorcy]
			   ,[IDproduktu]
			   ,[CenaJednostkowa]
			   ,[Iloœæ]
			   ,[Rabat])
	 SELECT z.[IDzamówienia]
           ,[IDklienta]
           ,[IDpracownika]
           ,[DataZamówienia]
           ,[DataWymagana]
           ,[DataWysy³ki]
           ,[IDspedytora]
           ,[Fracht]
           ,[NazwaOdbiorcy]
           ,[AdresOdbiorcy]
           ,[MiastoOdbiorcy]
           ,[RegionOdbiorcy]
           ,[KodPocztowyOdbiorcy]
           ,[KrajOdbiorcy]
		   ,[IDproduktu]
           ,[CenaJednostkowa]
           ,[Iloœæ]
           ,[Rabat]
		    FROM Zamówienia z
	 JOIN [Opisy zamówieñ] oz ON oz.IDzamówienia = z.IDzamówienia
          
END
GO
