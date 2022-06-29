#2 Quais os pilotos mais jovens que pisaram no podium de um GP? (5 pilotos)

SELECT DISTINCT
    pilotos.forename as Piloto,
    pilotos.surname as Sobrenome,
    pilotos.dob as Data_de_Nascimento,
    pilotosposicoes.position
FROM
    pilotosposicoes
        INNER JOIN
    pilotos ON pilotosposicoes.driverId = pilotos.driverId
WHERE
    not dob = '1898-06-09' and position IN (1 , 2, 3)
ORDER BY RIGHT(dob, 4) DESC
LIMIT 5;