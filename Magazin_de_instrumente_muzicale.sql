create schema magazin_instrumente_muzicale;

Create table curier(
		curier_id int,
		nume_curier varchar (255) NOT NULL,
        prenume_curier varchar (255) NOT NULL,
        firma_curierat varchar (255) NOT NULL,
        CONSTRAINT pk_curier_id PRIMARY KEY (curier_id) 
);

Create table angajat(
		angajat_id int,
		nume_angajat varchar (255) NOT NULL,
		prenume_angajat varchar (255) NOT NULL,
		salariu float NOT NULL,
		data_angajarii date NOT NULL,
		CONSTRAINT pk_angajat_id PRIMARY KEY (angajat_id)
);

Create table adresa(
		adresa_id int,
		judet varchar (255) NOT NULL,
		oras varchar (255) NOT NULL,
		sector varchar (255),
		strada varchar (255) NOT NULL,
		numar int NOT NULL,
        cod_postal int NOT NULL,
		CONSTRAINT pk_adresa_id PRIMARY KEY (adresa_id)
);

Create table client(
		client_id int,
        adresa_id int NOT NULL,
		nume_client varchar (255) NOT NULL,
		prenume_client varchar (255) NOT NULL,
		CONSTRAINT pk_client_id PRIMARY KEY (client_id),
		CONSTRAINT fk_adresa_id FOREIGN KEY (adresa_id) REFERENCES adresa (adresa_id)  ON DELETE CASCADE
);

Create table categorie_instrument(
		categorie_instrument int,
		nume_categorie varchar (255) NOT NULL,
		CONSTRAINT nume_categorie_u UNIQUE (nume_categorie),
		CONSTRAINT pk_categorie_instrument PRIMARY KEY (categorie_instrument)  
);

Create table accesoriu(
		accesoriu_id int,
		nume_accesoriu varchar (255) NOT NULL,
		culoare_accesoriu varchar (255) NOT NULL,
		material_accesoriu varchar (255) NOT NULL,
		CONSTRAINT pk_accesoriu_id PRIMARY KEY (accesoriu_id)  
);

Create table instrument(
		instrument_id int,
		categorie_instrument int NOT NULL,
		nume_instrument varchar (255) NOT NULL,
		culoare_instrument varchar (255) NOT NULL,
		material_instrument varchar (255) NOT NULL,
		dimensiune_instrument varchar (255) NOT NULL,
		nume_firma varchar (255) NOT NULL,
		CONSTRAINT pk_instrument_id PRIMARY KEY (instrument_id),
		CONSTRAINT fk_categorie_instrument FOREIGN KEY (categorie_instrument) REFERENCES categorie_instrument (categorie_instrument)  ON DELETE CASCADE
);

Create table produs(
		produs_id int,
		accesoriu_id int NOT NULL,
		instrument_id int NOT NULL,
		cantitate_accesoriu int NOT NULL,
		CONSTRAINT pk_produs_id PRIMARY KEY (produs_id),
		CONSTRAINT fk_instrument_id FOREIGN KEY (produs_id) REFERENCES instrument (instrument_id)  ON DELETE CASCADE,
		CONSTRAINT fk_accesoriu_id FOREIGN KEY (produs_id) REFERENCES accesoriu (accesoriu_id)  ON DELETE CASCADE
);

Create table comanda(
		comanda_id int,
		client_id int NOT NULL,
		curier_id  int NOT NULL,
		angajat_id int NOT NULL,
		data_comanda date NOT NULL,
        CONSTRAINT pk_comanda_id PRIMARY KEY (comanda_id),
	    CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES client (client_id) ON DELETE CASCADE,
	    CONSTRAINT fk_curier_id FOREIGN KEY (curier_id) REFERENCES curier (curier_id)  ON DELETE CASCADE,
        CONSTRAINT fk_angajat_id FOREIGN KEY (angajat_id) REFERENCES angajat (angajat_id)  ON DELETE CASCADE
);

Create table factura(
	   factura_id int,
	   comanda_id int NOT NULL,
	   instrument_id int NOT NULL,
	   cantitate_instrument int NOT NULL,
	   CONSTRAINT pk_factura_id PRIMARY KEY (factura_id),
	   CONSTRAINT fk_comanda_id FOREIGN KEY (comanda_id) REFERENCES comanda (comanda_id)  ON DELETE CASCADE,
	   CONSTRAINT fk_factura_instrument_id FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id)  ON DELETE CASCADE
      );



INSERT INTO curier
VALUES (1, 'Petcu', 'Ioana', 'emag'),
		(2, 'Popescu', 'Lorena', 'emag'),
		(3, 'Vlad', 'Marcel', 'sameday'),
        (4, 'Eremia', 'Vlad', 'fancurier'),
		(5, 'Lascu', 'Andrei', 'sameday');

INSERT INTO angajat
VALUES (1, 'Popescu', 'Mirabela', 1000.00, '2020-04-23'),
		(2, 'Popa', 'Andrei', 900.00, '2017-03-21'),
		(3, 'Fatu', 'Dragos', 1500.00, '2017-04-21'),
		(4, 'Lorenzo', 'Fabian', 1300.00, '2018-10-02'),
		(5, 'Ghergu', 'Andrei', 1000.00, '2020-01-07');

INSERT INTO adresa
VALUES (1, 'Braila', 'Braila', null, 'Rimnicu Sarat', 23, 876590),
		(2, 'Ilfov', 'Bucuresti', 6, 'George Ranetti', 8, 776690),
		(3, 'Brasov', 'Brasov', null, 'Primaverii', 25, 569004),
		(4, 'Cluj', 'Cluj', null, 'Raza de soare', 2, 388990),
		(5, 'Ilfov', 'Bucuresti', 2, 'Vrajelii', 6, 406590);

INSERT INTO client
VALUES (1, 2, 'Zara', 'Andrei'),
		(2, 5, 'Lascu', 'Jenica'),
		(3, 1, 'Burtea', 'Sorin'),
		(4, 3, 'Marina', 'Andreea'),
		(5, 4, 'Flavian', 'Raluca');

INSERT INTO categorie_instrument
VALUES (1, 'Instrumente suflat'),
		(2, 'Instrumente percutie'),
		(3, 'Instrumente clape'),
		(4, 'Instrumente corzi'),
		(5, 'Instrumente electronice'),
		(6, 'Instrumente extra-muzicale');

INSERT INTO accesoriu
VALUES (1, 'capodastru', 'negru', 'plastic-metal'),
		(2, 'capodastru', 'maro', 'plastic-metal'),
		(3, 'pana chitara', 'mov', 'plastic'),
		(4, 'set corzi chitara acustica', 'argintiu-auriu', 'alama'),
		(5, 'set corzi chitara clasica', 'argintiu-auriu', 'nailon'),
		(6, 'set corzi chitara electrica', 'argintiu-auriu', 'nichel'),
        (7, 'stativ partitura', 'negru', 'otel'),
        (8, 'husa transport chitara acustica/clasica', 'negru', 'textil'),
        (9, 'stativ clarinet', 'negru', 'fier'),
		(10, 'microfon tobe', 'negru', 'nespecificat'),
		(11, 'suport claviatura', 'negru', 'fier');
        
INSERT INTO instrument
VALUES (1, 4, 'chitara acustica', 'maro-bej', 'top- molid, spate/laterale- mahon indonezian, gat- mahon', '650 mm scale' ,'Prodipe'),
		(2, 4, 'chitara acustica', 'natural(mat)', 'top- molid, spate/laterale/griff- mahon', '643mm scale' ,'Dreadnought'),
		(3, 4, 'chitara clasica', 'tobacco brown sunburst', 'top- molid, corp- meranti', '8,5x23x70 mm' ,'Yamaha'),
		(4, 4, 'chitara clasica', 'negru', 'top- molid, corp- meranti', '8,5x23x70 mm' ,'Yamaha'),
		(5, 5, 'chitara electrica', 'negru lucios', 'corp din basswood, gat- artar, tastiera- armaranth', '648 mm scale' ,'Harley Benton'),
        (6, 3, 'pian portabil', 'negru-alb', 'plastic', '914x237x75 mm' ,'Casio'),
        (7, 2, 'set tobe acustice', 'rosu', 'nespecificat', 'toba mare: 22” x 16”, tom-tom: 10” x 07” , 12” x 08”, cazan de 16” x 14”, premier de 14” x 5”' ,'Mapex'),
        (8, 1, 'clarinet si bemol', 'negru', 'lemn Grenadier', 'nespecificat', 'Buffet Crampon'),
		(9, 1, 'saxofon alto', 'auriu', 'metal', 'nespecificat', 'Yamaha'),
		(10, 3, 'pian acustic cu coada', 'negru lucios', 'placa- molid', '153x150x102 cm', 'Kawai'),
		(11, 3, 'pianina', 'alb', 'placa rezonanta- molid', '1190x598x1500 mm', 'Pearl River'),
		(12, 4, 'vioara', 'maro', 'top- molid, spate- artar, cuie/tastiera- abanos', 'nespecificat', 'Stentor'),
		(13, 4, 'viola', 'maro inchis', 'abanos', '16,5 inch', 'Aileen'),
		(14, 4, 'contrabas', 'negru', 'top- molid, spate- lemn artar, grif- abanos', 'nespecificat', 'Flame'),
		(15, 2, 'set tobe electronice', 'negru', 'nespecificat', '75x50x100 cm', 'Millenium');
        
INSERT INTO produs
VALUES (1, 1, 1 ,1),
		(2, 2, 2, 1),
		(3, 9, 8, 1),
		(4, 10, 7, 1),
		(5, 11, 6, 1),
		(6, 6, 5, 2),
        (7, 4, 1, 1);

INSERT INTO comanda
VALUES (1, 1, 1 ,1, '2021-05-20'),
		(2, 4, 4, 1, '2021-10-24'),
		(3, 3, 5, 2, '2021-06-05'),
		(4, 5, 2, 2, '2018-04-10'),
		(5, 2, 3, 1, '2021-05-20');

INSERT INTO factura
VALUES (1, 1, 3 ,1),
		(2, 2, 2, 1),
		(3, 3, 7, 1),
		(4, 4, 5, 2),
		(5, 5, 8, 1);

