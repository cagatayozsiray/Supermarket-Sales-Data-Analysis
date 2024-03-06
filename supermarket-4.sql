-- Her kategorinin aylik satis miktarini getiren sorgu

SELECT 
    product_line,
    [JANUARY] AS [TOTAL QTY - JANUARY],
    [FEBRUARY] AS [TOTAL QTY - FEBRUARY],
    [MARCH] AS [TOTAL QTY - MARCH]
FROM
(
    SELECT
        product_line,
        CASE
            WHEN DATEPART(MONTH, date_) = 1 THEN 'JANUARY'
            WHEN DATEPART(MONTH, date_) = 2 THEN 'FEBRUARY'
            WHEN DATEPART(MONTH, date_) = 3 THEN 'MARCH'
        END AS 'MONTH',
        SUM(quantity) AS 'TOTAL SALES'
    FROM supermarket_uploaded
    GROUP BY product_line, DATEPART(MONTH, date_)
) AS Source
PIVOT
(
    MAX([TOTAL SALES]) 
    FOR [MONTH] IN ([JANUARY], [FEBRUARY], [MARCH]) 
) AS PivotTable;


