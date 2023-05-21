-- 1. Вывести название самого посещаемого кинозала
SELECT
halls.name,
COUNT(*) AS quantity_tickets
FROM tickets
LEFT JOIN timetable ON timetable.timetable_id=tickets.timetable_id
LEFT JOIN halls ON halls.hall_id=timetable.hall_id
GROUP BY halls.hall_id
ORDER BY quantity_tickets DESC
LIMIT 1;

-- 2. Вывести название и ко-во проданных билетов самого непопулярного фильма
SELECT
movies.title,
COUNT(*) AS quantity_tickets
FROM tickets
LEFT JOIN timetable ON timetable.timetable_id=tickets.timetable_id
LEFT JOIN movies ON movies.movie_id=timetable.movie_id
GROUP BY movies.movie_id
ORDER BY quantity_tickets
LIMIT 1;

-- 3. Вывести процент времени, который отводится рекламе в каждом сеансе.
SELECT
timetable.timetable_id,
((timetable.duration_minute-movies.duration_minute)/timetable.duration_minute)*100 AS percent_advertising
FROM timetable
LEFT JOIN movies ON movies.movie_id=timetable.movie_id
GROUP BY timetable.timetable_id;

SELECT * FROM timetable;

UPDATE timetable
SET duration_minute=200
WHERE timetable_id IN (1, 2, 3, 4, 5);

-- 4. Вывести самый продолжительный фильм (название и продолжительность)
SELECT
title,
duration_minute
FROM movies
ORDER BY duration_minute DESC
LIMIT 1;

-- 5. Вывести среднюю стоимость билета для каждого фильма (ср/стоимость и название фильма - проекция)
SELECT 
movies.title,
AVG(tickets.cost) AS avg_price
FROM tickets
LEFT JOIN timetable ON timetable.timetable_id=tickets.timetable_id
LEFT JOIN movies ON movies.movie_id=timetable.movie_id
GROUP BY movies.movie_id;


