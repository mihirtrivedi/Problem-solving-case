-- ==========================================
-- Phase 3: Query Execution & Validation
-- BookMyShow Problem Solving Case
-- ==========================================

USE bookmyshow_db;

-- ---------------------------------------------------------
-- Step 3.1 & 3.2: Execute the P2 Query and Verify Output
-- ---------------------------------------------------------
-- Description: Fetch all shows for a given theatre and date.
-- Target: 'PVR Cinemas' on '2026-10-15'
-- Expected Output: 3 distinct shows ordered by time.

SELECT 
    m.title AS movie_title,
    m.language,
    s.show_time,
    sc.name AS screen_name
FROM 
    Theatre t
JOIN 
    Screen sc ON t.theatre_id = sc.theatre_id
JOIN 
    Movie_Show s ON sc.screen_id = s.screen_id
JOIN 
    Movie m ON s.movie_id = m.movie_id
WHERE 
    t.name = 'PVR Cinemas' 
    AND s.show_date = '2026-10-15'
ORDER BY 
    s.show_time ASC;


-- ---------------------------------------------------------
-- Step 3.3: Edge Case Testing
-- ---------------------------------------------------------
-- Description: Test the query with a date or theatre that has no scheduled shows.
-- Target: 'PVR Cinemas' on '2027-01-01'
-- Expected Output: Empty set (0 rows). The INNER JOIN gracefully filters out records.

SELECT 
    m.title AS movie_title,
    m.language,
    s.show_time,
    sc.name AS screen_name
FROM 
    Theatre t
JOIN 
    Screen sc ON t.theatre_id = sc.theatre_id
JOIN 
    Movie_Show s ON sc.screen_id = s.screen_id
JOIN 
    Movie m ON s.movie_id = m.movie_id
WHERE 
    t.name = 'PVR Cinemas' 
    AND s.show_date = '2027-01-01'
ORDER BY 
    s.show_time ASC;
