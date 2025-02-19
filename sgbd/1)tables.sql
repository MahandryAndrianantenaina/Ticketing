CREATE TABLE Modele(
   idmodele SERIAL,
   nom VARCHAR(255)  NOT NULL,
   PRIMARY KEY(idmodele)
);

CREATE TABLE Pays(
   idpays SERIAL,
   nom VARCHAR(255)  NOT NULL,
   PRIMARY KEY(idpays)
);

CREATE TABLE TypeUser(
   idtype SERIAL,
   nom VARCHAR(255)  NOT NULL,
   PRIMARY KEY(idtype)
);

CREATE TABLE TypeSiege(
   idtype SERIAL,
   nom VARCHAR(255)  NOT NULL,
   PRIMARY KEY(idtype)
);

CREATE TABLE ReservationParam(
   idparametre SERIAL,
   heure TIME NOT NULL,
   application DATE DEFAULT CURRENT_DATE,
   PRIMARY KEY(idparametre)
);

CREATE TABLE AnnulationParam(
   idparametre SERIAL,
   heure TIME NOT NULL,
   application DATE DEFAULT CURRENT_DATE,
   PRIMARY KEY(idparametre)
);

CREATE TABLE Avion(
   idavion SERIAL,
   nom VARCHAR(255)  NOT NULL,
   fabrication DATE DEFAULT CURRENT_DATE,
   idmodele INTEGER NOT NULL,
   PRIMARY KEY(idavion),
   FOREIGN KEY(idmodele) REFERENCES Modele(idmodele)
);

CREATE TABLE Ville(
   idville SERIAL,
   photos VARCHAR(255)  NOT NULL,
   nom VARCHAR(255)  NOT NULL,
   idpays INTEGER NOT NULL,
   PRIMARY KEY(idville),
   FOREIGN KEY(idpays) REFERENCES Pays(idpays)
);

CREATE TABLE Vol(
   idvol SERIAL,
   depart TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   arrivee TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   prix NUMERIC(15,2)   DEFAULT 0,
   idavion INTEGER NOT NULL,
   idville INTEGER NOT NULL,
   PRIMARY KEY(idvol),
   FOREIGN KEY(idavion) REFERENCES Avion(idavion),
   FOREIGN KEY(idville) REFERENCES Ville(idville)
);

CREATE TABLE Utilisateur(
   idutilisateur SERIAL,
   nom VARCHAR(255)  NOT NULL,
   prenom VARCHAR(255)  NOT NULL,
   email VARCHAR(255)  NOT NULL,
   mdp VARCHAR(255)  NOT NULL,
   telephone VARCHAR(255)  NOT NULL,
   idtype INTEGER NOT NULL,
   PRIMARY KEY(idutilisateur),
   FOREIGN KEY(idtype) REFERENCES TypeUser(idtype)
);

CREATE TABLE Reservation(
   idreservation SERIAL,
   reservation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   etat INTEGER,
   quantite INTEGER DEFAULT 1,
   montant NUMERIC(15,2)   NOT NULL,
   idutilisateur INTEGER NOT NULL,
   idvol INTEGER NOT NULL,
   PRIMARY KEY(idreservation),
   FOREIGN KEY(idutilisateur) REFERENCES Utilisateur(idutilisateur),
   FOREIGN KEY(idvol) REFERENCES Vol(idvol)
);

CREATE TABLE Place(
   idplace SERIAL,
   nom VARCHAR(255)  NOT NULL,
   idtype INTEGER NOT NULL,
   idavion INTEGER NOT NULL,
   PRIMARY KEY(idplace),
   FOREIGN KEY(idtype) REFERENCES TypeSiege(idtype),
   FOREIGN KEY(idavion) REFERENCES Avion(idavion)
);

CREATE TABLE ReservationDetails(
   iddetails SERIAL,
   idreservation INTEGER NOT NULL,
   idplace INTEGER NOT NULL,
   PRIMARY KEY(iddetails),
   FOREIGN KEY(idreservation) REFERENCES Reservation(idreservation),
   FOREIGN KEY(idplace) REFERENCES Place(idplace)
);

CREATE TABLE Promotion(
   idpromotion SERIAL,
   place INTEGER NOT NULL,
   promotion NUMERIC(3,2)   NOT NULL,
   idtype INTEGER NOT NULL,
   idvol INTEGER NOT NULL,
   PRIMARY KEY(idpromotion),
   FOREIGN KEY(idtype) REFERENCES TypeSiege(idtype),
   FOREIGN KEY(idvol) REFERENCES Vol(idvol)
);
