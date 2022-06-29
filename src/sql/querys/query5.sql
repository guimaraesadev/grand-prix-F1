#5- Pista onde mais ocorreram acidentes de percurso na F1?

SELECT 
    corridas.nome, COUNT(corridas.nome) AS vezes
FROM
    resultados
        INNER JOIN
    corridas ON corridas.raceId = resultados.raceId
WHERE
    statusId = 3
GROUP BY corridas.nome
ORDER BY vezes DESC
LIMIT 20;