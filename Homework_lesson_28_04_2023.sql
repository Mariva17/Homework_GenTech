-- Вывести количественное распределение оценок (реакций) по стриму №1.
SELECT
streams.stream_id,
streams.title,
reactions.value,
COUNT(reactions.value) AS quantity_reactions
FROM reactions
LEFT JOIN streams ON reactions.stream_id=streams.stream_id
WHERE streams.stream_id=1
GROUP BY reactions.value;



-- Вывести список стран, откуда идут пожертвования.
SELECT
users.country
FROM donations
LEFT JOIN streams ON streams.stream_id = donations.stream_id
LEFT JOIN users ON users.user_id = donations.donator_id
GROUP BY users.country;

--  Вывести сумму и ко-во всех полученных пожертвований стримером №1 
SELECT
streams.stream_id,
SUM(donations.amount),
COUNT(*)
FROM donations
LEFT JOIN streams ON streams.stream_id = donations.stream_id
LEFT JOIN users ON users.user_id = donations.donator_id
WHERE streams.user_id=1
GROUP BY streams.stream_id;


