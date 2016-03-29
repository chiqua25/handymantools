CREATE PROCEDURE [dbo].[usp_GetCustomerByUserId]
	@UserId int
AS
	SELECT u.UserName, u.FirstName, u.LastName, c.HomeAreaCode, c.HomePhone, c.WorkAreaCode, c.WorkPhone, c.[Address] 
	FROM Customer c 
	INNER JOIN [User] u ON c.UserId = u.UserId 
	WHERE u.UserId = @UserId 
	
RETURN 0
