SELECT COUNT(*) from flights;

SELECT Origin,AVG(ArrDelay),AVG(DepDelay) from flights group by origin ;

SELECT Origin,ColYear,ColMonth,AVG(ArrDelay) from flights group by Origin , ColYear, ColMonth ;

SELECT u.City,ColYear,ColMonth,AVG(ArrDelay) from flights f left join usairports u on u.IATA=f.Origin group by u.City , ColYear, ColMonth ;

SELECT UniqueCarrier, colYear, colMonth, SUM(Cancelled) as total_cancelacions 
	FROM Flights  
	GROUP BY UniqueCarrier, colYear, colMonth  
	HAVING total_cancelacions > 0  
	ORDER BY total_cancelacions DESC, colYear ASC, colMonth ASC

SELECT TailNum, SUM(Distance) as totalDistance 
	FROM Flights 
	WHERE TailNum != 'NA' and TailNum != '#?NOMBRE?' and TailNum != ''
	GROUP BY TailNum 
	ORDER BY totalDistance DESC 
	Limit 10;

SELECT UniqueCarrier, avg(ArrDelay) as avgDelay 
	FROM Flights 
	GROUP BY UniqueCarrier 
	HAVING avgDelay > 10.0 
	ORDER BY avgDelay DESC