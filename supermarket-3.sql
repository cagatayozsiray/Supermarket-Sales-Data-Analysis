-- Sehirlerde alisveris yapan kadýn ve erkek oranýný bulan sorgu
SELECT 
    city,
    SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) 'FEMALE COUNT',
    SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) 'MALE COUNT',
    FORMAT((SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) * 1.0 / COUNT(*)),'N2') 'MALE RATIO',
    FORMAT((SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) * 1.0 / COUNT(*)),'N2') 'FEMALE RATIO'
FROM 
    supermarket_uploaded
GROUP BY 
    city;
