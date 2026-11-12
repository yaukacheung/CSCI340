-- =====================================================================
-- CSCI 340: Database Systems & Forensics
-- Lab 01: Case Briefing & Schema Discovery
-- Case File: Operation Rogue Horizon
-- Student Name: [ENTER YOUR NAME]
-- Date: [ENTER DATE]
-- =====================================================================

/*
FORENSIC INVESTIGATOR FINDINGS & SUMMARY:
[Write a brief 2-3 sentence summary of what your queries discovered below]
*/

.mode column
.headers on

-- ---------------------------------------------------------------------
-- Task 1.1: Database Schema Reconnaissance
-- Objective: Inspect SQLite metadata using the sqlite_master catalog table to retrieve the names and types of all user tables in the database.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 1.1 BELOW:



-- ---------------------------------------------------------------------
-- Task 1.2: Department Budgets and Hierarchy
-- Objective: Retrieve all department names and their allocated annual budgets from the departments table. Order the departments from highest budget to lowest budget.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 1.2 BELOW:



-- ---------------------------------------------------------------------
-- Task 1.3: Executive Compensation Scrutiny
-- Objective: Query the employees table to retrieve the top 10 highest-earning employees. Display their employee_id, first_name, last_name, role, and salary, renaming salary as annual_compensation. Order by compensation descending.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 1.3 BELOW:



-- ---------------------------------------------------------------------
-- Task 1.4: Locating Whistleblower Dr. Elena Rostova
-- Objective: Search the employees table specifically for Dr. Elena Rostova. Select all columns to examine her role, department, security clearance, manager, and current employment status.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 1.4 BELOW:



-- ---------------------------------------------------------------------
-- Task 1.5: Forensic Finding & Chain of Command
-- Objective: Identify Dr. Rostova's direct manager by employee_id, and query that manager's name and corporate role. Document your initial forensic findings regarding her status and manager.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 1.5 BELOW:



