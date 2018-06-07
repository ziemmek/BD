-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================

DROP FUNCTION Liczba_zamówieñ
GO
CREATE FUNCTION Liczba_zamówieñ
(
	-- Add the parameters for the function here
	@Kraj nvarchar(15)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @output int

	-- Add the T-SQL statements to compute the return value here
	SET @output = (SELECT COUNT(IDzamówienia)
	FROM dbo.Zamówienia
	WHERE KrajOdbiorcy LIKE @Kraj)

	-- Return the result of the function
	RETURN @output

END
GO

EXEC Liczba_zamówieñ @Kraj = 'Polska'

