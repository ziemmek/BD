
IF EXISTS(
  SELECT *
    FROM sys.triggers
   WHERE name = N'<trigger_name, sysname, table_alter_drop_safety>'
     AND parent_class_desc = N'DATABASE'
)
	DROP TRIGGER test
GO

CREATE TRIGGER testing ON dbo.Produkty 
	FOR insert, update
AS
BEGIN
	DECLARE @cena money 
	SET @cena = (SELECT CenaJednostkowa  FROM inserted)

	IF (@cena < 0)
	BEGIN
		PRINT 'Cena mniejsza ni¿ 0' 
		ROLLBACK TRANSACTION
	END
END
GO


