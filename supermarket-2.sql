--Sehirlerin aylik cirosunu gösteren sorgu

SELECT 
    city,
    [JANUARY] AS [TOTAL SALES($) - JANUARY],
    [FEBRUARY] AS [TOTAL SALES($) - FEBRUARY],
    [MARCH] AS [TOTAL SALES($) - MARCH]
FROM
(
    SELECT
        city,
        CASE
            WHEN DATEPART(MONTH, date_) = 1 THEN 'JANUARY'
            WHEN DATEPART(MONTH, date_) = 2 THEN 'FEBRUARY'
            WHEN DATEPART(MONTH, date_) = 3 THEN 'MARCH'
        END AS 'MONTH',
        FORMAT(SUM(total), 'N2') AS 'TOTAL SALES'
    FROM supermarket_uploaded
    GROUP BY city, DATEPART(MONTH, date_)
) AS Source
PIVOT
(
    MAX([TOTAL SALES]) 
    FOR [MONTH] IN ([JANUARY], [FEBRUARY], [MARCH]) 
) AS PivotTable;
