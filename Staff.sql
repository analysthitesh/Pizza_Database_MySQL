SELECT 
RO.DATE, 
S.first_name,
S.last_name,
S.HOURLY_RATE,
SH.START_TIME,
SH.END_TIME,
((
			HOUR (
			timediff( sh.end_time, sh.start_time ))* 60 
			)+(
			MINUTE (
			timediff( sh.end_time, sh.start_time ))))/ 60 AS hours_in_shift,
	((
			HOUR (
			timediff( sh.end_time, sh.start_time ))* 60 
			)+(
			MINUTE (
			timediff( sh.end_time, sh.start_time ))))/ 60 * s.hourly_rate AS staff_cost 
FROM ROTA AS RO
LEFT JOIN STAFF AS S ON RO.staff_id = S.staff_id
LEFT JOIN SHIFT AS SH ON SH.shift_id = RO.shift_id
