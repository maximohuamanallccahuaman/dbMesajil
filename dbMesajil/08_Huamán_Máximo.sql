
-- Crear base de datos dbMesajil
CREATE DATABASE dbMesajil;
GO

-- Ponemos en uso la base de datos dbMesajil
USE dbMesajil;
GO

-- Crear la tabla UBIGEO
CREATE TABLE UBIGEO (
	IDUBI char(6) NOT NULL,
	DEPUBI varchar(80) NOT NULL,
	PROUBI varchar(80) NOT NULL,
	DISUBI varchar(80) NOT NULL,
	CONSTRAINT Pk_UBIGEO PRIMARY KEY (IDUBI)
)
GO

-- Crear tabla CLIENTE
CREATE TABLE CLIENTE (
	IDCLI int NOT NULL IDENTITY (1,1),
	NOMCLI varchar(80) NOT NULL,
	APECLI varchar(80) NOT NULL,
	DNICLI char(8) NOT NULL,
	SEXCLI char(1) NOT NULL,
	FECNACCLI date NOT NULL,
	TELCLI char(9),
	DIRCLI varchar(100),
	IDUBI char(6) NOT NULL,
	ESTCLI char(1) NOT NULL,
	CONSTRAINT Pk_CLIENTE PRIMARY KEY (IDCLI)   
)
GO

-- Crear tabla PERSONAL
CREATE TABLE PERSONAL (
	IDPER int NOT NULL IDENTITY (1,1),
	NOMPER varchar(80) NOT NULL,
	APEPER varchar(80) NOT NULL,
	DNIPER char(8) NOT NULL,
	SEXPER char(1) NOT NULL,
	TELPER char(9),
	NIVACPER char(1) NOT NULL,	/* 1:ADMINISTRADOR / 2:JEFE DE SUCURSAL / 3:VENDEDOR */
	TIPPER char(1) NOT NULL,	/* A (ADMINISTRADOR) / J (JEFE DE SUCURSAL) / V (VENDEDOR) */
	SUCPER varchar(50) NOT NULL,
	DIRPER varchar(100) NOT NULL,
	IDUBI char(6) NOT NULL,
	ESTPER char(1) NOT NULL,
	CONSTRAINT Pk_PERSONAL PRIMARY KEY (IDPER)   
)
GO

-- Crear tabla CATEGORIA
CREATE TABLE CATEGORIA (
	IDCAT int NOT NULL IDENTITY (1,1),
	NOMCAT varchar(50) NOT NULL,
	ESTCAT char(1) NOT NULL,
	CONSTRAINT Pk_CATEGORIA PRIMARY KEY (IDCAT)   
)
GO

-- Crear tabla SUBCATEGORIA
CREATE TABLE SUBCATEGORIA (
	IDSUBCAT int NOT NULL IDENTITY (1,1),
	NOMSUBCAT varchar(50) NOT NULL,
	IDCAT int NOT NULL,
	ESTSUBCAT char(1) NOT NULL,
	CONSTRAINT Pk_SUBCATEGORIA PRIMARY KEY (IDSUBCAT)   
)
GO

-- Crear tabla PRODUCTO
CREATE TABLE PRODUCTO (
	IDPROD int NOT NULL IDENTITY (1,1),
	PRESPROD varchar(100) NOT NULL,
	DESPROD varchar(100) NOT NULL,
	MARPROD varchar(50),
	IDSUBCAT int NOT NULL,
	MODPROD varchar(50),
	STOCPROD int NOT NULL,
	PREPROD decimal(5,2) NOT NULL,
	COLPROD varchar(30),
	TIPPROD varchar(50),
	CARACPROD varchar(100),
	COMPAPROD varchar(50),
	ESTPROD char(1) NOT NULL,
	CONSTRAINT Pk_PRODUCTO PRIMARY KEY (IDPROD)   
)
GO

-- Crear tabla VENTA
CREATE TABLE VENTA (
	IDVEN int NOT NULL IDENTITY (1,1),
	FECEMI date NOT NULL,
	IDPER int NOT NULL,
	IDCLI int NOT NULL,
	IMPTOTVEN decimal(5,2) NOT NULL,
	CONSTRAINT Pk_VENTA PRIMARY KEY (IDVEN)   
)
GO

-- Crear tabla VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
	IDVENDET int NOT NULL IDENTITY (1,1),
	IDPROD int NOT NULL,
	IDVEN int NOT NULL,
	CANTPROD int NOT NULL,
	CONSTRAINT Pk_VENTA_DETALLE PRIMARY KEY (IDVEN)   
)
GO

-- Relacionando la tabla PERSONAL con la tabla UBIGEO
ALTER TABLE PERSONAL
ADD CONSTRAINT FK_PERSONAL_UBIGEO
FOREIGN KEY (IDUBI) REFERENCES UBIGEO (IDUBI);

-- Relacionando la tabla CLIENTE con la tabla UBIGEO
ALTER TABLE CLIENTE
ADD CONSTRAINT FK_CLIENTE_UBIGEO
FOREIGN KEY (IDUBI) REFERENCES UBIGEO (IDUBI);

-- Relacionando la tabla SUBCATEGORIA con la tabla CATEGORIA
ALTER TABLE SUBCATEGORIA
ADD CONSTRAINT FK_SUBCATEGORIA_CATEGORIA
FOREIGN KEY (IDCAT) REFERENCES CATEGORIA (IDCAT);

-- Relacionando la tabla PRODUCTO con la tabla SUBCATEGORIA
ALTER TABLE PRODUCTO
ADD CONSTRAINT FK_PRODUCTO_SUBCATEGORIA
FOREIGN KEY (IDSUBCAT) REFERENCES SUBCATEGORIA (IDSUBCAT);

-- Relacionando la tabla VENTA con la tabla PERSONAL
ALTER TABLE VENTA
ADD CONSTRAINT FK_VENTA_PERSONAL
FOREIGN KEY (IDPER) REFERENCES PERSONAL (IDPER);

-- Relacionando la tabla VENTA con la tabla CLIENTE
ALTER TABLE VENTA
ADD CONSTRAINT FK_VENTA_CLIENTE
FOREIGN KEY (IDCLI) REFERENCES CLIENTE (IDCLI);

-- Relacionando la tabla VENTA_DETALLE con la tabla VENTA
ALTER TABLE VENTA_DETALLE
ADD CONSTRAINT FK_VENTA_DETALLE_VENTA
FOREIGN KEY (IDVEN) REFERENCES VENTA (IDVEN);

-- Relacionando la tabla VENTA_DETALLE con la tabla PRODUCTO
ALTER TABLE VENTA_DETALLE
ADD CONSTRAINT FK_VENTA_DETALLE_PRODUCTO
FOREIGN KEY (IDPROD) REFERENCES PRODUCTO (IDPROD);

-- Insetar registros en la tabla UBIGEO
INSERT INTO UBIGEO
	(IDUBI, DEPUBI, PROUBI, DISUBI)
VALUES
	('150101','LIMA','LIMA','LIMA'),
	('150102','LIMA','LIMA','ANCON'),
	('150103','LIMA','LIMA','ATE'),
	('150104','LIMA','LIMA','BARRANCO'),
	('150105','LIMA','LIMA','BREÑA'),
	('150106','LIMA','LIMA','CARABAYLLO'),
	('150107','LIMA','LIMA','CHACLACAYO'),
	('150108','LIMA','LIMA','CHORRILLOS'),
	('150109','LIMA','LIMA','CIENEGUILLA'),
	('150110','LIMA','LIMA','COMAS'),
	('150111','LIMA','LIMA','EL AGUSTINO'),
	('150112','LIMA','LIMA','INDEPENDENCIA'),
	('150113','LIMA','LIMA','JESUS MARIA'),
	('150114','LIMA','LIMA','LA MOLINA'),
	('150115','LIMA','LIMA','LA VICTORIA'),
	('150116','LIMA','LIMA','LINCE'),
	('150117','LIMA','LIMA','LOS OLIVOS'),
	('150118','LIMA','LIMA','LURIGANCHO'),
	('150119','LIMA','LIMA','LURIN'),
	('150120','LIMA','LIMA','MAGDALENA DEL MAR'),
	('150121','LIMA','LIMA','MAGDALENA VIEJA'),
	('150122','LIMA','LIMA','MIRAFLORES'),
	('150123','LIMA','LIMA','PACHACAMAC'),
	('150124','LIMA','LIMA','PUCUSANA'),
	('150125','LIMA','LIMA','PUENTE PIEDRA'),
	('150126','LIMA','LIMA','PUNTA HERMOSA'),
	('150127','LIMA','LIMA','PUNTA NEGRA'),
	('150128','LIMA','LIMA','RIMAC'),
	('150129','LIMA','LIMA','SAN BARTOLO'),
	('150130','LIMA','LIMA','SAN BORJA'),
	('150131','LIMA','LIMA','SAN ISIDRO'),
	('150132','LIMA','LIMA','SAN JUAN DE LURIGANCHO'),
	('150133','LIMA','LIMA','SAN JUAN DE MIRAFLORES'),
	('150134','LIMA','LIMA','SAN LUIS'),
	('150135','LIMA','LIMA','SAN MARTIN DE PORRES'),
	('150136','LIMA','LIMA','SAN MIGUEL'),
	('150137','LIMA','LIMA','SANTA ANITA'),
	('150138','LIMA','LIMA','SANTA MARIA DEL MAR'),
	('150139','LIMA','LIMA','SANTA ROSA'),
	('150140','LIMA','LIMA','SANTIAGO DE SURCO'),
	('150141','LIMA','LIMA','SURQUILLO'),
	('150142','LIMA','LIMA','VILLA EL SALVADOR'),
	('150143','LIMA','LIMA','VILLA MARIA DEL TRIUNFO'),
	('150201','LIMA','BARRANCA','BARRANCA'),
	('150202','LIMA','BARRANCA','PARAMONGA'),
	('150203','LIMA','BARRANCA','PATIVILCA'),
	('150204','LIMA','BARRANCA','SUPE'),
	('150205','LIMA','BARRANCA','SUPE PUERTO'),
	('150301','LIMA','CAJATAMBO','CAJATAMBO'),
	('150302','LIMA','CAJATAMBO','COPA'),
	('150303','LIMA','CAJATAMBO','GORGOR'),
	('150304','LIMA','CAJATAMBO','HUANCAPON'),
	('150305','LIMA','CAJATAMBO','MANAS'),
	('150401','LIMA','CANTA','CANTA'),
	('150402','LIMA','CANTA','ARAHUAY'),
	('150403','LIMA','CANTA','HUAMANTANGA'),
	('150404','LIMA','CANTA','HUAROS'),
	('150405','LIMA','CANTA','LACHAQUI'),
	('150406','LIMA','CANTA','SAN BUENAVENTURA'),
	('150407','LIMA','CANTA','SANTA ROSA DE QUIVES'),
	('150501','LIMA','CAÑETE','SAN VICENTE DE CAÑETE'),
	('150502','LIMA','CAÑETE','ASIA'),
	('150503','LIMA','CAÑETE','CALANGO'),
	('150504','LIMA','CAÑETE','CERRO AZUL'),
	('150505','LIMA','CAÑETE','CHILCA'),
	('150506','LIMA','CAÑETE','COAYLLO'),
	('150507','LIMA','CAÑETE','IMPERIAL'),
	('150508','LIMA','CAÑETE','LUNAHUANA'),
	('150509','LIMA','CAÑETE','MALA'),
	('150510','LIMA','CAÑETE','NUEVO IMPERIAL'),
	('150511','LIMA','CAÑETE','PACARAN'),
	('150512','LIMA','CAÑETE','QUILMANA'),
	('150513','LIMA','CAÑETE','SAN ANTONIO'),
	('150514','LIMA','CAÑETE','SAN LUIS'),
	('150515','LIMA','CAÑETE','SANTA CRUZ DE FLORES'),
	('150516','LIMA','CAÑETE','ZUÑIGA'),
	('150601','LIMA','HUARAL','HUARAL'),
	('150602','LIMA','HUARAL','ATAVILLOS ALTO'),
	('150603','LIMA','HUARAL','ATAVILLOS BAJO'),
	('150604','LIMA','HUARAL','AUCALLAMA'),
	('150605','LIMA','HUARAL','CHANCAY'),
	('150606','LIMA','HUARAL','IHUARI'),
	('150607','LIMA','HUARAL','LAMPIAN'),
	('150608','LIMA','HUARAL','PACARAOS'),
	('150609','LIMA','HUARAL','SAN MIGUEL DE ACOS'),
	('150610','LIMA','HUARAL','SANTA CRUZ DE ANDAMARCA'),
	('150611','LIMA','HUARAL','SUMBILCA'),
	('150612','LIMA','HUARAL','VEINTISIETE DE NOVIEMBRE'),
	('150701','LIMA','HUAROCHIRI','MATUCANA'),
	('150702','LIMA','HUAROCHIRI','ANTIOQUIA'),
	('150703','LIMA','HUAROCHIRI','CALLAHUANCA'),
	('150704','LIMA','HUAROCHIRI','CARAMPOMA'),
	('150705','LIMA','HUAROCHIRI','CHICLA'),
	('150706','LIMA','HUAROCHIRI','CUENCA'),
	('150707','LIMA','HUAROCHIRI','HUACHUPAMPA'),
	('150708','LIMA','HUAROCHIRI','HUANZA'),
	('150709','LIMA','HUAROCHIRI','HUAROCHIRI'),
	('150710','LIMA','HUAROCHIRI','LAHUAYTAMBO'),
	('150711','LIMA','HUAROCHIRI','LANGA'),
	('150712','LIMA','HUAROCHIRI','LARAOS'),
	('150713','LIMA','HUAROCHIRI','MARIATANA'),
	('150714','LIMA','HUAROCHIRI','RICARDO PALMA'),
	('150715','LIMA','HUAROCHIRI','SAN ANDRES DE TUPICOCHA'),
	('150716','LIMA','HUAROCHIRI','SAN ANTONIO'),
	('150717','LIMA','HUAROCHIRI','SAN BARTOLOME'),
	('150718','LIMA','HUAROCHIRI','SAN DAMIAN'),
	('150719','LIMA','HUAROCHIRI','SAN JUAN DE IRIS'),
	('150720','LIMA','HUAROCHIRI','SAN JUAN DE TANTARANCHE'),
	('150721','LIMA','HUAROCHIRI','SAN LORENZO DE QUINTI'),
	('150722','LIMA','HUAROCHIRI','SAN MATEO'),
	('150723','LIMA','HUAROCHIRI','SAN MATEO DE OTAO'),
	('150724','LIMA','HUAROCHIRI','SAN PEDRO DE CASTA'),
	('150725','LIMA','HUAROCHIRI','SAN PEDRO DE HUANCAYRE'),
	('150726','LIMA','HUAROCHIRI','SANGALLAYA'),
	('150727','LIMA','HUAROCHIRI','SANTA CRUZ DE COCACHACRA'),
	('150728','LIMA','HUAROCHIRI','SANTA EULALIA'),
	('150729','LIMA','HUAROCHIRI','SANTIAGO DE ANCHUCAYA'),
	('150730','LIMA','HUAROCHIRI','SANTIAGO DE TUNA'),
	('150731','LIMA','HUAROCHIRI','SANTO DOMINGO DE LOS OLLEROS'),
	('150732','LIMA','HUAROCHIRI','SURCO'),
	('150801','LIMA','HUAURA','HUACHO'),
	('150802','LIMA','HUAURA','AMBAR'),
	('150803','LIMA','HUAURA','CALETA DE CARQUIN'),
	('150804','LIMA','HUAURA','CHECRAS'),
	('150805','LIMA','HUAURA','HUALMAY'),
	('150806','LIMA','HUAURA','HUAURA'),
	('150807','LIMA','HUAURA','LEONCIO PRADO'),
	('150808','LIMA','HUAURA','PACCHO'),
	('150809','LIMA','HUAURA','SANTA LEONOR'),
	('150810','LIMA','HUAURA','SANTA MARIA'),
	('150811','LIMA','HUAURA','SAYAN'),
	('150812','LIMA','HUAURA','VEGUETA'),
	('150901','LIMA','OYON','OYON'),
	('150902','LIMA','OYON','ANDAJES'),
	('150903','LIMA','OYON','CAUJUL'),
	('150904','LIMA','OYON','COCHAMARCA'),
	('150905','LIMA','OYON','NAVAN'),
	('150906','LIMA','OYON','PACHANGARA'),
	('151001','LIMA','YAUYOS','YAUYOS'),
	('151002','LIMA','YAUYOS','ALIS'),
	('151003','LIMA','YAUYOS','AYAUCA'),
	('151004','LIMA','YAUYOS','AYAVIRI'),
	('151005','LIMA','YAUYOS','AZANGARO'),
	('151006','LIMA','YAUYOS','CACRA'),
	('151007','LIMA','YAUYOS','CARANIA'),
	('151008','LIMA','YAUYOS','CATAHUASI'),
	('151009','LIMA','YAUYOS','CHOCOS'),
	('151010','LIMA','YAUYOS','COCHAS'),
	('151011','LIMA','YAUYOS','COLONIA'),
	('151012','LIMA','YAUYOS','HONGOS'),
	('151013','LIMA','YAUYOS','HUAMPARA'),
	('151014','LIMA','YAUYOS','HUANCAYA'),
	('151015','LIMA','YAUYOS','HUANGASCAR'),
	('151016','LIMA','YAUYOS','HUANTAN'),
	('151017','LIMA','YAUYOS','HUAÑEC'),
	('151018','LIMA','YAUYOS','LARAOS'),
	('151019','LIMA','YAUYOS','LINCHA'),
	('151020','LIMA','YAUYOS','MADEAN'),
	('151021','LIMA','YAUYOS','MIRAFLORES'),
	('151022','LIMA','YAUYOS','OMAS'),
	('151023','LIMA','YAUYOS','PUTINZA'),
	('151024','LIMA','YAUYOS','QUINCHES'),
	('151025','LIMA','YAUYOS','QUINOCAY'),
	('151026','LIMA','YAUYOS','SAN JOAQUIN'),
	('151027','LIMA','YAUYOS','SAN PEDRO DE PILAS'),
	('151028','LIMA','YAUYOS','TANTA'),
	('151029','LIMA','YAUYOS','TAURIPAMPA'),
	('151030','LIMA','YAUYOS','TOMAS'),
	('151031','LIMA','YAUYOS','TUPE'),
	('151032','LIMA','YAUYOS','VIÑAC'),
	('151033','LIMA','YAUYOS','VITIS');

/* Configurando el ingreso formato de fecha: día/mes/año */
SET DATEFORMAT dmy
GO

/* Insertar registros en la tabla CLIENTE */
INSERT INTO CLIENTE
	(NOMCLI, APECLI, DNICLI, SEXCLI, FECNACCLI, TELCLI, DIRCLI, IDUBI, ESTCLI)
VALUES
	('PEDRO CARLOS', 'VARGAS CAMPOS', '45367892', 'M', '02-08-2003', '998732145', 'A.V. LOS PALTOS', '151031', 'A'),
	('ANA LUCIA', 'VEGAS RODRIGUEZ', '69067892', 'F', '12-06-2000', '908321456', 'A.V. ITALIA', '151011', 'A'),
	('FRANCISCO EDUARDO', 'LLOSA GOMEZ', '40923892', 'M', '22-01-1993', '921334278', 'A.V. 21 DE JULIO', '150810', 'A'),
	('PEDRO PABLO', 'GONZALES GODINEZ', '45360012', 'M', '09-11-1989', '990811214', 'A.V. GARDEN', '150709', 'A'),
	('MARIA PAULA', 'RODRIGUEZ GONZALES', '56701292', 'M', '04-08-2001', '996543267', 'A.V. LIMA', '150719', 'A'),
	('FERNANDO DANTE', 'QUISPE AVALOS', '67677892', 'M', '12-12-2000', '999334567', 'A.V. LOS GIRASOLES', '150124', 'A'),
	('RENATO MAXIMO', 'HUAMAN QUISPE', '73934789', 'M', '23-04-1996', '900123412', 'A.V. LOS PORTALES', '150502', 'A'),
	('JESUS ARTURO', 'GAMEZ LLANOS', '55667892', 'M', '18-10-1993', '912345678', 'A.V. SUR', '150727', 'A'),
	('ROSA FLOR', 'VALENCIA MANRIQUE', '49909012', 'F', '24-06-1987', '995478321', 'A.V. CARABAYLLO', '150808', 'A'),
	('PEPE ALFREDO', 'VELASCO RAMOS', '90367892', 'M', '15-05-2000', '901267310', 'A.V. LOS ANGELES', '150705', 'A');


-- Insertar registros en la tabla PERSONAL
INSERT INTO PERSONAL
	(NOMPER, APEPER, DNIPER, SEXPER, TELPER, NIVACPER, TIPPER, SUCPER, DIRPER, IDUBI, ESTPER)
VALUES
	('JAVIER FRANCISCO', 'GONZALES PADILLA', '43567654', 'M', '908763452', '1', 'A', 'CAÑETE', 'A.V. LOS PINOS', '150301', 'A'),
	('JOSE ENRIQUE', 'GALES LLOSA', '43567009', 'M', '902312121', '1', 'A', 'LIMA', 'A.V. LAS PALMAS', '150502', 'A'),
	('BETO PAUL', 'RAMOS ORTIZ', '55434654', 'M', '987654321', '1', 'A', 'CHINCHA', 'A.V. PRADOS', '150512', 'A'),
	('ERIKA ANGIE', 'CASTILLO FLORES', '43500989', 'F', '900087698', '2', 'J', 'CAÑETE', 'A.V. PUERTO MOLDE', '150504', 'A'),
	('HELENA CARMEN', 'FLORES PADILLA', '76500989', 'F', '900086432', '2', 'J', 'LIMA', 'A.V. LOS GERANIOS', '150504', 'A'),
	('VANESA JULIA', 'GOYA PADILLA', '67567654', 'F', '987023456', '2', 'J', 'CHINCHA', 'A.V 23 DE AGOSTO', '150514', 'A'),
	('EDSON JHIANPIER', 'CARDENAS ARIAS', '86500989', 'M', '904586432', '3', 'V', 'LIMA', 'A.V. PRADOS VERDES', '150802', 'A'),
	('JUAN CARLOS', 'RAMOS CAMPOS', '76500234', 'M', '945326432', '3', 'V', 'CAÑETE', 'A.V. SIEMPRE VIVA', '151009', 'A'),
	('MARTHA SOFIA', 'GONZALES GOMEZ', '77712989', 'F', '989334562', '3', 'V', 'CHINCHA', 'A.V. HERMANOS', '150504', 'A'),
	('HELENA CARMEN', 'FLORES PADILLA', '76500989', 'F', '900086432', '3', 'V', 'LIMA', 'A.V. LOS LAURELES', '150504', 'A');

-- Insertar registros en la tabla CATEGORIA
INSERT INTO CATEGORIA
	(NOMCAT, ESTCAT)
VALUES
	('ADAPTADORES Y CABLES', 'A'),
	('COMPONENTES PARA PC', 'A'),
	('COMPUTADORAS', 'A'),
	('IMPRESORAS Y SUMINISTROS', 'A');

-- Insertar registros en la tabla SUBCATEGORIA
INSERT INTO SUBCATEGORIA
	(NOMSUBCAT, IDCAT, ESTSUBCAT)
VALUES
	('ADAPTADOR BLUETOOTH', '1', 'A'),
	('CABLES DE PODER', '1', 'A'),
	('CABLES DE EXTENSION', '1', 'A'),
	('DISCO DURO INTERNO', '2', 'A'),
	('CASE', '2', 'A'),
	('FUENTES DE PODER', '2', 'A'),
	('TODO EN UNO', '3', 'A'),
	('ESCRITORIO', '3', 'A'),
	('COMPUTADORA PORTATIL', '3', 'A'),
	('IMPRESORA LASER', '4', 'A'),
	('IMPRESORA MATRICIALES', '4', 'A'),
	('IMPRESORA TINTA', '4', 'A');

-- Insertar registros en la tabla PRODUCTO
INSERT INTO PRODUCTO
	(PRESPROD, DESPROD, MARPROD, IDSUBCAT, MODPROD, STOCPROD, PREPROD, COLPROD, TIPPROD, CARACPROD, COMPAPROD, ESTPROD)
VALUES
	('Adaptador TRENDnet TBW-108UB', 'Ofrece simultáneamente conexiones Bluetooth y WiFi', 'Trendnet', '1', '', '39', '75.81', '', '', 'Longitud: 1.9 cm Altura: 0.7 cm Ancho: 1.5 cm', 'Bluetooth', 'A'),
	('Google Chromecast 3ra Generacion', 'Enchufa a tu televisor para transmitir tu entretenimiento directamente desde tu teléfono', 'Google', '1', 'Chromecast 3ra Generacion', '80', '187.53', 'Grafito', '', 'Inalámbrica, Wi-Fi 802.11 b/g/n/ac (2.4 GHz/5 GHz)', 'Windows, Mac OS, Android', 'A'),
	('Cable Fuente Poder Tipo 8 de 1.80m', 'Cable cargador para monitores, impresoras u otros equipos.', 'AmericanNet', '2', 'Fuente Poder Tipo 8', '62', '7.98', 'Negro', 'Cable cargador', '', '', 'A'),
	('Cable Fuente Poder T/Trebol', 'Cable trifásico de uso universal.', '', '2', 'Cable Fuente Poder T/Trebol', '26', '7.98', 'Negro', 'Trébol', '', '', 'A'),
	('Cable Xtech XTC-307 de USB 2.0 A-macho a B-macho de 1.8m', 'Conexión de computadoras a ratones, teclados, discos duros y otros dispositivos compatibles.', 'XTECH', '3', 'XTC-307', '277', '7.00', 'Negro', 'USB 2.0 A-macho a B-macho', 'Velocidades de transmisión: 480Mbps Calibre del cable: 30 AWG ', '', 'A'),
	('Disco Duro de 1TB Interno', 'El disco duro interno Toshiba ofrece un alto rendimiento para profesionales', 'Toshiba', '4', 'P300', '15', '195.51', 'Plata', '', 'Impacto (funcionamiento): 70 G / 2 ms de duración', '', 'A'),
	('Disco Duro Seagate IronWolf NAS SATA 3.5″', 'Diseñado para entornos de múltiples usuarios y altos índices operativos', 'Seagate', '4', 'IronWolf', '2', '438.90', 'Negro', '', 'DIMENSIONES: 26,11 mm*101,85 mm*146,99 mm', '', 'A'),
	('Case Antryx RX Energy S + Fuente B600W', 'Para juegos de alta calidad y rendimiento', 'Antryx', '5', 'RX Energy S', '22', '335.16', 'Negro', '', 'TAMAÑO: L435 * W185 * H460mm', '', 'A'),
	('Case Antryx RX-430 + Fuente B600W, ARGB/ATX/Vidrio Templado Black', 'Selección de patrones y modos de iluminación ARGB a todo color', 'Antryx', '5', 'RX-430', '7', '367.08', 'Negro', '', 'Chasis: SPCC 0,8 mm / 0,6 mm, interior de pintura negra del chasis', '', 'A'),
	('Fuente Antec Atom 550W B550 80 Plus Bronce', '88% de eficiencia bajo condiciones de carga reales', 'ANTEC', '6', 'Atom 550W B550', '10', '211.47', 'Negro', '', 'DIMENSIONES (CM)	8.60 X 15.00 X 15.50 CM', '', 'A');
	/* ('Fuente Cooler Master Platinum', 'Mantiene una velocidad constante del ventilador hasta la carga máxima', 'Cooler Master', '6', 'V1000 Platinum', '3', '1256.85', 'Negro', '', 'DIMENSIONES 201.2 X 150 X 86 MM', '', 'A'),
	('All In One HP 200 G4 Intel Core i3-10110U 8GB/1TB/21.5″ FreeDOS', 'Equipada con una pantalla triple de microborde', 'HP', '7', '200 G4', '48', '2054.85', '', '', 'DIMENSIONES 20.45 x 49.03 x 38.07 cm', '', 'A'),
	('All In One Lenovo IdeaCentre AIO 3 Core i5-10400T 4GB/1TB/W10/23.8″', 'Permitirá disponer de más espacio y quedará genial en cualquier habitación', 'Lenovo', '7', 'AIO IdeaCentre 3', '12', '3311.70', '', '', 'DIMENSIONES 18.5 x 54.1 x 44.61 cm', '', 'A'),
	('PC Desktop HP Pavilion Gaming TG01-104bla + Monitor HP 24f 23.8″ I5/8GB/256GB/V6GB/W10h', 'Juega con un desempeño controlado', 'HP', '8', 'Pavilion Gaming TG01-104bla + 24f', '71', '4209.45', '', '', 'DIMENSIONES 15.54 x 30.70 x 33.74 cm', '', 'A'),
	('PC Desktop HP Prodesk 400 G7 SFF Core i7-10700 8GB/1TB W10Pro', 'Procesador Intel Core de 10 generación, HDD de hasta 1TB y memoria DDR4 de 8GB.', 'HP', '8', 'Prodesk 400 G7 SFF', '45', '3670.80', '', '', 'DIMENSIONES	27 x 9.5 x 30.3 cm', '', 'A'),
	('All In One Lenovo IdeaCentre AIO 3 Core i3-10100T 4GB/1TB/23.8″/W10', 'Permitirá disponer de más espacio y quedará genial en cualquier habitación', 'Lenovo', '9', 'IdeaCentre AIO 3', '35', '2793.00', '', '', 'DIMENSIONES 18.5 x 54.1 x 44.61 cm', '', 'A'),
	('Laptop ASUS GA401II-HE003T AMD R7-4800HS 16GB/SSD512GB/V4G/14″/W10h', ' Ofrece unas posibilidades de personalización completamente únicas', 'AMD, ASUS', '9', 'GA401II-HE003T', '2', '6004.95', '', '', 'DIMENSIONES 22 x 32.4 x 1.79 cm', '', 'A'),
	('Impresora HP Laser 107w Monofuncion', 'Obtenga resultados de alta calidad e imprima y escanee desde su teléfono.', 'HP', '10', '', '10', '422.94', '', 'Monofuncional', 'DIMENSIONES 331 x 215 x 178 mm', '', 'A'),
	('Impresora HP LaserJet Pro M501dn', 'Salida más veloz de primera página desde modo de suspensión.', 'HP', '10', 'LaserJet Pro M501dn', '5', '997.50', 'Blanco', '', '', 'Windows, Mac Os', 'A'),
	('Impresora Matricial Epson FX-890II de 9 pines C/Angosto (C11CF37201)', 'Ofrece durabilidad y facilidad de uso para los exigentes requisitos de la impresión diaria.', 'Epson', '11', 'FX-890II', '8', '2014.95', 'Negro', 'Impresora', 'DIMESIONES 17.2" x 14.8" x 7" (W x D x H)', '', 'A'),
	('Impresora Matricial Epson LX-350 de 9 pines C/angosto', 'Alcanza velocidades de impresión de hasta 390 cps.', 'Epson', '11', 'LX-350', '39', '977.55', 'Negro', '', 'PESO 4.1 kg', 'Windows', 'A'),
	('Impresora Multifuncional Epson EcoTank L3110 Sistema Continuo', 'Ofrece la revolucionaria impresión sin cartuchos', 'Epson', '12', 'EcoTank L3110', '58', '782.04', 'Negro', '', 'DIMENSIONES	37.5 x 57.8 x 25.3 cm', 'Windows, Mac Os', 'A'); */

-- Insetar registros en la tabla VENTA
INSERT INTO VENTA
	(FECEMI, IDPER, IDCLI, IMPTOTVEN)
VALUES
	('05-03-2001', '7', '1', '2.90'),
	('07-05-2002', '7', '2', '3.30'),
	('09-05-2012', '8', '3', '4.10'),
	('05-02-2004', '7', '4', '4.50'),
	('05-01-2014', '9', '5', '2.50'),
	('11-07-2015', '10', '6', '2.50'),
	('08-09-2015', '9', '7', '2.50'),
	('01-10-2015', '8', '8', '2.50'),
	('10-11-2016', '7', '9', '2.50'),
	('09-12-2016', '9', '10', '2.50');

-- Insetar registros en la tabla VENTA_DETALLE
INSERT INTO VENTA_DETALLE
	(IDPROD, IDVEN, CANTPROD)
VALUES
	('1', '1', '3'),
	('2', '2', '2'),
	('3', '3', '3'),
	('4', '4', '4'),
	('5', '5', '5'),
	('6', '6', '4'),
	('7', '7', '2'),
	('8', '8', '1'),
	('9', '9', '4'),
	('10', '10', '2')
GO

/* Listar los productos vendidos con su respectivo importe de venta */
CREATE VIEW vwVentaProducto
AS
SELECT 
    (UPPER(PE.APEPER) + ', ' + PE.NOMPER) AS 'Personal',
    (UPPER(C.APECLI) + ', ' + C.NOMCLI ) AS 'Cliente',
	SC.NOMSUBCAT AS 'Subcategoría',
    P.PRESPROD AS 'Producto',
    P.PREPROD AS 'PUnit',
    VD.CANTPROD AS 'Cantidad',
    (P.PREPROD * VD.CANTPROD) AS 'Importe'
FROM dbo.VENTA_DETALLE AS VD
INNER JOIN dbo.PRODUCTO AS P
ON VD.IDPROD = P.IDPROD
INNER JOIN dbo.SUBCATEGORIA AS SC
ON P.IDSUBCAT = SC.IDSUBCAT
INNER JOIN dbo.VENTA AS V
ON VD.IDVEN = V.IDVEN
INNER JOIN dbo.CLIENTE AS C
ON V.IDCLI = C.IDCLI
INNER JOIN dbo.PERSONAL AS PE
ON V.IDPER = PE.IDPER
GO

/* Listar el stock de los productos con sus respectivos categoría y subcategoría*/
CREATE VIEW vwProducto
AS
SELECT 
	C.NOMCAT AS 'Categoría',
	SC.NOMSUBCAT AS 'Subcategoría',
    P.PRESPROD AS 'Nombre del Producto',
    P.STOCPROD AS 'Stock',
    P.PREPROD AS 'P. Unit.'
FROM dbo.PRODUCTO AS P
INNER JOIN dbo.SUBCATEGORIA AS SC
ON P.IDPROD = SC.IDSUBCAT
INNER JOIN dbo.CATEGORIA AS C
ON SC.IDCAT = C.IDCAT
GO

-- TABLA CABECERA
CREATE PROCEDURE spInsertVenta
    (
        @fechadeVenta DATE,
        @codigoPersonal INT,
        @codigoCliente INT,
		@importedeVenta DECIMAL(5,2)
    )
AS
    BEGIN
    SET NOCOUNT ON
        BEGIN TRY
            BEGIN TRAN
                INSERT INTO VENTA
                    (FECEMI, IDPER, IDCLI, IMPTOTVEN)
                VALUES
                    (@fechadeVenta, @codigoPersonal, @codigoCliente, @importedeVenta) 
                IF UPPER(@fechadeVenta) = ' '
                    COMMIT TRAN
                ELSE
                    ROLLBACK TRAN;
        END TRY
        BEGIN CATCH
            SELECT 'No se ha registrado la venta' AS 'ERROR'
            IF @@TRANCOUNT > 0 ROLLBACK TRAN; 
        END CATCH
    END 
GO

/* Procedimiento almacenado para Insertar Clientes y que no haya duplicado de DNI */
CREATE PROCEDURE spInsertCliente
    (
        @nombreCli      VARCHAR(80),
        @apellidoCli    VARCHAR(80),
        @dniCli         CHAR(8),
		@sexoCli		CHAR(1),
		@nacimientoCli	DATE,
		@telefonoCli	CHAR(9),
		@direccionCli	VARCHAR(100),
		@estadoCli		CHAR(1)
    )
AS
    BEGIN
    SET NOCOUNT ON
        BEGIN TRY
        begin tran;
            IF(SELECT COUNT(*) FROM dbo.CLIENTE AS C WHERE C.DNICLI = @dniCli) = 1
                ROLLBACK TRAN;
            ELSE
                INSERT INTO dbo.CLIENTE
                    (NOMCLI, APECLI, DNICLI, SEXCLI, FECNACCLI, TELCLI, DIRCLI, ESTCLI)
                VALUES
                    (@nombreCli, @apellidoCli, @dniCli, @sexoCli, @nacimientoCli, @telefonoCli, @direccionCli, @estadoCli)
        COMMIT TRAN;
        END TRY
        BEGIN CATCH
            SELECT 'El cliente ya existe.' AS 'ERROR'
            IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        END CATCH
    END
GO