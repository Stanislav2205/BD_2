-- Создание таблицы исполнителей
CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Создание таблицы жанров
CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

-- Создание таблицы связи между исполнителями и жанрами
CREATE TABLE artist_genre (
    artist_id INTEGER REFERENCES artists(id) ON DELETE CASCADE,
    genre_id INTEGER REFERENCES genres(id) ON DELETE CASCADE,
    CONSTRAINT artist_genre_pk PRIMARY KEY (artist_id, genre_id)
);

-- Создание таблицы альбомов
CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INTEGER NOT NULL CHECK (release_year > 0)
);

-- Создание таблицы связи между исполнителями и альбомами
CREATE TABLE album_artist (
    album_id INTEGER REFERENCES albums(id) ON DELETE CASCADE,
    artist_id INTEGER REFERENCES artists(id) ON DELETE CASCADE,
    CONSTRAINT album_artist_pk PRIMARY KEY (album_id, artist_id)
);

-- Создание таблицы треков
CREATE TABLE tracks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration INTEGER NOT NULL CHECK (duration > 0),
    album_id INTEGER REFERENCES albums(id) ON DELETE CASCADE
);

-- Создание таблицы сборников
CREATE TABLE collections (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INTEGER NOT NULL CHECK (release_year > 0)
);

-- Создание таблицы связи между сборниками и треками
CREATE TABLE collection_track (
    collection_id INTEGER REFERENCES collections(id) ON DELETE CASCADE,
    track_id INTEGER REFERENCES tracks(id) ON DELETE CASCADE,
    CONSTRAINT collection_track_pk PRIMARY KEY (collection_id, track_id)
);
