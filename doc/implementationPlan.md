# BookMyShow - Phase-Wise Implementation Plan
_Powered by Groq LLM_

Based on the [Problem Statement](problemStatement.md) and the designed [Architecture Solution](architecture_solution.md), here is a structured, phase-wise implementation plan to execute and submit the project successfully.

## Phase 1: Architecture & Database Design (Completed)
**Goal:** Define the data models and ensure they meet normal form requirements (1NF to BCNF).
- [x] Identify core entities (`Theatre`, `Movie`, `Screen`, `Movie_Show`).
- [x] Define primary keys, foreign keys, and relationships.
- [x] Verify normalization (Ensure no partial or transitive dependencies).
- [x] Document the schema and ER diagram in `architecture_solution.md`.

## Phase 2: Database Setup & Data Seeding
**Goal:** Physically implement the database schema in a MySQL environment.
- [x] **Step 2.1:** Install/Access a MySQL Database (e.g., local MySQL server or a cloud instance).
- [x] **Step 2.2:** Execute the Database Creation Script.
  - Run the `CREATE DATABASE bookmyshow_db;` and table creation commands (P1 solution).
- [x] **Step 2.3:** Seed Sample Data.
  - Execute the provided `INSERT` statements to populate `Theatre`, `Movie`, `Screen`, and `Movie_Show` tables with dummy data.

## Phase 3: Query Execution & Validation (Testing)
**Goal:** Verify that the database behaves as expected and fulfills the specific query requirements.
- [x] **Step 3.1:** Execute the P2 Query.
  - Run the specific `SELECT` query to fetch all shows for a given theatre and date.
- [x] **Step 3.2:** Verify Output.
  - Ensure the output accurately joins the four tables and returns the `movie_title`, `language`, `show_time`, and `screen_name`.
- [x] **Step 3.3:** Edge Case Testing (Optional but recommended).
  - Test the query with a date or theatre that has no shows to ensure it returns an empty set gracefully.

## Phase 4: Version Control & GitHub PR Creation
**Goal:** Package the solution and submit it according to the assignment guidelines.
- [x] **Step 4.1:** Initialize Git Repository.
  - Run `git init` in the project root if not already done.
- [x] **Step 4.2:** Create a new branch for the solution.
  - e.g., `git checkout -b feature/bookmyshow-schema`
- [x] **Step 4.3:** Commit Documentation and SQL Files.
  - Ensure the `doc/problemStatement.md` and `doc/architecture_solution.md` are added. 
  - *Tip: You may want to export the SQL commands into a standalone `schema.sql` file.*
- [x] **Step 4.4:** Push and Create Pull Request (PR).
  - Push the branch to GitHub: `git push origin feature/bookmyshow-schema`.
  - Open a PR against the `main` branch, summarizing the tables, normalization, and queries in the PR description.

## Phase 5: Final Submission 
**Goal:** Ensure all deliverables meet the expected output.
- [ ] Check if the final document contains:
  - List of all tables and attributes.
  - Example rows (screenshots or markdown tables).
- [ ] Verify the GitHub PR link is accessible.
- [ ] Submit the assignment.
