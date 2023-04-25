# All done in PostgreSQL

CREATE TABLE songs_taylor (
	ID int NOT NULL UNIQUE,
	track_number int,
	name varchar(120) ,
	album varchar(120),
	artist varchar(60) NOT NULL,
	release_date date,
	length int,
	popularity smallint,
	danceability numeric(4,3),
	acousticness numeric(7,6),
	energy numeric(4,3),
	instrumentalness numeric(9,8),
	liveness numeric(5,4),
	loudness numeric(5,3),
	speechiness numeric(5,4),
	valence numeric(5,4),
	tempo numeric(6,3),
	Primary Key(ID)
);

\copy songs_taylor FROM 'C:\Users\aidan\Desktop\TaylorSwiftDA\spotify_taylorswift_csv.csv' csv header;

CREATE TABLE albums_taylor (
	album_ID serial NOT NULL,
	album_name varchar(120),
	release_date date,
	Primary Key(album_ID)
);

INSERT INTO albums_taylor (album_name, release_date)
	SELECT distinct album, release_date
	FROM songs_taylor
	ORDER BY release_date;


# Set up songs_taylor table for normalization
UPDATE songs_taylor
SET album = 1
WHERE album = 'Taylor Swift';

UPDATE songs_taylor
SET album = 2
WHERE album = 'Fearless (Platinum Edition)';

UPDATE songs_taylor
SET album = 3
WHERE album = 'Speak Now (Deluxe Package)';

UPDATE songs_taylor
SET album = 4
WHERE album = 'Red (Deluxe Edition)';

UPDATE songs_taylor
SET album = 5
WHERE album = '1989 (Deluxe)';

UPDATE songs_taylor
SET album = 6
WHERE album = 'reputation';

UPDATE songs_taylor
SET album = 7
WHERE album = 'Lover';

UPDATE songs_taylor
SET album = 8
WHERE album = 'folklore (deluxe version)';

UPDATE songs_taylor
SET album = 9
WHERE album = 'evermore (deluxe version)';

UPDATE songs_taylor
SET album = 10
WHERE album = 'Fearless (Taylor''s Version)';

UPDATE songs_taylor
SET album = 11
WHERE album = 'Red (Taylor''s Version)';

UPDATE songs_taylor
SET album = 12
WHERE album = 'Midnights (3am Edition)';


# Alter the songs_taylor table to drop redundant data and add a foreign key
ALTER TABLE songs_taylor
	ALTER COLUMN album TYPE int (USING album::int);

ALTER TABLE songs_taylor
	ADD CONSTRAINT album_fk Foreign Key(album) REFERENCES albums_taylor(album_ID);

ALTER TABLE table_name
	ADD COLUMN artist varchar(60) NOT NULL DEFAULT('Taylor Swift');

ALTER TABLE songs_taylor
    DROP COLUMN release_date;

ALTER TABLE songs_taylor
    DROP COLUMN artist;


# Create a view to easily access the contents of both tables
CREATE VIEW songs_albums_view_taylor AS
SELECT s.id, s.track_number, s.name, a.album_name, a.artist, a.release_date, s.length, s.popularity, s.danceability, s.acousticness, s.energy, s.instrumentalness, s.liveness, s.loudness, s.speechiness, s.valence, s.tempo
	FROM songs_taylor s, albums_taylor a
	WHERE s.album = a.album_ID
	ORDER BY s.id;


# Select Statements

# Select the VIEW
SELECT * FROM songs_albums_view_taylor;

# Select AVG song length from each album
SELECT ROUND(AVG(length),0) AS max_song_length, album_name
FROM songs_albums_view_taylor
GROUP BY album_name, release_date
ORDER BY release_date;

# Select the MAX song length from each album
SELECT ROUND(MAX(length),0) AS max_song_length, album_name
FROM songs_albums_view_taylor
GROUP BY album_name, release_date
ORDER BY release_date;

# Select MIN song length from each album
SELECT ROUND(MIN(length),0) AS max_song_length, album_name
FROM songs_albums_view_taylor
GROUP BY album_name, release_date
ORDER BY release_date;;


# Select MAX popularity from each album
SELECT MAX(popularity) as max_popularity, album_name
FROM songs_albums_view_taylor
GROUP BY album_name, release_date
ORDER BY release_date;

# Select MIN popularity from each album
SELECT MIN(popularity) as max_popularity, album_name
FROM songs_albums_view_taylor
GROUP BY album_name, release_date
ORDER BY release_date;

# Songs with 0 popularity
# All from 1989
SELECT name, album_name, popularity
FROM songs_albums_view_taylor
WHERE popularity = 0;

# Song with highest popularity 
# Blank Space from 1989
SELECT name, album_name, popularity
FROM songs_albums_view_taylor
WHERE popularity = 82;

# AVG popularity of albums with outlier 0 popularities
SELECT ROUND(AVG(popularity),0) AS avg_song_popularity, album_name
FROM songs_albums_view_taylor
GROUP BY album_name, release_date
ORDER BY release_date;

# AVG popularity of albums without outlier 0 popularities
SELECT ROUND(AVG(popularity),0) AS avg_song_popularity, album_name
FROM songs_albums_view_taylor
WHERE popularity != 0
GROUP BY album_name, release_date
ORDER BY release_date;


# Select AVG acousticness and danceability
SELECT ROUND(AVG(acousticness),5) AS avg_acousticness, ROUND(AVG(danceability),5) avg_danceability, album_name
FROM songs_albums_view_taylor
GROUP BY album_name, release_date
ORDER BY release_date;

# 10 most popular songs
SELECT name, popularity, album_name
FROM songs_albums_view_taylor
ORDER BY popularity DESC
LIMIT 10;

# 10 least popular songs w/o outliers
SELECT name, popularity, album_name
FROM songs_albums_view_taylor
WHERE popularity != 0
ORDER BY popularity ASC
LIMIT 10;

# Compare the original Fearless to Taylor's Version
SELECT album_name, release_date, AVG(length) as avg_length, AVG(popularity) as avg_popularity, AVG(danceability) as avg_danceability, AVG(acousticness) as avg_acousticness, AVG(energy) as avg_energy, AVG(instrumentalness) as avg_instrumentalness, AVG(liveness) as avg_liveness, AVG(loudness) as avg_loudness, AVG(speechiness) as avg_speechiness, AVG(valence) as avg_valence, AVG(tempo) as avg_tempo
FROM songs_albums_view_taylor
WHERE album_name ILIKE 'Fearless%'
group by album_name, release_date
ORDER BY release_date;

# Select all of the songs from the two versions of Fearless and order them by
# album and popularity
SELECT album_name, name, popularity
FROM songs_albums_view_taylor
WHERE album_name ILIKE 'Fearless%' 
ORDER BY release_date, popularity DESC;

# Compare the stats of the most popular song from both versions 'Love Story'
SELECT *
FROM songs_albums_view_taylor
WHERE album_name ILIKE 'Fearless%' AND name ILIKE 'Love Story%'
ORDER BY release_date, popularity DESC;


# Compare all of the stats between Folklore and Evermore
SELECT album_name, release_date, AVG(length) as avg_length, AVG(popularity) as avg_popularity, AVG(danceability) as avg_danceability, AVG(acousticness) as avg_acousticness, AVG(energy) as avg_energy, AVG(instrumentalness) as avg_instrumentalness, AVG(liveness) as avg_liveness, AVG(loudness) as avg_loudness, AVG(speechiness) as avg_speechiness, AVG(valence) as avg_valence, AVG(tempo) as avg_tempo
FROM songs_albums_view_taylor
WHERE album_name ILIKE 'evermore%' or album_name ILIKE 'folklore%'
group by album_name, release_date
ORDER BY release_date;


# Select the Median and Average popularity for every album
SELECT PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY popularity) median_popularity, ROUND(AVG(popularity), 0) avg_popularity ,album_name
FROM songs_albums_view_taylor
WHERE popularity != 0
group by album_name, release_date
ORDER BY release_date;

# Select median popularity and danceability from each album
SELECT PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY popularity) median_popularity, PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY danceability) median_danceability,album_name
FROM songs_albums_view_taylor
WHERE popularity != 0
group by album_name, release_date
ORDER BY release_date;

