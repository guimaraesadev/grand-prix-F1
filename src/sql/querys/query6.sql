#6- Quais pilotos venceram corridas em território brasileiro?

SELECT DISTINCT
    p.surname, p.forename, c.nome, r.position
FROM
    resultados AS r
        INNER JOIN
    pilotosposicoes AS pp ON r.driverId = pp.driverId
        INNER JOIN
    pilotos AS p ON p.driverId = pp.driverId
        INNER JOIN
    corridas AS c ON c.raceId = pp.raceId
WHERE
    c.nome = 'Brazilian Grand Prix'
        AND r.position = 1;
