USE [NorthZJ]
GO
/****** Object:  Trigger [dbo].[tr1]    Script Date: 2018-05-11 09:35:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[tr1]
   ON  [dbo].[Oferta]
   FOR UPDATE
AS 
BEGIN

	DECLARE @stempel AS datetime,
			@user AS nvarchar(256),
			@host AS nvarchar(128)

	SET @stempel = GETDATE()
	SET	@user	= SUSER_NAME()
	SET @host = HOST_NAME()

    INSERT INTO dbo.Oferta_Modyfikacje
	
	   ([IDproduktu]
      ,[NazwaProduktu]
      ,[IDdostawcy]
      ,[IDkategorii]
      ,[IlośćJednostkowa]
      ,[CenaJednostkowa]
      ,[StanMagazynu]
      ,[IlośćZamówiona]
      ,[StanMinimum]
      ,[Wycofany]
      ,[Stempel_czasowy]
      ,[User]
      ,[Host])
	  SELECT 
	   [IDproduktu]
      ,[NazwaProduktu]
      ,[IDdostawcy]
      ,[IDkategorii]
      ,[IlośćJednostkowa]
      ,[CenaJednostkowa]
      ,[StanMagazynu]
      ,[IlośćZamówiona]
      ,[StanMinimum]
      ,[Wycofany]
	  , @stempel
	  ,@user
	  ,@host
	  FROM deleted
END
