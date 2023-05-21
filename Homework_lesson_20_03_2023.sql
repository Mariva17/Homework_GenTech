create table if not exists donations (
	donation_id integer primary key auto_increment,
    user_id integer,
    donation_sum decimal (10, 2) not null,
    donation_currency varchar(128),
    received_at datetime default current_timestamp,
    is_received bool default true,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
INSERT INTO donations (user_id, donation_sum, donation_currency)
VALUE 
(2, 122.35, 'EUR'),
(1, 50.50, 'USD'),
(3, 75.00, 'EUR');
SELECT * FROM donations;

create table if not exists likes (
	user_id integer,
    stream_id integer,
    title varchar(256) not null,
    positive_likes integer,
    negative_likes integer,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (stream_id) REFERENCES streams(stream_id)
);
INSERT INTO likes (user_id, stream_id, title, positive_likes, negative_likes)
VALUE
(3, 3, 'Sream from France', 258, 5),
(2, 2, 'Sream from Germany', 335, 18),
(1, 1, 'Sream from USA', 199, 21);
SELECT * FROM likes;