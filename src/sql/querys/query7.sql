#7- Qual a maior sequencia de podium de Ayrton senna?
s
SELECT 
    COUNT(pp.position) AS sequencia_podium,
    p.forename,
    p.surname
FROM
    pilotosposicoes AS pp
        INNER JOIN
    pilotos AS p ON pp.driverId = p.driverId
WHERE
    p.driverId = 102
        AND pp.position IN (1 , 2, 3);