-- 1 Добавить фильм с датой и временем 1 мая, 2023, 10:00:00.

INSERT INTO timetable(hall_id, movie_id, start_time, duration_minute, low_seat_price, vip_seat_price)
VALUES
	(2, 2, ('2023-05-01 10:00:00'), 220, 80, 100);
    
-- 2. Вывести билеты, купленные на определенную дату

SELECT *
FROM tickets
WHERE date(created_at)='2023-05-08';

-- 3. Вывести информацию о покупке билетов. 
-- В какие дни недели продаж больше всего: название дня недели, ко-во_продаж
SELECT
COUNT(*) AS quantity_sell,
DAYNAME (created_at) AS date_of_sell
FROM tickets
GROUP BY date_of_sell
ORDER BY quantity_sell DESC
LIMIT 1;
