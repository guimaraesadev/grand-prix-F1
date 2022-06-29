#1 Quantas vezes Ayrton senna esteve nos podium's?

SELECT DISTINCT
    pilotosposicoes.driverId,
    pilotos.forename AS Piloto,
    pilotos.surname AS Sobrenome,
    COUNT(position) AS Vezes
FROM
    pilotosposicoes
        INNER JOIN
    pilotos ON pilotosposicoes.driverId = pilotos.driverId
WHERE
    pilotosposicoes.driverId = 102
        AND position <= 3;