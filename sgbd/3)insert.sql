/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  mahan
 * Created: 18 févr. 2025
 */

INSERT INTO Modele (nom) VALUES 
('Boeing 747'),
('Airbus A320'),
('Concorde'),
('Embraer E190'),
('Cessna 172');

INSERT INTO Pays (nom) VALUES 
('Madagascar'),
('Comores'),
('Maurice'),
('Seychelles'),
('Mozambique');

INSERT INTO TypeUser (nom) VALUES 
('Admin'),
('User');

INSERT INTO TypeSiege (nom) VALUES 
('Business'),
('Ecocomic');

INSERT INTO Avion (nom, fabrication, idmodele) VALUES 
('Air Force One', '1990-09-06', 1),  -- Boeing 747
('EasyJet 320', '2015-06-20', 2),    -- Airbus A320
('British Concorde', '1976-01-21', 3), -- Concorde
('Embraer Azul', '2018-04-15', 4),   -- Embraer E190
('Skyhawk Alpha', '2022-03-10', 5);  -- Cessna 172

INSERT INTO Ville (photos, nom, idpays) VALUES 
-- Madagascar 🇲🇬
('tana.jpg', 'Antananarivo', 1),
('majunga.jpg', 'Mahajanga', 1),
('tulear.jpg', 'Toliara', 1),

-- Comores 🇰🇲
('moroni.jpg', 'Moroni', 2),
('mtsangamouji.jpg', 'Mtsangamouji', 2),
('fomboni.jpg', 'Fomboni', 2),

-- Maurice 🇲🇺
('portlouis.jpg', 'Port-Louis', 3),
('curepipe.jpg', 'Curepipe', 3),
('mahebourg.jpg', 'Mahébourg', 3),

-- Seychelles 🇸🇨
('victoria.jpg', 'Victoria', 4),
('anse_boileau.jpg', 'Anse Boileau', 4),
('baie_lazare.jpg', 'Baie Lazare', 4),

-- Mozambique 🇲🇿
('maputo.jpg', 'Maputo', 5),
('beira.jpg', 'Beira', 5),
('nampula.jpg', 'Nampula', 5);

INSERT INTO Utilisateur (nom, prenom, email, mdp, telephone, idtype) VALUES 
-- Admin
('Rakoto', 'Andrianina', 'andrianina.rakoto@example.com', 'Admin@123', '+261331234567', 1),

-- Utilisateur classique
('Rasoanaivo', 'Fenohasina', 'fenohasina.rasoanaivo@example.com', 'User@123', '+261334567890', 2);

-- Insertion des 7 places en classe business (idtype = 1)
INSERT INTO Place (nom, promotion, idtype, idavion) VALUES 
('Business 1', 1, 1),
('Business 2', 1, 1),
('Business 3', 1, 1),
('Business 4', 1, 1),
('Business 5', 1, 1),
('Business 6', 1, 1),
('Business 7', 1, 1);

-- Insertion des 45 places en classe économique (idtype = 2)
INSERT INTO Place (nom, idtype, idavion) VALUES 
('Eco 1', 2, 1),
('Eco 2', 2, 1),
('Eco 3', 2, 1),
('Eco 4', 2, 1),
('Eco 5', 2, 1),
('Eco 6', 2, 1),
('Eco 7', 2, 1),
('Eco 8', 2, 1),
('Eco 9', 2, 1),
('Eco 10', 2, 1),
('Eco 11', 2, 1),
('Eco 12', 2, 1),
('Eco 13', 2, 1),
('Eco 14', 2, 1),
('Eco 15', 2, 1),
('Eco 16', 2, 1),
('Eco 17', 2, 1),
('Eco 18', 2, 1),
('Eco 19', 2, 1),
('Eco 20', 2, 1),
('Eco 21', 2, 1),
('Eco 22', 2, 1),
('Eco 23', 2, 1),
('Eco 24', 2, 1),
('Eco 25', 2, 1),
('Eco 26', 2, 1),
('Eco 27', 2, 1),
('Eco 28', 2, 1),
('Eco 29', 2, 1),
('Eco 30', 2, 1),
('Eco 31', 2, 1),
('Eco 32', 2, 1),
('Eco 33', 2, 1),
('Eco 34', 2, 1),
('Eco 35', 2, 1),
('Eco 36', 2, 1),
('Eco 37', 2, 1),
('Eco 38', 2, 1),
('Eco 39', 2, 1),
('Eco 40', 2, 1),
('Eco 41', 2, 1),
('Eco 42', 2, 1),
('Eco 43', 2, 1),
('Eco 44', 2, 1),
('Eco 45', 2, 1);
