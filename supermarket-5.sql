-- Ayin gunlerine gore ortalama maliyeti ve brut geliri gosteren sorgu

SELECT 
CASE
WHEN DATEPART(MONTH,date_)=1 THEN 'JANUARY'
WHEN DATEPART(MONTH,date_)=2 THEN 'FEBRUARY'
WHEN DATEPART(MONTH,date_)=3 THEN 'MARCH'
END AS 'MONTH',
DATEPART(DAY,date_) 'DAY NR',
FORMAT(AVG(cogs),'N2') 'AVG COGS',
FORMAT(AVG(gross_income),'N2') 'AVG GROSS INCOME' FROM supermarket_uploaded
GROUP BY DATEPART(MONTH,date_),DATEPART(DAY,date_)
ORDER BY DATEPART(MONTH,date_)

