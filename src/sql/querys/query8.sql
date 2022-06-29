#8- Quais as nacionalidades dos 10 pilotos mais vitorias da F1?

SELECT 
    pilotos.surname,
    pilotos.nationality,
    MAX(pilotosposicoes.wins) AS vitorias
FROM
    pilotosposicoes
        INNER JOIN
    pilotos ON pilotos.driverId = pilotosposicoes.driverId
GROUP BY pilotos.surname
ORDER BY vitorias DESC
LIMIT 10;