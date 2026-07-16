-- ==========================================
-- Phase 2: Database Setup & Data Seeding
-- BookMyShow Problem Solving Case
-- ==========================================

-- 1. Database Creation
CREATE DATABASE IF NOT EXISTS bookmyshow_db;
USE bookmyshow_db;

-- 2. Table Creation (DDL)
CREATE TABLE IF NOT EXISTS Theatre (
    theatre_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Movie (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    language VARCHAR(50) NOT NULL,
    duration_minutes INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Screen (
    screen_id INT PRIMARY KEY AUTO_INCREMENT,
    theatre_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    total_seats INT NOT NULL,
    FOREIGN KEY (theatre_id) REFERENCES Theatre(theatre_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Movie_Show (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    screen_id INT NOT NULL,
    movie_id INT NOT NULL,
    show_date DATE NOT NULL,
    show_time TIME NOT NULL,
    FOREIGN KEY (screen_id) REFERENCES Screen(screen_id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id) ON DELETE CASCADE
);

-- 3. Data Seeding (DML)
-- Clear existing data if re-running
DELETE FROM Movie_Show;
DELETE FROM Screen;
DELETE FROM Movie;
DELETE FROM Theatre;
ALTER TABLE Movie_Show AUTO_INCREMENT = 1;
ALTER TABLE Screen AUTO_INCREMENT = 1;
ALTER TABLE Movie AUTO_INCREMENT = 1;
ALTER TABLE Theatre AUTO_INCREMENT = 1;

-- Insert Theatres
INSERT INTO Theatre (name, location) VALUES 
('PVR Cinemas', 'Phoenix Mall, Mumbai'),
('INOX', 'Nariman Point, Mumbai');

-- Insert Movies
INSERT INTO Movie (title, language, duration_minutes) VALUES 
('Inception', 'English', 148),
('Interstellar', 'English', 169);

-- Insert Screens
INSERT INTO Screen (theatre_id, name, total_seats) VALUES 
(1, 'Audi 1', 150),
(1, 'Audi 2', 200),
(2, 'Screen A', 100);

-- Insert Shows
INSERT INTO Movie_Show (screen_id, movie_id, show_date, show_time) VALUES 
(1, 1, '2026-10-15', '09:00:00'),
(1, 2, '2026-10-15', '13:00:00'),
(2, 1, '2026-10-15', '10:30:00'),
(3, 2, '2026-10-16', '18:00:00');
