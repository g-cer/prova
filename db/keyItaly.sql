DROP DATABASE IF EXISTS keyItaly;
CREATE DATABASE keyItaly;
USE keyItaly;

DROP TABLE IF EXISTS Prodotto;

CREATE TABLE Prodotto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    prezzo NUMERIC(12,2) DEFAULT 0 NOT NULL,
    IVA INT DEFAULT 0 NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    grafica VARCHAR(400) NOT NULL,
    descrizione VARCHAR(150) NOT NULL,
    quantitaInStock INT DEFAULT 0 NOT NULL
);

DROP TABLE IF EXISTS Utente;

CREATE TABLE Utente (
	username VARCHAR(30) PRIMARY KEY ,
    pwd VARCHAR(64) NOT NULL,
    nome VARCHAR(30) NOT NULL,
    cognome VARCHAR(30) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    dataNascita DATE NOT NULL,
    nomeCarta VARCHAR(30),
    cognomeCarta VARCHAR(30),
    numCarta VARCHAR(50),
    dataScadenza DATE,
    CVV VARCHAR(5),
    cap VARCHAR(5),
    via VARCHAR(70),
    citta VARCHAR(30),
    tipo VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS Ordine;

CREATE TABLE Ordine (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    prezzoTotale NUMERIC(12,2) DEFAULT 0 NOT NULL,
    dataConsegna DATE NOT NULL,
    dataOrdine DATE NOT NULL,
    nomeConsegna VARCHAR(30) NOT NULL,
    cognomeConsegna VARCHAR(30) NOT NULL,
    cap VARCHAR(5) NOT NULL,
    via VARCHAR(70) NOT NULL,
    citta VARCHAR (30) NOT NULL,

    FOREIGN KEY(username) REFERENCES Utente(username)
		ON UPDATE CASCADE ON DELETE NO ACTION
);

DROP TABLE IF EXISTS Acquisto;

CREATE TABLE Acquisto (
    IDAcquisto INT AUTO_INCREMENT PRIMARY KEY,
	IDOrdine INT NOT NULL,
    IDProdotto INT NOT NULL,
    quantita INT DEFAULT 1 NOT NULL,
	immagine VARCHAR(400),
    prezzoAq NUMERIC(12,2) DEFAULT 0 NOT NULL,
    ivaAq INT DEFAULT 0 NOT NULL,

    FOREIGN KEY(IDOrdine) REFERENCES Ordine(ID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(IDProdotto) REFERENCES Prodotto(ID)
        ON UPDATE CASCADE ON DELETE NO ACTION
);
