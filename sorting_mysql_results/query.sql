SELECT
	date,
	(
		6367.45 * acos (
			cos( radians(-29.678329467773) ) *
			cos( radians( events.latitude ) ) *
			cos(
				radians( events.longitude )  - radians(-51.130561828613)
			) +
			sin( radians(-29.678329467773) ) *
			sin( radians( events.latitude ) )
		)
	) AS distance
FROM events
WHERE
	events.longitude != ‘’
	AND date > NOW()
ORDER BY ( POWER( 1 / DATEDIFF(date, CURDATE()), 1.5 ) / distance ) DESC
