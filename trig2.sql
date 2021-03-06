USE [NorthZJ]
GO
/****** Object:  Trigger [dbo].[tr2]    Script Date: 2018-05-11 09:35:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[tr2]
   ON  [dbo].[Oferta]
   FOR UPDATE
AS 
BEGIN
print 'Dziala trig2'

	IF UPDATE (CenaJednostkowa)
	BEGIN

		SET NOCOUNT ON;

	DECLARE
			@cena_old AS money,
			@cena_new AS money,
			@stempel AS datetime,
			@user AS nvarchar(256),
			@host AS nvarchar(128)

	SET @cena_old = (SELECT [CenaJednostkowa] FROM deleted);
	SET @cena_new = (SELECT [CenaJednostkowa] FROM inserted);
	SET @stempel = GETDATE();
	SET	@user	= SUSER_NAME();
	SET @host = HOST_NAME();

    INSERT INTO dbo.Oferta_modyfikacje_ceny
	
	   ([IDproduktu]
      ,[NazwaProduktu]
	  ,[CenaJednostkowa_Old]
      ,[CenaJednostkowa_New]
      ,[Stempel_czasowy]
      ,[User]
      ,[Host])

	  SELECT 
	   [IDproduktu]
      ,[NazwaProduktu]
	  ,@cena_old
	  ,@cena_new
	  ,@stempel
	  ,@user
	  ,@host
	  FROM deleted

	  END
END
