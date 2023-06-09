CREATE DATABASE recordcompany; 
USE recordcompany;
CREATE table bands(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255)NOT NULL,
Primary key (id)
);
CREATE table album(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255)NOT NULL,
release_year INT,
band_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (band_id) REFERENCES bands(id)
);

INSERT INTO bands (name)
VALUES('Vulfpeck');

INSERT INTO bands (name)
VALUES('Earth, wind and fire'),('Jackson 5'),('America');

SELECT * FROM bands;
SELECT * FROM album;
SELECT * FROM bands LIMIT 2;
SELECT name FROM bands;

SELECT id AS 'ID', name AS 'Band Name'
FROM bands;

SELECT * FROM bands ORDER BY name DESC;
SELECT * FROM bands ORDER BY name ASC;

SELECT * FROM album;

INSERT INTO album (name, release_year, band_id)
VALUES ('Beautiful game', 2015, 1),
('Beautiful game', 1985, 2),
('EWF',1987,2),
('I want you back', 1975,3),
('A horse with no name',NULL,3),
('TEST album',NULL,3);

SELECT DISTINCT name FROM album;

UPDATE album
SET release_year = 1982
WHERE id = 1;

SELECT * FROM album
WHERE release_year < 1980;

SELECT * FROM album
WHERE name LIKE '%ant%' OR band_id = 2;

SELECT * FROM album
WHERE release_year < 1985 AND band_id = 1;

SELECT * FROM album
WHERE release_year BETWEEN 1980 AND 1995;

SELECT * FROM album
WHERE release_year IS NULL;

DELETE FROM album WHERE id = 10;

SELECT * FROM album;



SELECT *  FROM bands
JOIN album ON bands.id = album.band_id;

SELECT * FROM bands
INNER JOIN album ON bands.id = album.band_id;

SELECT * FROM bands
LEFT JOIN album ON bands.id = album.band_id;

SELECT * FROM bands
RIGHT JOIN album ON bands.id = album.band_id;


SELECT AVG(release_year) FROM album;
SELECT SUM(release_year) FROM album;
SELECT band_id, COUNT(band_id) FROM album
GROUP BY band_id;


SELECT b.name AS band_name, COUNT(a.id) AS num_album
FROM bands AS b
LEFT JOIN album AS a ON b.id = a.band_id
GROUP BY b.id;

SELECT b.name AS band_name, COUNT(a.id) AS num_album
FROM bands AS b
LEFT JOIN album AS a ON b.id = a.band_id
WHERE b.name = 'VUlfpeck'
GROUP BY b.id
HAVING num_album=2;