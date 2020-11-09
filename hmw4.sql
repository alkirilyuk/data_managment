SELECT 'ФИО: Kirilyuk Alyona Maksimovna';
--Команда создания таблицы
CREATE TABLE movie.content_genres(movieId  INT, genre VARCHAR);
--Копирование данных в таблицу
psql -U postgres -h localhost -p 5433 -c "\\copy movie.content_genres  FROM 'data_management/data_store/raw_data/genres.csv' DELIMITER ',' CSV HEADER"
--Запрос 3
WITH top_rated AS (
    SELECT
        movieid,
        avg(rating) AS avg_rating
    FROM movie.ratings
    GROUP BY movieid
    HAVING count(userId) >= 50
    ORDER BY avg_rating DESC, movieid ASC
    LIMIT 150
)
SELECT
    top_rated.movieid,
    top_rated.avg_rating,
    genre.keywords
INTO movie.keywords_ratings
FROM top_rated 
INNER JOIN (
    SELECT
        movieid,
        array_agg(genre) AS keywords
    FROM movie.content_genres
    GROUP BY movieid
) as genre
    ON genre.movieid = top_rated.movieid;
--Вывод результата в файл
psql -U postgres -h localhost -p 5433 -c "\\copy (SELECT * FROM movie.keywords_ratings LIMIT 100) TO 'data_management/data_store/raw_data/keywords_ratings.csv' WITH CSV HEADER DELIMITER as 'E';"
