SELECT 
    h1.user_name AS user_name,
    h3.movie_name AS recommended_movie,
    COUNT(*) AS recommendation_score
FROM history h1
JOIN history h2 
    ON h1.movie_name = h2.movie_name 
    AND h1.user_name != h2.user_name
JOIN history h3 
    ON h2.user_name = h3.user_name
WHERE h3.movie_name NOT IN (
    SELECT movie_name FROM history WHERE user_name = h1.user_name
)
GROUP BY h1.user_name, h3.movie_name
ORDER BY h1.user_name, recommendation_score DESC;