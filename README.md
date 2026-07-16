# BookMyShow - Database Architecture & SQL Solution
_Powered by Groq LLM_

This repository contains the complete database schema and query solutions for the BookMyShow problem statement. 

## 1. Entity-Relationship Architecture
The schema is normalized up to **BCNF** and consists of the following core entities:
* **`Theatre`**: Stores theatre details (`theatre_id`, `name`, `location`).
* **`Movie`**: Stores movie information (`movie_id`, `title`, `language`, `duration_minutes`).
* **`Screen`**: Represents physical screens inside a theatre (`screen_id`, `theatre_id`, `name`, `total_seats`).
* **`Movie_Show`**: Represents a specific screening (`show_id`, `screen_id`, `movie_id`, `show_date`, `show_time`).

## 2. SQL Solutions
* **P1 Solution**: The DDL (Table Creation) and DML (Data Seeding) scripts are located in `sql/init.sql`.
* **P2 Solution**: The `SELECT` query to fetch all shows on a given date at a given theatre is located in `sql/query_p2.sql`.

## 3. Project Documentation
- [Problem Statement](doc/problemStatement.md)
- [Architecture & Normalization](doc/architecture_solution.md)
- [Edge Cases Analysis](doc/edgecase.md)
- [Implementation Plan](doc/implementationPlan.md)
