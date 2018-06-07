USE Northwind
IF OBJECT_ID (N'dbo.TotalValue', N'IF') IS NOT NULL
	DROP FUNCTION dbo.TotalValue;
GO
CREATE FUNCTION dbo.TotalValue (@ID nvarchar, @s_year int)

RETURNS int

AS
BEGIN
	DECLARE @totalvalue int;
	SELECT @totalvalue = SUM(od.UnitPrice * od.Quantity) 
    FROM dbo.[Order Details] AS od  
		INNER JOIN Orders AS o ON o.OrderID = od.OrderID
	WHERE o.CustomerID=@ID AND YEAR(o.OrderDate)=@s_year;
	IF (@totalvalue is NULL)
		SET @totalvalue = 0;

    RETURN @totalvalue;
END
GO
