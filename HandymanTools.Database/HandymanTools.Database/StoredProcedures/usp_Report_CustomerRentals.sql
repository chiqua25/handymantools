CREATE PROCEDURE [dbo].[usp_Report_CustomerRentals]
	@Year int,
	@Month int
AS
	 SELECT FirstName, LastName, UserName, COUNT(ReservationTool.ToolId) AS NumberOfRentals FROM Customer
		 INNER JOIN Reservation ON Customer.UserId = Reservation.CustomerId
		 INNER JOIN [User] ON [User].UserId = Customer.UserId
		 INNER JOIN ReservationTool ON ReservationTool.ReservationNumber = Reservation.ReservationNumber 
	 WHERE DATEPART(mm, Reservation.StartDate) = @Month AND DATEPART(yyyy, Reservation.StartDate) = @Year
	 GROUP BY ReservationTool.ToolId, FirstName, LastName, UserName
	 ORDER BY NumberOfRentals, LastName
RETURN 0
