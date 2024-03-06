-- Supermarketin subelerinden alisveris yapan m�sterilerin vermis oldugu puan aral�klar�ndan kacar tane oldugunu g�steren sorgu

SELECT branch,
SUM(CASE WHEN rating BETWEEN 4 AND 6 THEN 1 END) AS 'COUNT OF 4-6',
SUM(CASE WHEN rating BETWEEN 6.1 AND 8 THEN 1 END) AS 'COUNT OF 6.1-8',
SUM(CASE WHEN rating BETWEEN 8.1 AND 10 THEN 1 END) AS 'COUNT OF 8.1-10'
FROM supermarket_uploaded
GROUP BY branch


