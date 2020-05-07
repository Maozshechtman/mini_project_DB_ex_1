CREATE TABLE area
(
  areaID NUMERIC(3) NOT NULL,
  areaName VARCHAR(20) NOT NULL,
  PRIMARY KEY (areaID)
);

CREATE TABLE city
(
  cityName VARCHAR(20) NOT NULL,
  areaID NUMERIC(3) NOT NULL,
  PRIMARY KEY (cityName),
  FOREIGN KEY (areaID) REFERENCES area(areaID)
);

CREATE TABLE agent
(
  agentId NUMERIC(9) NOT NULL,
  agentName VARCHAR(20) NOT NULL,
  rating NUMERIC(2) NOT NULL,
  hireYear NUMERIC(4) NOT NULL,
  bossID NUMERIC(9) NOT NULL,
  salary FLOAT NOT NULL,
  areaID NUMERIC(3) NOT NULL,
  PRIMARY KEY (agentId),
  FOREIGN KEY (areaID) REFERENCES area(areaID)
);

CREATE TABLE client
(
  clientID NUMERIC(9) NOT NULL,
  clientName VARCHAR(20) NOT NULL,
  phone VARCHAR(10) NOT NULL,
  address VARCHAR(25) NOT NULL,
  agentId NUMERIC(9) NOT NULL,
  cityName VARCHAR(20) NOT NULL,
  PRIMARY KEY (clientID),
  FOREIGN KEY (agentId) REFERENCES agent(agentId),
  FOREIGN KEY (cityName) REFERENCES city(cityName)
);

CREATE TABLE schedule
(
  meetingTime DATE NOT NULL,
  agentId NUMERIC(9) NOT NULL,
  clientID NUMERIC(9) NOT NULL,
  PRIMARY KEY (meetingTime, agentId, clientID),
  FOREIGN KEY (agentId) REFERENCES agent(agentId),
  FOREIGN KEY (clientID) REFERENCES client(clientID),
  UNIQUE (agentId, clientID)
);