-- Quantas vezes Ayrton senna esteve nas pole positions? Resposta = 112
select driverId, count(position) from pilotosposicoes
where driverId = 102 and position <= 3;