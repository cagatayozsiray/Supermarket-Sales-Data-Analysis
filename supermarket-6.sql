--Her kategorinin ocak ayinin gunlerindeki toplam satis miktarini gosteren sql sorgusu
SELECT 
    product_line,
    ISNULL([1], 0) AS [1],
    ISNULL([2], 0) AS [2],
    ISNULL([3], 0) AS [3],
    ISNULL([4], 0) AS [4],
    ISNULL([5], 0) AS [5],
    ISNULL([6], 0) AS [6],
    ISNULL([7], 0) AS [7],
    ISNULL([8], 0) AS [8],
    ISNULL([9], 0) AS [9],
    ISNULL([10], 0) AS [10],
    ISNULL([11], 0) AS [11],
    ISNULL([12], 0) AS [12],
    ISNULL([13], 0) AS [13],
    ISNULL([14], 0) AS [14],
    ISNULL([15], 0) AS [15],
    ISNULL([16], 0) AS [16],
    ISNULL([17], 0) AS [17],
    ISNULL([18], 0) AS [18],
    ISNULL([19], 0) AS [19],
    ISNULL([20], 0) AS [20],
    ISNULL([21], 0) AS [21],
    ISNULL([22], 0) AS [22],
    ISNULL([23], 0) AS [23],
    ISNULL([24], 0) AS [24],
    ISNULL([25], 0) AS [25],
    ISNULL([26], 0) AS [26],
    ISNULL([27], 0) AS [27],
    ISNULL([28], 0) AS [28],
    ISNULL([29], 0) AS [29],
    ISNULL([30], 0) AS [30],
    ISNULL([31], 0) AS [31]
FROM (
    SELECT 
        product_line, 
        DATEPART(DAY, date_) AS 'DATE NR', 
        ISNULL(SUM(quantity), 0) AS 'TOTAL QTY'
    FROM 
        supermarket_uploaded 
    WHERE 
        DATEPART(MONTH, date_) = 1
    GROUP BY 
        product_line, DATEPART(DAY, date_)
) AS SourceTable
PIVOT (
    SUM([TOTAL QTY])
    FOR [DATE NR] IN ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24], [25], [26], [27], [28], [29], [30], [31])
) AS PivotTable;
