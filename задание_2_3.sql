-- Название и продолжительность самого длительного трека
SELECT title, duration
FROM tracks
ORDER BY duration DESC
LIMIT 1;

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT title
FROM tracks
WHERE duration >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT title
FROM collections
WHERE release_year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT name
FROM artists
WHERE name NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my»
SELECT title
FROM tracks
WHERE LOWER(title) LIKE '%мой%' OR LOWER(title) LIKE '%my%';

-- Количество исполнителей в каждом жанре
SELECT g.name AS genre, COUNT(ag.artist_id) AS artist_count
FROM genres g
LEFT JOIN artist_genre ag ON g.id = ag.genre_id
GROUP BY g.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.id) AS track_count
FROM tracks t
JOIN albums a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

--Средняя продолжительность треков по каждому альбому
SELECT a.title AS album_title, AVG(t.duration) AS avg_duration
FROM tracks t
JOIN albums a ON t.album_id = a.id
GROUP BY a.title;

--Все исполнители, которые не выпустили альбомы в 2020 году
SELECT DISTINCT ar.name AS artist_name
FROM artists ar
LEFT JOIN album_artist aa ON ar.id = aa.artist_id
LEFT JOIN albums a ON aa.album_id = a.id
WHERE ar.id NOT IN (
    SELECT DISTINCT aa.artist_id
    FROM album_artist aa
    JOIN albums a ON aa.album_id = a.id
    WHERE a.release_year = 2020
);

--Названия сборников, в которых присутствует конкретный исполнитель
SELECT DISTINCT c.title AS collection_title
FROM collections c
JOIN collection_track ct ON c.id = ct.collection_id
JOIN tracks t ON ct.track_id = t.id
JOIN albums a ON t.album_id = a.id
JOIN album_artist aa ON a.id = aa.album_id
WHERE aa.artist_id = 1;