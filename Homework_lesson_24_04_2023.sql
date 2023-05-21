-- (1) ТОП-2 страны по сумме донатов
SELECT
users.country,  
SUM(donations.amount) AS total_donations
FROM donations
LEFT JOIN streams ON streams.stream_id = donations.stream_id
LEFT JOIN users ON users.user_id = donations.donator_id
GROUP BY users.country
ORDER BY total_donations DESC
LIMIT 2;

-- (2) Вывести рейтинг для каждого незавершенного стрима
SELECT
streams.title,
avg(reactions.value) AS rating
FROM reactions
LEFT JOIN streams ON reactions.stream_id=streams.stream_id
WHERE streams.is_completed=false
GROUP BY reactions.stream_id;

-- (3) Вывести ТОП-1 донаторов (имя, сумма в долларах)
SELECT
users.fullname AS donator_name,
SUM(donations.amount) AS sum_usd
FROM donations
LEFT JOIN users ON users.user_id = donations.donator_id
GROUP BY users.user_id
ORDER BY sum_usd DESC
LIMIT 1;

-- (4) Вывести страны стримеров, у которых рейтинг ниже 2 
SELECT
users.country,
AVG(reactions.value) AS rating
FROM reactions
LEFT JOIN users ON users.user_id=reactions.user_id
WHERE reactions.value<2 
GROUP BY users.country;

-- (5) Вывести имена пользователей и сколько оценок за все время они поставили
SELECT
users.fullname AS name,
COUNT(*) AS count_reactions
FROM reactions
LEFT JOIN users ON users.user_id=reactions.user_id
GROUP BY users.fullname;






