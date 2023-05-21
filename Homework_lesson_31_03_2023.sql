-- (1) Вывести все пожертвования от 10 EUR, с указанием имени автора пожертвования и суммы

SELECT
users.fullname AS donator_name,
donations.amount AS amount 
FROM donations
JOIN users ON donations.donator_id=users.user_id
WHERE donations.amount >= 20;

-- (2) Вывести стримера, которому было сделано самое минимальное пожертвование (имя_стримера, сумма)
SELECT 
users.fullname AS author_stream,
donations.amount
FROM donations
JOIN users ON donations.donator_id=users.user_id
ORDER BY donations.amount
LIMIT 1;

-- (3) Вывести последнее пожертвование (название_стрима, сумма)

SELECT 
streams.title,
donations.amount,
donations.created_at
FROM donations
JOIN streams ON donations.stream_id=streams.stream_id
ORDER BY donations.created_at DESC
LIMIT 1;

SELECT * FROM donations;
INSERT INTO donations (donator_id, stream_id, amount)
VALUE 
(4, 6, 8.50);