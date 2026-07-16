# BookMyShow - Edge Cases Analysis

While the primary database architecture and queries (P1 and P2) are straightforward, taking a production-ready system into account reveals several edge cases that must be handled either at the database level or the application layer.

## 1. Schema & Data Integrity Edge Cases

### A. Overlapping Showtimes
- **Scenario:** A new show is inserted for `Screen 1` at `09:00:00`, but there is already a 3-hour movie playing from `08:30:00`.
- **Handling:** Our current schema does not strictly prevent this via constraints. In a real-world scenario, the application backend must validate `show_time` + `duration_minutes` of the existing movie before allowing an `INSERT` into `Movie_Show`.

### B. Cascading Deletions
- **Scenario:** A theatre closes down, and its record is removed from the `Theatre` table.
- **Handling:** Thanks to the `ON DELETE CASCADE` constraint on the `Screen` and `Movie_Show` tables, deleting a Theatre will automatically clean up all related screens and scheduled shows, preventing orphaned rows and referential integrity errors.

### C. Shows Spanning Across Midnight
- **Scenario:** A movie starts at `23:30:00` and has a duration of 150 minutes, ending at `02:00:00` the next day.
- **Handling:** The current `show_date` and `show_time` capture the start of the show accurately. However, querying for "movies running on Date X" might need application logic to account for shows that started on Date X-1 but are still playing.

## 2. Query (P2) Edge Cases

### A. No Shows Scheduled
- **Scenario:** The user queries for shows at a specific theatre on a date where no movies are scheduled (e.g., theatre maintenance day).
- **Handling:** The `INNER JOIN` in our P2 query gracefully handles this by returning an empty result set (0 rows). It will not throw an error.

### B. Same Movie on Multiple Screens Simultaneously
- **Scenario:** A blockbuster movie (like *Interstellar*) is playing at `09:00:00` on both `Audi 1` and `Audi 2` in the same theatre.
- **Handling:** The P2 query will correctly return two distinct rows for this scenario, differentiated by the `screen_name` column.

### C. Querying Non-Existent Entities
- **Scenario:** The P2 query is executed with a typo in the theatre name (e.g., `t.name = 'PVR Cinemass'`).
- **Handling:** The query will return 0 rows. To improve user experience, the application layer should validate if the theatre exists before running the show schedule query.

### D. Time Zone Discrepancies
- **Scenario:** The database server is in UTC, but the user is querying for a date in IST (Indian Standard Time).
- **Handling:** The current query relies on the literal string date (`'2026-10-15'`). In a production system, all dates and times should ideally be stored in UTC or a unified timezone, and the application must translate the user's local query date to the server's timezone before hitting the database.
