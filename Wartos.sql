USE [Northwind]
GO
/****** Object:  StoredProcedure [dbo].[Sales_in_range_of_values]    Script Date: 2018-04-20 09:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Ziemowit Juroszek
-- Create date: 2018-04-19
-- Description:
-- =============================================
CREATE PROCEDURE [dbo].[Sales_in_range_of_values]
   
    @s_year int = 1996,
    @min float = -0.1,
    @max float = 0.1
AS
BEGIN
    SET NOCOUNT ON;
 
    DECLARE @avg_of_year AS float;
 
    SET @avg_of_year = (SELECT AVG(Total_order_value)
    FROM
        (SELECT z1.OrderID AS ID, 
			SUM(pz1.UnitPrice*pz1.Quantity) AS Total_order_value            
         FROM Orders AS z1 
			INNER JOIN [Order Details] AS pz1
							ON z1.[OrderID] = pz1.OrderID
         WHERE Year(z1.OrderDate) = @s_year
         GROUP BY z1.OrderID) AS Order_Values);
   
    SELECT @avg_of_year AS AVG_Total;
   
    SELECT Customer, AVG(OrderValue) AS AVG_OrderValue
    FROM
		 (SELECT z2.CustomerID AS Customer, z2.OrderID AS ID, SUM(pz2.UnitPrice*pz2.Quantity) AS OrderValue            
		 FROM Orders AS z2 INNER JOIN [Order Details] AS pz2
                            ON z2.[OrderID] = pz2.OrderID
		 WHERE Year(z2.OrderDate) = @s_year
		 GROUP BY z2.CustomerID, z2.OrderID) AS Firm_Order_Values
    GROUP BY Customer
    HAVING  AVG(OrderValue) BETWEEN (@avg_of_year * (1 + @min)) AND (@avg_of_year * (1 + @max))
   
END