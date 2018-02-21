CREATE TABLE artist (
    id serial,
    name varchar(50) NOT NULL,
    email varchar(50) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE song (
    id serial,
    artist_id INT,
    title varchar(50) NOT NULL,
    year SMALLINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (artist_id) REFERENCES artist (id)
);

INSERT INTO artist VALUES (1, 'The Doors', 'jim@thedoors.com');
INSERT INTO artist VALUES (2, 'The Kinks', 'ray@thekinks.com');
ALTER SEQUENCE artist_id_seq RESTART WITH 3 INCREMENT BY 1;

INSERT INTO song VALUES (1, 1, 'Riders On The Storm', 1971);
INSERT INTO song VALUES (2, 1, 'Light My Fire', 1967);
INSERT INTO song VALUES (3, 1, 'Break On Through', 1967);
INSERT INTO song VALUES (4, 2, 'Lola', 1970);
INSERT INTO song VALUES (5, 2, 'Waterlook Sunset', 1967);
INSERT INTO song VALUES (6, 2, 'Sunny Afternoon', 1966);
ALTER SEQUENCE song_id_seq RESTART WITH 7 INCREMENT BY 1;

CREATE TABLE playlist (
    id serial,
    name varchar(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE song_playlist (
    id serial,
    song_id INT NOT NULL,
    playlist_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (song_id) REFERENCES song (id),
    FOREIGN KEY (playlist_id) REFERENCES playlist (id)
);

INSERT INTO playlist VALUES (1, 'Random favourites');
INSERT INTO playlist VALUES (2, 'Other songs');
ALTER SEQUENCE playlist_id_seq RESTART WITH 3 INCREMENT BY 1;

INSERT INTO song_playlist VALUES (1, 1, 1);
INSERT INTO song_playlist VALUES (2, 2, 1);
INSERT INTO song_playlist VALUES (3, 3, 1);
INSERT INTO song_playlist VALUES (4, 4, 1);
INSERT INTO song_playlist VALUES (5, 2, 2);
INSERT INTO song_playlist VALUES (6, 3, 2);
INSERT INTO song_playlist VALUES (7, 5, 2);
ALTER SEQUENCE song_playlist_id_seq RESTART WITH 8 INCREMENT BY 1;
