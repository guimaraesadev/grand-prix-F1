#3 Qual foi a volta mais rápida da F1? (em ordem crescente, 5 voltas mais rápidas da história)

SELECT 
    corridas.nome AS Nome_da_corrida,
    corridas.dia,
    corridas.hora,
    pilotos.forename AS Piloto,
    pilotos.surname AS Sobrenome,
    fastestLapTime AS Volta_mais_rapida
FROM
    resultados
        INNER JOIN
    corridas ON corridas.raceId = resultados.raceId
        INNER JOIN
    pilotos ON pilotos.driverId = resultados.driverId
WHERE
    NOT fastestLapTime = 'null'
ORDER BY fastestLapTime ASC
LIMIT 5;