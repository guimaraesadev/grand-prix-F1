CREATE DATABASE GrandPrix_F1;
USE GrandPrix_F1;

CREATE TABLE IF NOT EXISTS temporadas (
    year INT UNSIGNED NOT NULL,
    url VARCHAR(80) NOT NULL,
    PRIMARY KEY (year)
);

CREATE TABLE IF NOT EXISTS status (
    statusId INT UNSIGNED NOT NULL,
    status VARCHAR(15) NOT NULL,
    PRIMARY KEY(statusId)
);

CREATE TABLE IF NOT EXISTS construtoras (
    constructorId INT UNSIGNED NOT NULL,
    constructorRef VARCHAR(20) NOT NULL,
    nome VARCHAR(30) NOT NULL,
    nationality VARCHAR(15) NOT NULL,
    url VARCHAR(80) NOT NULL,
    PRIMARY KEY (constructorId)
);

CREATE TABLE IF NOT EXISTS pilotos (
    driverId INT UNSIGNED NOT NULL,
    driverRef VARCHAR(20) NOT NULL,
    number INT,
    code VARCHAR(5),
    forename VARCHAR(20) NOT NULL,
    surname VARCHAR(20) NOT NULL,
    dob VARCHAR(15) NOT NULL,
    nationality VARCHAR(20) NOT NULL,
    url VARCHAR(80) NOT NULL,
    PRIMARY KEY(driverId)
);

CREATE TABLE IF NOT EXISTS circuitos (
    circuitId INT UNSIGNED NOT NULL,
    circuitRef VARCHAR(20) NOT NULL,
    nome VARCHAR(60) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    pais VARCHAR(15) NOT NULL,
    lat VARCHAR(10) NOT NULL,
    long VARCHAR(10) NOT NULL,
    url VARCHAR(80) NOT NULL,
    PRIMARY KEY (circuitId)
);

CREATE TABLE IF NOT EXISTS corridas (
    raceId INT UNSIGNED NOT NULL,
    year INT NOT NULL,
    round INT NOT NULL,
    circuitId INT NOT NULL,
    nome VARCHAR(40) NOT NULL,
    dia DATE NOT NULL,
    hora VARCHAR(10) NOT NULL,
    url VARCHAR(80) NOT NULL,
    PRIMARY KEY(raceId).
    FOREIGN KEY(circuitId) REFERENCES circuitos(circuitId)
);

CREATE TABLE IF NOT EXISTS qualificatorias (
    qualifyId INT UNSIGNED NOT NULL, 
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    constructorId INT NOT NULL,
    number INT NOT NULL,
    position INT NOT NULL,
    q1 VARCHAR(9),
    q2 VARCHAR(9),
    q3 VARCHAR(9),
    PRIMARY KEY(qualifyId),
    FOREIGN KEY(raceId) REFERENCES corridas(raceId),
    FOREIGN KEY(driverId) REFERENCES pilotos(driverId),
    FOREIGN KEY(constructorId) REFERENCES construtoras(constructorId)
);

CREATE TABLE IF NOT EXISTS resultados (
    resultId INT UNSIGNED NOT NULL,
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    constructorId INT NOT NULL,
    number INT NOT NULL,
    grid INT NOT NULL,
    position INT,
    positionText INT NOT NULL,
    positionOrder INT NOT NULL,
    points INT NOT NULL,
    laps INT NOT NULL,
    time TEXT,
    milliseconds INT,
    fastestLap INT,
    rank INT,
    fastestLapTime TEXT,
    fastestLapSpeed FLOAT,
    statusId INT NOT NULL,
    PRIMARY KEY (resultId),
    FOREIGN KEY(raceId) REFERENCES corridas(raceId),
    FOREIGN KEY(driverId) REFERENCES pilotos(driverId),
    FOREIGN KEY(constructorId) REFERENCES construtoras(constructorId),
    FOREIGN KEY(statusId) REFERENCES status(statusId)
);

CREATE TABLE IF NOT EXISTS construtorasResultados (
    constructorResultsId INT UNSIGNED NOT NULL,
    raceId INT NOT NULL,
    constructorId INT NOT NULL,
    points DECIMAL(2,1),
    status VARCHAR(10),
    PRIMARY KEY (constructorResultsId),
    FOREIGN KEY (raceId) REFERENCES corridas(raceId),
    FOREIGN KEY (constructorId) REFERENCES construtoras(constructorId)
);

CREATE TABLE IF NOT EXISTS construtorasPosicoes (
    constructorStandingsId INT UNSIGNED NOT NULL, 
    raceId INT NOT NULL,
    constructorId INT NOT NULL,
    points INT NOT NULL,
    position INT NOT NULL,
    positionText INT NOT NULL,
    wins INT NOT NULL,
    PRIMARY KEY(constructorStandingsId),
    FOREIGN KEY(raceId) REFERENCES corridas(raceId),
    FOREIGN KEY(constructorId) REFERENCES construtoras(constructorId)
);

CREATE TABLE IF NOT EXISTS pilotosPosicoes (
    driverStandingsId INT UNSIGNED NOT NULL, 
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    points INT NOT NULL,
    position INT NOT NULL,
    positionText INT NOT NULL,
    wins INT NOT NULL,
    PRIMARY KEY(driverStandingsId),
    FOREIGN KEY(raceId) REFERENCES corridas(raceId),
    FOREIGN KEY(constructorId) REFERENCES construtoras(constructorId)
)