-- (1) Вывести пользователей, у которых не укан email-адрес
SELECT * FROM users
WHERE user_email='' OR user_email IS NULL;

-- (2) Вывести незаблокированных пользователей из Китая
SELECT * FROM users
WHERE is_blocked=false AND country='China';

-- (3) Вывести стримы, авторы которых заблокированы
SELECT 
streams.title AS stream_title,
users.fullname AS author_stream
FROM streams
JOIN users ON streams.user_id=users.user_id
WHERE users.is_blocked=true;

-- (4) Вывести три последних реакции (включая имя_пользователя)

SELECT
users.fullname,
reactions.value
FROM reactions
JOIN users ON reactions.user_id=users.user_id
ORDER BY reactions.created_at DESC
LIMIT 3;



-- (5) Вывести пожертвования заблокированных пользователей

SELECT
users.fullname,
donations.amount
FROM donations
JOIN users ON donations.donator_id=users.user_id
WHERE users.is_blocked=true;
