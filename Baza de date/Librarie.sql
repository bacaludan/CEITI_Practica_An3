-- Utilizarea bazei de date 'master'
USE master;

GO

-- Suprimarea bazei de date (dacă există)
DROP DATABASE IF EXISTS Librarie;

GO

-- Crearea bazei de date 'biblioteca'
CREATE DATABASE Librarie;

GO

-- Utilizarea bazei de date 'biblioteca'
USE Librarie;

GO

-- Setarea dateformat (dmy)
SET DATEFORMAT dmy;

GO

-- Crearea tabelului 'furnizor'
CREATE TABLE furnizor (

	id_furnizor INT IDENTITY(1,1) PRIMARY KEY,
	nume VARCHAR(150),
	adresa VARCHAR(150)

);

GO

-- Crearea tabelului 'carte'
CREATE TABLE carte (

	id_carte INT IDENTITY(1, 1) PRIMARY KEY, -- identificator pentru carte
	denumire VARCHAR(50) NOT NULL, -- denumirea cărții
	autor VARCHAR(50) NOT NULL, -- autorul cărții
	editura VARCHAR(50) NOT NULL, -- editura cărții
	anul_editiei INT CONSTRAINT const_check CHECK (anul_editiei >= 1000) NOT NULL, -- anul ediției
	domeniu VARCHAR(50) NOT NULL, -- domeniul cărții
	limba VARCHAR(3), -- limba in care este scrisa cartea
	pret MONEY, -- prețul
	nrExemp INT, -- numarul de carti cu acelasi titlu
	furnizor INT FOREIGN KEY REFERENCES furnizor(id_furnizor)

);

GO

-- Crearea tabelului 'client'
CREATE TABLE client (

	id_client INT IDENTITY(1, 1) PRIMARY KEY, -- identificator pentru client
	nume VARCHAR(30) NOT NULL, -- nume client
	prenume VARCHAR(30) NOT NULL, -- prenume client
	adresa VARCHAR(50) NOT NULL, -- adresă client
	telefon INT -- nr. de telefon al clientului

);

GO

-- Crearea tabelului 'inchiriere'
CREATE TABLE inchiriere (

	id_inchiriere INT IDENTITY(1, 1) PRIMARY KEY, -- identificator pentru închiriere
	id_carte INT FOREIGN KEY REFERENCES carte(id_carte), -- identificator pentru carte (FOREIGN KEY)
	id_client INT FOREIGN KEY REFERENCES client(id_client), -- identificator pentru client (FOREIGN KEY)
	cost_inchiriere MONEY CONSTRAINT df_cost DEFAULT 30 NOT NULL, /* pentru o zi */ -- cost
	data_inchirierii DATE NOT NULL,
	data_returnarii DATE NOT NULL
	/*
		perioada de închiriere se stabilește în funcție
		de nr. de zile (data_returnarii - data_inchirierii)
	*/
	
);

GO

-- Crearea tabelului 'carteLivrata'
CREATE TABLE carteLivrata (

	id INT IDENTITY(1,1) PRIMARY KEY,
	nume VARCHAR(100),
	autor VARCHAR(100),
	cantitate INT,
	furnizor INT FOREIGN KEY REFERENCES furnizor(id_furnizor)

);

GO

-- Crearea tabelului 'Userr'
CREATE TABLE Userr (

	id INT IDENTITY(1,1) PRIMARY KEY,
	username VARCHAR(100),
	pass VARCHAR(100)

);

-- Introducerea de valori in tabelul 'furnizori'
INSERT INTO furnizor VALUES --(

	('Microsoft Press', 'Redmond, WA 98052, SUA'),
	('O Reilly Media, Inc.', '1005 Gravenstein Highway North, Sebastopol, CA 95472, SUA'),
	('Apress', '233 Spring Street, New York, NY 10013, SUA'),
	('Wiley', '111 River Street, Hoboken, NJ 07030-5774, SUA'),
	('Packt Publishing', '80 - 82, Whitechapel High Street, London, E1 7QX, Marea Britanie'),
	('McGraw-Hill Education', '2 Penn Plaza, New York, NY 10121, SUA'),
	('Addison-Wesley Professional', '75 Arlington Street, Suite 300, Boston, MA 02116, SUA'),
	('Sams Publishing', '1600 Miller Parkway, McHenry, IL 60050, SUA'),
	('Sybex', '111 River Street, Hoboken, NJ 07030-5774, SUA'),
	('Murach', '225 Wildwood Ave, Merrimack, NH 03054, SUA'),

	('Wrox Press', '111 River Street, Hoboken, NJ 07030-5774, SUA'),
	('Que Publishing', '800 East 96th Street, Indianapolis, IN 46240, SUA'),
	('Auerbach Publications', '2 Park Avenue, 21st Floor, New York, NY 10016, SUA'),
	('Morgan Kaufmann Publishers', '225 Wyman Street, Waltham, MA 02451, SUA'),
	('Prentice Hall', '75 Arlington Street, Suite 300, Boston, MA 02116, SUA'),
	('Cambridge University Press', 'The Edinburgh Building, Shaftesbury Road, Cambridge CB2 8RU, Regatul Unit'),
	('CRC Press', '6000 Broken Sound Parkway NW, Suite 300, Boca Raton, FL 33487-2742, SUA'),
	('Manning Publications', '20 Baldwin Road, PO Box 261, Shelter Island, NY 11964, SUA'),
	('No Starch Press', '245 8th St, San Francisco, CA 94103, SUA'),
	('Microsoft Learning', 'One Microsoft Way, Redmond, WA 98052, SUA'),

	('Murachs Books', '225 Wildwood Ave, Merrimack, NH 03054, SUA'),
	('Focal Press', '6000 Broken Sound Parkway NW, Suite 300, Boca Raton, FL 33487-2742, SUA'),
	('Ovum', '9 Devonshire Square, London, EC2M 4YF, Marea Britanie'),
	('Elsevier', 'Radarweg 29, 1043 NX Amsterdam, Olanda'),
	('Addison-Wesley Longman', '10 Bank Street, White Plains, NY 10606, SUA'),
	('Peachpit Press', '1249 Eighth Street, Berkeley, CA 94710, SUA'),
	('Technics Publications', '4208 Six Forks Road, Suite 1000, Raleigh, NC 27609, SUA'),
	('SitePoint Pty', '44 Market Street, Sydney, NSW 2000, Australia'),
	('Saddleback Educational Publishing', '6 Hamilton Landing, Suite 150, Novato, CA 94949, SUA'),
	('For Dummies', '111 River Street, Hoboken, NJ 07030-5774, SUA'),

	('Morgan James Publishing', '1225 Franklin Avenue, Garden City, NY 11530, SUA'),
	('Pakt Publishing Pvt.', 'Ltd., 4th Floor, A – 109, Sector – 63, Noida, UP, India – 201307'),
	('Apress Media LLC', '233 Spring Street, New York, NY 10013, SUA'),
	('Wiley India Pvt.', 'The Taj Mahal Palace & Tower, Apollo Bunder, Mumbai 400001, India'),
	('John Wiley & Sons Australia Ltd', '42 McDougall Street, Milton, Queensland 4064, Australia'),
	('Wiley-VCH Verlag GmbH & Co.', 'D-69469 Weinheim, Germania'),
	('Pearson Education Asia Ltd.', '25th Floor, Citibank Tower, 3 Garden Road, Central, Hong Kong'),
	('Packt Publishing Pvt.', 'Livery Place, 35 Livery Street, Birmingham, B3 2PB, Marea Britanie'),
	('Rocky Nook', '802 E Cota St, Santa Barbara, CA 93103, SUA'),
	('Springer Nature', 'One New York Plaza, Suite 4500, New York, NY 10004-1562, SUA'),

	('Hachette Livre', '58 rue Jean Bleuzen, 92178 Vanves Cedex, Franta'),
	('Cengage Learning', '200 Stamford Pl, Stamford, CT 06902, SUA'),
	('Addison Wesley Longman Australia Pty Ltd', '271 William Street, Melbourne, Victoria 3000, Australia'),
	('S. Chand Publishing', 'Ram Nagar, New Delhi 110055, India'),
	('Springer-Verlag GmbH', 'Tiergartenstrasse 17, 69121 Heidelberg, Germania'),
	('Manning Publications Co.', '20 Baldwin Road, PO Box 261, Shelter Island, NY 11964, SUA'),
	('Discovery Press', '4th Floor, International House, 1 St Katherines Way, London E1W 1UN, Marea Britanie'),
	('CreateSpace Independent Publishing Platform', '2231 Crystal Drive, Suite 150, Arlington, VA 22202, SUA'),
	('Morgan & Claypool Publishers', '4340 East West Highway, Suite 301, Bethesda, MD 20814, SUA'),
	('Newnes', 'The Boulevard, Langford Lane, Kidlington, OX5 1GB, Marea Britanie');

--);

GO

-- Introducerea de valori în tabelul 'carte'
INSERT INTO carte VALUES --(

	('Abatia', 'Ernesto_Sabato', 'Editura1', 1974, 'Domeniu1', 'ro', 150, 20, 1),
	('Adam_si_Eva', 'Liviu_Rebreanu', 'Editura1', 1925, 'Domeniu2', 'ro', 149, 20, 1),
	('Adolescenta', 'Lev_Tolstoi', 'Editura2', 1854, 'Domeniu3', 'en', 180, 20, 1),
	('Amandoi', 'Liviu Rebreanu', 'Editura1', 1940, 'Domeniu2', 'ro', 250, 20, 2),
	('Amurg', 'Stephenie_Meyer', 'Editura2', 2005, 'Domeniu1', 'en', 349, 20, 2),
	('Arena_sumbra', 'Mario_Puzo', 'Editura1', 1955, 'Domeniu1', 'ro', 155, 20, 2),
	('Avatarul', 'Poul_Anderson', 'Editura3', 1978, 'Domeniu1', 'ru', 199, 20, 3),
	('Axa', 'Robert_Charles_Wilson', 'Editura2', 2007, 'Domeniu2', 'ro', 230, 20, 3),
	('Armele_din_Avalon', 'Roger_Zelazny', 'Editura1', 1972, 'Domeniu2', 'ru', 110, 20, 4),
	('Amintiri_despre_Viitor', 'Erich_von_Daniken', 'Editura2', 1968, 'Domeniu4', 'ro', 420, 20, 4),
	('Amintiri_din_copilarie', 'Ion_Creanga', 'Editura1', 1892, 'Domeniu1', 'ro', 160, 20, 4),
	('Alegerea_lui_Hobson', 'Robert_Sawyer', 'Editura2', 1995, 'Domeniu2', 'en', 170, 20, 4),
	('A_doua_patrie', 'Jules_Verne', 'Editura1', 1900, 'Domeniu5', 'ro', 137, 20, 4),
	('Adncurile_cerului', 'Vernor_Vinge', 'Editura4', 1999, 'Domeniu1', 'en', 212, 20, 5),
	('Agonie_si_extaz', 'Irving_Stone', 'Editura2', 1961, 'Domeniu2', 'ro', 278, 20, 5),
	('Aripile_noptii', 'Robert_Silverbert', 'Editura3', 1968, 'Domeniu3', 'en', 333, 20, 5),
	('Arta_iubirii', 'Publius_Ovidius_Naso', 'Editura5', 1500, 'Domeniu4', 'ro', 300, 20, 5),
	('Aventurile_lui_TomSawyer', 'Mark_Twain', 'Editura1', 1876, 'Domeniu2', 'ro', 210, 20, 5),
	('Arhanghelii', 'Ion_Agarbiceanu', 'Editura2', 1913, 'Domeniu2', 'fr', 200, 20, 5),
	('Adolescentul', 'Feodor_Dostoievski', 'Editura1', 1875, 'Domeniu1', 'ro', 100, 20, 5),
	('Fahrenheit 451', 'Bradbury T.', 'Editura1', 1950, 'Domeniu1', 'fr', 130, 20, 5),
	('Fluturi (2vol.)', 'Binder Irina', 'Editura2', 1980, 'Domeniu2', 'ro', 166, 20, 6),
	('Fata din tren', 'Hawkins P.J.', 'Editura3', 1888, 'Domeniu5', 'ro', 199, 20, 6),
	('In umbra pasilor tai', 'Cipileaga V.', 'Editura1', 2000, 'Domeniu1', 'en', 250, 20, 6),
	('Fata cu vise', 'Russo Andreea', 'Editura1', 2010, 'Domeniu1', 'ro', 229, 20, 6),
	('Hotul de carti', 'Zusak M.', 'Editura5', 2011, 'Domeniu2', 'en', 175, 20, 6),
	('Bine', 'Guzun I.', 'Editura1', 2015, 'Domeniu1', 'ro', 150, 20, 6),
	('Alchimistul', 'Coelho P.', 'Editura5', 2010, 'Domeniu1', 'ro', 170, 20, 6),
	('Cel mai bogat om din babilon', 'Clason G.S.', 'Editura1', 2005, 'Domeniu2', 'en', 100, 20, 6),
	('In ape adanci', 'Hawkins P.J.', 'Editura3', 2000, 'Domeniu3', 'ro', 180, 20, 7),
	('Pana la sfarsit', 'Binder Irina', 'Editura1', 2004, 'Domeniu1', 'ro', 280, 20, 7),
	('De trei ori tu', 'Moccia Federico', 'Editura3', 2003, 'Domeniu1', 'ru', 299, 20, 7),
	('Dopamina', 'Lieberman Daniel', 'Editura1', 1990, 'Domeniu1', 'ro', 285, 20, 7),
	('Zona de interes', 'Amis Martin', 'Editura2', 2000, 'Domeniu2', 'ru', 177, 20, 7),
	('Origini', 'Brown D.', 'Editura3', 2010, 'Domeniu3', 'ro', 330, 20, 7),
	('Tema pentru acasa', 'Dabija Nicolae', 'Editura5', 2000, 'Domeniu4', 'ro', 100, 20, 7),
	('Enciclopedia Craciunului', 'Anonim', 'Editura1', 2018, 'Domeniu5', 'en', 350, 20, 7),
	('Povestiri', 'Anton Cehov', 'Editura1', 2010, 'Domeniu1', 'en', 150, 20, 7),
	('Omul invizibil', 'Ralph Ellison', 'Editura3', 2014, 'Domeniu2', 'en', 100, 20, 7),
	('Medea', 'Euripide', 'Editura1', 2010, 'Domeniu1', 'ro', 399, 20, 7),
	('Avatarul', 'Poul_Anderson', 'Editura3', 1978, 'Domeniu1', 'ro', 199, 20, 8),
	('Axa', 'Robert_Charles_Wilson', 'Editura2', 2007, 'Domeniu2', 'ro', 230, 20, 8),
	('Armele_din_Avalon', 'Roger_Zelazny', 'Editura1', 1972, 'Domeniu2', 'fr', 110, 20, 8),
	('Amintiri_despre_Viitor', 'Erich_von_Daniken', 'Editura2', 1968, 'Domeniu4', 'ro', 420, 20, 8),
	('Amintiri_din_copilarie', 'Ion_Creanga', 'Editura1', 1892, 'Domeniu1', 'ro', 160, 20, 8),
	('Alegerea_lui_Hobson', 'Robert_Sawyer', 'Editura2', 1995, 'Domeniu2', 'en', 170, 20, 9),
	('A_doua_patrie', 'Jules_Verne', 'Editura1', 1900, 'Domeniu5', 'en', 137, 20, 9),
	('Adncurile_cerului', 'Vernor_Vinge', 'Editura4', 1999, 'Domeniu1', 'ro', 212, 20, 9),
	('Agonie_si_extaz', 'Irving_Stone', 'Editura2', 1961, 'Domeniu2', 'en', 278, 20, 9),
	('Aripile_noptii', 'Robert_Silverbert', 'Editura3', 1968, 'Domeniu3', 'ro', 333, 20, 10);

-- );

GO

-- Introducerea de valori în tabelul 'client'
INSERT INTO client VALUES --(
	
	('Ionescu', 'Ion', 'Adresa1', '0677612521'),
	('Mihaiescu', 'Mihai', 'Adresa2', '067781254'),
	('Dumitru', 'Alin', 'Adresa3', '078895710'),
	('Carmen', 'Radu', 'Adresa4', '068834555'),
	('Vasile', 'Razvan', 'Adresa5', '060005341'),
	('Teodorescu', 'Ion', 'Adresa6', '078834712'),
	('Nedelcu', 'Ion', 'Adresa7', '061234543'),
	('Ederes', 'Catrina', 'Adresa8', '068794100'),
	('Iancu', 'Maria', 'Adresa9', '067384912'),
	('Paun', 'Sorin', 'Adresa10', '070079796'),
	('Maria', 'Marian', 'Adresa11', '071234567'),
	('Dragu', 'Maria', 'Adresa12', '060123412'),
	('Enache', 'Florin', 'Adresa13', '078914295'),
	('Popescu', 'Alex', 'Adresa14', '064356712'),
	('Adel', 'Ion', 'Adresa15', '071010101'),
	('Mihai', 'Elena', 'Adresa16', '068394112'),
	('Cristian', 'Ioana', 'Adresa17', '070341212'),
	('Stefan', 'Stefania', 'Adresa18', '065478193'),
	('Darius', 'Stefan', 'Adresa19', '061357910'),
	('Popesco', 'Andrei', 'Adresa20', '070403021'),
	('Dan', 'Ion', 'Adresa21', '067767231'),
	('Mihai', 'Mihai', 'Adresa22', '023781254'),
	('Alin', 'Alin', 'Adresa23', '078715710'),
	('Radu', 'Radu', 'Adresa24', '068888555'),
	('Razvan', 'Razvan', 'Adresa25', '065705341'),
	('Teo', 'Ion', 'Adresa26', '078794712'),
	('Ion', 'Ion', 'Adresa27', '061234103'),
	('Catrina', 'Catrina', 'Adresa28', '068114100'),
	('Maria', 'Maria', 'Adresa29', '0673842912'),
	('Paul', 'Sorin', 'Adresa30', '070079106'),
	('Marian', 'Marian', 'Adresa31', '013034567'),
	('Dres', 'Maria', 'Adresa32', '060423412'),
	('Florin', 'Florin', 'Adresa33', '033914295'),
	('Alex', 'Alex', 'Adresa34', '065356712'),
	('Aion', 'Ion', 'Adresa35', '0710145101'),
	('Elena', 'Elena', 'Adresa36', '068312112'),
	('Cristi', 'Ioana', 'Adresa37', '070346232'),
	('Stefania', 'Stefania', 'Adresa38', '065477193'),
	('Daria', 'Stefan', 'Adresa39', '061353110'),
	('Andrei', 'Andrei', 'Adresa40', '070406121'),
	('Ionescu', 'Ionescu', 'Adresa41', '067768131'),
	('Mihaiescu', 'Mihaiescu', 'Adresa42', '041781254'),
	('Dumitru', 'Dumitru', 'Adresa43', '078785710'),
	('Carmen', 'Relu', 'Adresa44', '068812555'),
	('Vasile', 'Vasile', 'Adresa45', '0605605341'),
	('Teodorescu', 'Teodorescu', 'Adresa46', '077234712'),
	('Nedelcu', 'Nedelcu', 'Adresa47', '061237443'),
	('Ederes', 'George', 'Adresa48', '062394100'),
	('Iancu', 'Iancu', 'Adresa49', '067387112'),
	('Paun', 'Darius', 'Adresa10', '070079107'),
	('Ionescu', 'Ion', 'Adresa1', '0677612521'),
	('Mihaiescu', 'Mihai', 'Adresa2', '067781254'),
	('Dumitru', 'Alin', 'Adresa3', '078895710'),
	('Carmen', 'Radu', 'Adresa4', '068834555'),
	('Vasile', 'Razvan', 'Adresa5', '060005341'),
	('Teodorescu', 'Ion', 'Adresa6', '078834712'),
	('Nedelcu', 'Ion', 'Adresa7', '061234543'),
	('Ederes', 'Catrina', 'Adresa8', '068794100'),
	('Iancu', 'Maria', 'Adresa9', '067384912'),
	('Paun', 'Sorin', 'Adresa10', '070079796'),
	('Maria', 'Marian', 'Adresa11', '071234567'),
	('Dragu', 'Maria', 'Adresa12', '060123412'),
	('Enache', 'Florin', 'Adresa13', '078914295'),
	('Popescu', 'Alex', 'Adresa14', '064356712'),
	('Adel', 'Ion', 'Adresa15', '071010101'),
	('Mihai', 'Elena', 'Adresa16', '068394112'),
	('Cristian', 'Ioana', 'Adresa17', '070341212');

-- );

GO

-- Introducerea de valori în tabelul 'inchiriere'
INSERT INTO inchiriere VALUES --(
	
	(3, 2, 50, '09.01.2020', '09.02.2020'),
	(1, 3, 40, '13.09.2021', '15.10.2021'),
	(2, 4, 100, '10.10.2021', '10.11.2021'),
	(4, 5, 30, '11.12.2021', '11.01.2022'),
	(7, 6, 20, '05.07.2021', '08.08.2021'),
	(5, 7, 25, '01.07.2021', '05.08.2021'),
	(6, 8, 50, '06.09.2021', '05.10.2021'),
	(8, 1, 30, '03.01.2022', '03.02.2022'),
	(9, 9, 100, '19.10.2021', '19.12.2021'),
	(13, 12, 30, '15.08.2021', '19.10.2021'),
	(10, 11, 35, '07.07.2021', '25.07.2021'),
	(11, 10, 50, '15.04.2021', '15.05.2021'),
	(12, 15, 40, '23.11.2021', '23.12.2021'),
	(15, 13, 30, '06.10.2021', '07.11.2021'),
	(14, 14, 100, '13.08.2021', '17.09.2021'),
	(18, 17, 50, '18.09.2021', '18.10.2021'),
	(16, 18, 30, '19.06.2021', '19.07.2021'),
	(17, 16, 90, '24.07.2021', '30.07.2021'),
	(20, 19, 50, '15.10.2021', '15.11.2021'),
	(19, 20, 10, '10.10.2021', '11.11.2021'),
	(14, 4, 50, '09.01.2020', '09.02.2020'),
	(11, 7, 40, '13.09.2021', '15.10.2021'),
	(20, 1, 100, '10.10.2021', '10.11.2021'),
	(13, 8, 30, '11.12.2021', '11.01.2022'),
	(17, 11, 20, '05.07.2021', '08.08.2021'),
	(18, 8, 25, '01.07.2021', '05.08.2021'),
	(14, 1, 50, '06.09.2021', '05.10.2021'),
	(13, 7, 30, '03.01.2022', '03.02.2022'),
	(17, 3, 100, '19.10.2021', '19.12.2021'),
	(7, 11, 30, '15.08.2021', '19.10.2021'),
	(2, 17, 35, '07.07.2021', '25.07.2021'),
	(12, 13, 50, '15.04.2021', '15.05.2021'),
	(10, 14, 40, '23.11.2021', '23.12.2021'),
	(13, 10, 30, '06.10.2021', '07.11.2021'),
	(12, 19, 100, '13.08.2021', '17.09.2021'),
	(10, 18, 50, '18.09.2021', '18.10.2021'),
	(3, 7, 30, '19.06.2021', '19.07.2021'),
	(13, 5, 90, '24.07.2021', '30.07.2021'),
	(20, 4, 50, '15.10.2021', '15.11.2021'),
	(10, 1, 10, '10.10.2021', '11.11.2021'),
	(15, 4, 50, '03.02.2020', '09.02.2020'),
	(11, 2, 40, '15.03.2021', '15.10.2021'),
	(10, 3, 100, '07.11.2021', '10.11.2021'),
	(5, 6, 30, '15.07.2021', '11.01.2022'),
	(3, 7, 20, '07.01.2021', '08.08.2021'),
	(1, 1, 25, '02.07.2021', '05.08.2021'),
	(2, 8, 50, '06.01.2021', '05.10.2021'),
	(8, 11, 30, '04.02.2022', '05.02.2022'),
	(15, 19, 100, '18.10.2021', '19.12.2021'),
	(17, 5, 30, '15.08.2021', '19.10.2021'),
	(13, 15, 35, '07.07.2021', '25.07.2021'),
	(15, 18, 50, '05.04.2021', '15.05.2021'),
	(17, 12, 40, '23.11.2021', '23.12.2021'),
	(7, 11, 30, '07.10.2021', '07.11.2021'),
	(10, 10, 100, '01.08.2021', '17.09.2021');

-- );

GO

-- Inserarea de valori in tabelul 'carteLivrata'
INSERT INTO carteLivrata VALUES --(

	('Abatia', 'Ernesto_Sabato', 30, 1),
	('To Kill a Mockingbird', 'Harper Lee', 30, 2),
	('The Great Gatsby', 'F. Scott Fitzgerald', 30, 2),
	('Pride and Prejudice', 'Jane Austen', 30, 3),
	('1984', 'George Orwell', 30, 4),
	('The Catcher in the Rye', 'J.D. Salinger', 30, 5),
	('Lord of the Flies', 'William Golding', 30, 6),
	('Wuthering Heights', 'Emily Bronte', 30, 7),
	('Jane Eyre', 'Charlotte Bronte', 30, 8),
	('The Canterbury Tales', 'Geoffrey Chaucer', 30, 9),
	('The Picture of Dorian Gray', 'Oscar Wilde', 30, 10),
	('Sense and Sensibility', 'Jane Austen', 30, 11),
	('Dracula', 'Bram Stoker', 30, 12),
	('Frankenstein', 'Mary Shelley', 30, 13),
	('The Adventures of Huckleberry Finn', 'Mark Twain', 30, 14),
	('A Tale of Two Cities', 'Charles Dickens', 30, 15),
	('Hamlet', 'William Shakespeare', 30, 16),
	('The Importance of Being Earnest', 'Oscar Wilde', 30, 17),
	('Animal Farm', 'George Orwell', 30, 18),
	('The Scarlet Letter', 'Nathaniel Hawthorne', 30, 19),
	('The Strange Case of Dr. Jekyll and Mr. Hyde', 'Robert Louis Stevenson', 30, 20),
	('The Hobbit', 'J.R.R. Tolkien', 30, 21),
	('The Lord of the Rings', '.R.R. Tolkien', 30, 1);

--);

GO


/*
-- Calculul venitului bibliotecii
SELECT SUM (DATEDIFF (day, data_inchirierii, data_returnarii) * cost_inchiriere) AS Profit FROM inchiriere;

-- Numărul de cărți din bibliotecă
SELECT COUNT (id_carte) AS NumarCarti FROM carte;

-- Numărul de clienți înregistrați
SELECT COUNT (id_client) AS NumarClienti FROM client;

-- Numărul de închirieri din bibliotecă
SELECT COUNT (id_inchiriere) AS NumarInchirieri FROM inchiriere;

-- Afișarea închirierilor pentru o perioadă <= 30 zile
SELECT * FROM inchiriere WHERE ((DATEDIFF (day, data_inchirierii, data_returnarii)) <= 30);

-- Afișarea clienților a căror prenume este 'Ion'
SELECT * FROM client WHERE (prenume = 'Ion');

-- Afișarea perioadei minime de închiriere înregistrată în tabelul 'inchiriere'
SELECT MIN (DATEDIFF(day, data_inchirierii, data_returnarii)) AS InchiriereMinima FROM inchiriere;

-- Afișarea prețului mediu de închiriere pentru o zi
SELECT AVG (cost_inchiriere) AS PretMediu FROM inchiriere;

-- Afișarea datelor din tabelul 'carte'
SELECT * FROM carte;

-- Afișarea datelor din tabelul 'client'
SELECT * FROM client;

-- Afișarea datelor din tabelul 'inchiriere'
SELECT * FROM inchiriere;

-- Afișarea pretului maxim, minim, mediu al costului de inchiriere:
SELECT MAX(cost_inchiriere) AS CostMaximInchiriere, MIN(cost_inchiriere) AS CostMinimInchiriere,
AVG(cost_inchiriere) AS MediaCostului FROM inchiriere;

-- Modificarea datelor în tabele. UPDATE
UPDATE inchiriere SET cost_inchiriere = 50 WHERE cost_inchiriere = 30;

-- Comanda SELECT (returnează clienții ce au inițiala numelui 'A'):
SELECT * FROM client WHERE nume LIKE 'A%' ORDER BY nume ASC;

-- Afișarea distinctă a clienților ce au inițiala numelui 'D':
SELECT DISTINCT * FROM client WHERE nume LIKE 'D%' ORDER BY nume ASC;

-- Afișarea cărților cu anul editiei cuprins intre 1900 si 2000:
SELECT denumire, autor, anul_editiei FROM carte WHERE anul_editiei
IN (SELECT anul_editiei FROM carte WHERE (anul_editiei BETWEEN 1900 AND 2000));

-- Crearea unei viziuni:
CREATE VIEW NumarCarti AS SELECT COUNT(*) AS NrCarti FROM carte;

-- Afișarea viziunii:
SELECT * FROM NumarCarti;

-- Crearea unui user:
CREATE LOGIN Client1 WITH PASSWORD = '12345';
CREATE USER Client1 FOR LOGIN Client1;

-- Acordarea privilegiilor pentru user-ul Client1:
GRANT SELECT ON carte TO Client1;

-- Tranzacțiile SQL:
BEGIN TRANSACTION AddClient
INSERT INTO Client VALUES ('Dan', 'Dan', 'Adresa1', '06891231')
IF EXISTS (SELECT * FROM Client WHERE id_client = 11)
BEGIN BEGIN TRANSACTION UpdateClient
UPDATE Client SET Adresa = 'Adresa10' WHERE Adresa = 'Adresa5'
END ELSE ROLLBACK TRANSACTION;

-- Afișarea numele, prenume, id-ul cărții închiriate de fiecare client:
SELECT Client.nume, Client.Prenume, Inchiriere.id_carte FROM Client INNER JOIN Inchiriere ON Client.id_client = Inchiriere.id_client;

*/
INSERT INTO carte VALUES ('asd', 'asd', 'asd', 1123, 'asd', 'ro', 123, 0, 1);

DELETE FROM carte WHERE nrExemp = 0;

SELECT TOP 1 furnizor.nume, furnizor.adresa, COUNT(carte.nrExemp) AS NrExemp FROM furnizor, carte WHERE furnizor.id_furnizor = carte.furnizor GROUP BY furnizor.nume,furnizor.adresa
ORDER BY COUNT(carte.nrExemp) DESC; 

SELECT SUM(carte.pret) FROM carte WHERE carte.anul_editiei = 2000;

SELECT * from carte;

SELECT * FROM carte WHERE carte.limba = 'ro';

SELECT carte.denumire, carte.autor, carte.nrExemp FROM carte WHERE carte.limba = 'ro';

SELECT * FROM furnizor ORDER BY furnizor.nume ASC;

SELECT * FROM Userr;