CREATE PROCEDURE [dbo].[usp_GetReservationsByCustomerId]
	@CustomerId int
AS
	SELECT Reservation.ReservationNumber,
		STUFF 
		(
			(
				SELECT ', ' + Tool.AbbrDescription 
				--FROM Tool t
				--INNER JOIN ReservationTool rt ON t.ToolId = rt.ToolId
				--WHERE Reservation.ReservationNumber = rt.ReservationNumber
				--GROUP BY Tool.AbbrDescription
			), 1, 1, ''
		) AS Tools,
		Reservation.StartDate, 
		Reservation.EndDate, 
		SUM(Tool.RentalPrice) as TotalRentalPrice, 
		SUM(Tool.DepositAmt) as TotalDepositAmount, 
		PickupClerkUser.FirstName, 
		DropOffClerkUser.FirstName 
	FROM Reservation 
		INNER JOIN ReservationTool ON Reservation.ReservationNumber = ReservationTool.ReservationNumber
		INNER JOIN Tool ON Tool.ToolId = ReservationTool.ToolId 
		LEFT JOIN Clerk AS PickupClerk ON Reservation.PickupClerkId = PickupClerk.UserId
		LEFT JOIN [User] AS PickupClerkUser ON PickupClerk.UserId = PickupClerkUser.UserId
		LEFT JOIN Clerk AS DropOffClerk ON Reservation.DropOffClerkId = DropOffClerk.UserId
		LEFT JOIN [User] AS DropOffClerkUser ON DropOffClerk.UserId = DropOffClerkUser.UserId 
	WHERE Reservation.CustomerId = @CustomerId 
	GROUP BY Reservation.ReservationNumber,
		Tool.AbbrDescription, 
		Reservation.StartDate, 
		Reservation.EndDate, 
		PickupClerkUser.FirstName, 
		DropOffClerkUser.FirstName

RETURN 0


