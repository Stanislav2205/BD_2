-- Добавление исполнителей
INSERT INTO artists (name) VALUES
('Artist One'),
('Artist Two'),
('Artist Three'),
('Artist Four');

-- Добавление жанров
INSERT INTO genres (name) VALUES
('Rock'),
('Pop'),
('Jazz');

--Связь между исполнителями и жанрами
INSERT INTO artist_genre (artist_id, genre_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(4, 2);

--Добавление альбомов
INSERT INTO albums (title, release_year) VALUES
('Album One', 2020),
('Album Two', 2021),
('Album Three', 2022);

--Связь между исполнителями и альбомами
INSERT INTO album_artist (album_id, artist_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(3, 4);

-- Добавление треков
INSERT INTO tracks (title, duration, album_id) VALUES
('Track One', 180, 1),
('Track Two', 210, 1),
('Track Three', 195, 2),
('Track Four', 240, 2),
('Track Five', 200, 3),
('Track Six', 225, 3);

-- Добавление сборников
INSERT INTO collections (title, release_year) VALUES
('Collection One', 2021),
('Collection Two', 2022),
('Collection Three', 2023),
('Collection Four', 2023);

-- Связь между сборниками и треками
INSERT INTO collection_track (collection_id, track_id) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(3, 5),
(4, 6);
