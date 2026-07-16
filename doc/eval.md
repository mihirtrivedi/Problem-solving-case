# BookMyShow - Phase-Wise Evaluation Criteria

To ensure the project meets the expected standards at every step of the [Implementation Plan](implementationPlan.md), use the following evaluation criteria for each phase.

## Phase 1: Architecture & Database Design
**Evaluation Criteria:**
- **Entity Accuracy:** Are all necessary entities (`Theatre`, `Movie`, `Screen`, `Movie_Show`) identified?
- **Normalization (1NF-BCNF):**
  - *1NF Check:* Are all columns atomic without repeating groups?
  - *2NF & 3NF Check:* Does every non-key attribute depend strictly and entirely on the primary key without transitive dependencies?
  - *BCNF Check:* Are all determinants superkeys?
- **Visual Clarity:** Is the ER diagram logically structured and easy to understand?

## Phase 2: Database Setup & Data Seeding
**Evaluation Criteria:**
- **Syntax Validity:** Do the `CREATE TABLE` and `INSERT` SQL scripts execute cleanly on MySQL 8.0+ without syntax errors?
- **Constraint Enforcement:** 
  - Are Primary Keys (`PK`) and Foreign Keys (`FK`) correctly linked?
  - Are constraints like `ON DELETE CASCADE` present to maintain referential integrity?
- **Data Quality:** Does the dummy data realistically represent a movie ticketing scenario (valid dates, times, and relationships)?

## Phase 3: Query Execution & Validation (Testing)
**Evaluation Criteria:**
- **Query Correctness (P2 Solution):** 
  - Does the query use the correct `JOIN` types (e.g., `INNER JOIN`)?
  - Does the query output exactly what is requested (Movie Title, Show Timing, etc.)?
- **Filtering Accuracy:** Does the `WHERE` clause correctly isolate the target Theatre and Date?
- **Edge Case Resilience:** Does the query behave expectedly (returning empty sets instead of errors) when queried for dates/theatres with no scheduled shows?

## Phase 4: Version Control & GitHub PR Creation
**Evaluation Criteria:**
- **Git Practices:** 
  - Are commits logical and descriptive (e.g., "Add P1 SQL Schema", "Add P2 Query")?
  - Is the work isolated in a specific feature branch (e.g., `feature/bookmyshow`)?
- **PR Quality:** 
  - Does the Pull Request title clearly state its purpose?
  - Does the PR description summarize the database design choices, normalization proofs, and contain instructions to run the SQL?

## Phase 5: Final Submission 
**Evaluation Criteria:**
- **Guideline Adherence:** 
  - Is the final submitted document well-formatted?
  - Does it explicitly include the list of tables, attributes, and example rows?
- **Accessibility:** Is the GitHub PR public and reviewable by the evaluators?
- **Completeness:** Are both P1 (Schema setup) and P2 (Fetch query) successfully addressed and visible in the final submission?
