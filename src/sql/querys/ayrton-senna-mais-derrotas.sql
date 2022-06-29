#4 Qual Pista Ayrton Senna teve mais derrotas?(corridas em que ele mais se saiu mal e não chegou em 1º lugar)

SELECT 
    corridas.nome AS Nome_da_corrida,
    COUNT(corridas.nome) AS Derrotas
FROM
    pilotosposicoes
        INNER JOIN
    corridas ON corridas.raceId = pilotosposicoes.raceId
WHERE
    driverId = 102 AND wins = 0
GROUP BY Nome_da_corrida
ORDER BY Derrotas DESC;