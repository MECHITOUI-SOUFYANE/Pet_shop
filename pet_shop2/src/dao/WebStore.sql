-- ------------------------------------------------------------------------------
-- - Reconstruction de la base de données                                     ---
-- ------------------------------------------------------------------------------
DROP DATABASE IF EXISTS WebStore;
CREATE DATABASE WebStore;
USE WebStore;


-- -----------------------------------------------------------------------------
-- - Construction de la table des utilisateurs                               ---
-- -----------------------------------------------------------------------------
CREATE TABLE T_Users (
	IdUser				int(4)		PRIMARY KEY AUTO_INCREMENT,
	Login				varchar(20)	NOT NULL,
	Password			varchar(20)	NOT NULL,
	ConnectionNumber	int(4)		NOT NULL DEFAULT 0
) ENGINE = InnoDB;

INSERT INTO T_Users (IdUser, Login, Password) VALUES ( 1, 'Anderson',	'Neo' );
INSERT INTO T_Users (IdUser, Login, Password) VALUES ( 2, 'Skywalker',	'Luke' );
INSERT INTO T_Users (IdUser, Login, Password) VALUES ( 3, 'Plissken',	'Snake' );
INSERT INTO T_Users (IdUser, Login, Password) VALUES ( 4, 'Ripley',		'Ellen' );
INSERT INTO T_Users (IdUser, Login, Password) VALUES ( 5, 'Bond',		'James' );

SELECT * FROM T_Users;

-- -----------------------------------------------------------------------------
-- - Construction de la table des administrateurs                            ---
-- -----------------------------------------------------------------------------

CREATE TABLE T_Admins (
	IdUser				int(4)		NOT NULL REFERENCES T_Users(IdUser),
	Rights				varchar(10) NOT NULL
) ENGINE = InnoDB;

INSERT INTO T_Admins VALUES ( 1, "-RWX------" );
INSERT INTO T_Admins VALUES ( 5, "-RWK------" );

-- -----------------------------------------------------------------------------
-- - Construction de la tables des articles en vente                         ---
-- -----------------------------------------------------------------------------
CREATE TABLE T_Articles (
	IdArticle			int(4)		PRIMARY KEY AUTO_INCREMENT,
	Description			text     	NOT NULL,
	Brand				text        NOT NULL,
	UnitaryPrice		float(8)	NOT NULL
) ENGINE = InnoDB;

INSERT INTO T_Articles ( Description, Brand, UnitaryPrice ) VALUES ( 'Souris',					'Logitoch',				65 );
INSERT INTO T_Articles ( Description, Brand, UnitaryPrice ) VALUES ( 'Clavier',					'Microhard',			49.5 );
INSERT INTO T_Articles ( Description, Brand, UnitaryPrice ) VALUES ( 'Systeme d''exploitation',	'Fenetres Vistouille',	150 );
INSERT INTO T_Articles ( Description, Brand, UnitaryPrice ) VALUES ( 'Tapis souris', 			'Evolution MM',			5 );
INSERT INTO T_Articles ( Description, Brand, UnitaryPrice ) VALUES ( 'Cle USB 8 To', 			'Syno',					8 );
INSERT INTO T_Articles ( Description, Brand, UnitaryPrice ) VALUES ( 'Laptop', 					'PH',					1199 );
INSERT INTO T_Articles ( Description, Brand, UnitaryPrice ) VALUES ( 'CD x 500', 				'CETME',				250 );
INSERT INTO T_Articles ( Description, Brand, UnitaryPrice ) VALUES ( 'DVD-R x 100', 			'CETME',				99 );
INSERT INTO T_Articles ( Description, Brand, UnitaryPrice ) VALUES ( 'DVD+R x 100', 			'CETME',				105 );
INSERT INTO T_Articles ( Description, Brand, UnitaryPrice ) VALUES ( 'Batterie Laptop', 		'PH',					80 );
INSERT INTO T_Articles ( Description, Brand, UnitaryPrice ) VALUES ( 'Casque Audio', 			'Syno',					105 );
INSERT INTO T_Articles ( Description, Brand, UnitaryPrice ) VALUES ( 'WebCam', 					'Logitoch',				755 );

SELECT * FROM T_Articles;

-- -----------------------------------------------------------------------------
-- - Construction de la tables des commandes                                 ---
-- -----------------------------------------------------------------------------
CREATE TABLE T_Commands (
	IdCommand		int(4)		PRIMARY KEY AUTO_INCREMENT,
	IdUser			int(4)		NOT NULL REFERENCES T_Users(IdUser),
    CommandDate     datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB;

CREATE TABLE T_CommandLines (
	IdCommandLine	int(4)		PRIMARY KEY AUTO_INCREMENT,
	IdCommand		int(4)		NOT NULL REFERENCES T_Commands(IdCommand),
	IdArticle		int(4)		NOT NULL REFERENCES T_Articles(IdCommand),
	Quantity		int(4) 		NOT NULL
) ENGINE = InnoDB;

-- Une première commande
INSERT INTO T_Commands (IdUser, CommandDate) VALUES ( 2, now() ); 
INSERT INTO T_CommandLines (IdCommand, IdArticle, Quantity) VALUES (1, 1, 5); 
INSERT INTO T_CommandLines (IdCommand, IdArticle, Quantity) VALUES (1, 3, 3);

-- Une seconde commande, pour un admin
INSERT INTO T_Commands (IdUser, CommandDate) VALUES ( 1, now() ); 
INSERT INTO T_CommandLines (IdCommand, IdArticle, Quantity) VALUES (2, 2, 4); 
INSERT INTO T_CommandLines (IdCommand, IdArticle, Quantity) VALUES (2, 3, 1);
INSERT INTO T_CommandLines (IdCommand, IdArticle, Quantity) VALUES (2, 4, 1);

