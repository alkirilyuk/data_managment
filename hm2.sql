-- ФИО
SELECT 'ФИО: Kirilyuk Alyona Maksimovna';
--запрос 1
SELECT * FROM movie.ratings LIMIT 10;
--запрос 2
SELECT * FROM movie.links WHERE (imdbid LIKE '%42') AND  (movieid > 100 AND movieid <1000);  
--запрос 3
SELECT imdbid FROM movie.links JOIN movie.ratings ON movie.ratings.movieid = movie.links.movieid WHERE rating = 5 LIMIT 10;
--запрос 4
SELECT COUNT(DISTINCT(movie.links.movieid)) FROM movie.links LEFT JOIN movie.ratings ON movie.links.movieid = movie.ratings.movieid WHERE movie.ratings.movieid is NULL;
--запрос 5
SELECT movie.ratings.userid FROM movie.ratings WHERE rating >= 3.5 GROUP BY userid HAVING avg(rating) > 3.5 LIMIT 10;
--запрос 6
SELECT movie.links.imdbid FROM movie.links WHERE  movie.links.movieid  IN ( SELECT movieid FROM movie.ratings GROUP BY movieid HAVING avg(rating) > 3.5 )LIMIT 10;
--запрос 7
WITH user_ratings AS (SELECT userid, avg(rating) AS user_rating FROM movie.ratings GROUP BY userid HAVING count(rating) > 10) SELECT avg(user_rating) FROM user_ratings;

--Скриншот выполнения  https://i.imgur.com/MAQU4Nj.png
