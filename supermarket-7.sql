-- Her sehirde yapilan ödeme tipinin oranini gosteren sorgu

SELECT 
    city,
    SUM(CASE WHEN payment = 'Cash' THEN 1 ELSE 0 END) 'CASH COUNT',
    SUM(CASE WHEN payment = 'Credit card' THEN 1 ELSE 0 END) 'CREDIT CARD COUNT',
	SUM(CASE WHEN payment = 'Ewallet' THEN 1 ELSE 0 END) 'EWALLET COUNT',
    FORMAT((SUM(CASE WHEN payment = 'Cash' THEN 1 ELSE 0 END) * 1.0 / COUNT(*)),'N2') 'CASH RATIO',
    FORMAT((SUM(CASE WHEN payment = 'Credit card' THEN 1 ELSE 0 END) * 1.0 / COUNT(*)),'N2') 'CREDIT CARD RATIO',
	FORMAT((SUM(CASE WHEN payment = 'Ewallet' THEN 1 ELSE 0 END) * 1.0 / COUNT(*)),'N2') 'EWALLET RATIO'
FROM 
    supermarket_uploaded
GROUP BY 
    city;
