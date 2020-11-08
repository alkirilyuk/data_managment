-- ФИО
SELECT 'ФИО: Кирилюк Алёна Максимовна';


-- Window functions

SELECT
userId,
movieId,
AVG (rating) OVER (Partition BY userId ORDER BY userId) AS avg_rating,
(rating- MIN(rating) OVER (Partition BY userId ORDER BY userId) ) / (MAX(rating) OVER (Partition BY userId ORDER BY userId) - MIN(rating) OVER (Partition BY userId ORDER BY userId))
AS normed_rating
FROM movie.ratings
ORDER BY userId LIMIT 30;
