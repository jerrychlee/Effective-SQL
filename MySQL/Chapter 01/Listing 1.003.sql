-- Be sure run Item04StructureAndData.sql in the Sample Databases folder
-- before attempting to run this listing.

USE Item04Example;

CREATE TABLE Authors
  (AuthorID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  AuthFirst varchar (20),
  AuthMid  varchar (15),
  AuthLast  varchar (30),
  AuthStNum varchar (6),
  AuthStreet varchar (40),
  AuthCity  varchar (30),
  AuthStProv  varchar (2),
  AuthPostal  varchar (10),
  AuthCountry  varchar (35));
  
INSERT INTO Authors ( AuthFirst, AuthMid, AuthLast, AuthStNum, AuthStreet, AuthCity, AuthStProv, AuthPostal, AuthCountry )
VALUES ('John', 'L.', 'Viescas', '1175', '7th Street', 'Austin', 'TX', '78701', 'USA');

INSERT INTO Authors ( AuthFirst, AuthMid, AuthLast, AuthStNum, AuthStreet, AuthCity, AuthStProv, AuthPostal, AuthCountry )
VALUES ('Douglas', 'J.', 'Steele', '555', 'Sherbourne St.', 'Toronto', 'ON', 'M4X 1W6', 'Canada');

INSERT INTO Authors ( AuthFirst, AuthMid, AuthLast, AuthStNum, AuthStreet, AuthCity, AuthStProv, AuthPostal, AuthCountry )
VALUES ('Ben', Null, 'Clothier', '2015', 'Monterey St.', 'San Antonio', 'TX', '78207', 'USA');

INSERT INTO Authors ( AuthFirst, AuthMid, AuthLast, AuthStNum, AuthStreet, AuthCity, AuthStProv, AuthPostal, AuthCountry )
VALUES ('Tom', Null, 'Wickerath', '2317', '185th Place NE', 'Redmond', 'WA', '98052', 'USA');

