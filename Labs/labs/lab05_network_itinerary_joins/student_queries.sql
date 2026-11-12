-- =====================================================================
-- CSCI 340: Database Systems & Forensics
-- Lab 05: Surveillance Correlation, Self-Joins & Network Maps
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
-- Task 5.1: Organizational Hierarchy Self-Join
-- Objective: Execute a SELF JOIN on the employees table to list every employee alongside their direct manager's full name, role, and department.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 5.1 BELOW:



-- ---------------------------------------------------------------------
-- Task 5.2: Subordinates Out-Earning Their Managers
-- Objective: Use a SELF JOIN to find all employees whose annual salary is strictly greater than their direct manager's salary. Display employee name, employee salary, manager name, and manager salary.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 5.2 BELOW:



-- ---------------------------------------------------------------------
-- Task 5.3: Executive Satellite & Encrypted Communications
-- Objective: Join phone_records with employees to identify all calls made by personnel holding 'TOP_SECRET' clearance where the call_type is 'SATELLITE' or 'ENCRYPTED_VOIP'. Display caller name, role, receiver_number, call_timestamp, duration, and cell tower.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 5.3 BELOW:



-- ---------------------------------------------------------------------
-- Task 5.4: Midnight Call Correlation (Nov 14-15, 2023)
-- Objective: Filter phone records for calls initiated between 2023-11-14 20:00:00 and 2023-11-15 06:00:00 (the critical 10-hour window surrounding Dr. Rostova's death). Display the caller details, duration, and destination number.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 5.4 BELOW:



-- ---------------------------------------------------------------------
-- Task 5.5: Forensic Finding: The Shared Burner Number
-- Objective: Identify the external burner number that received calls from BOTH CEO Victor Vance and CFO Marcus Sterling on the night of November 14, 2023.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 5.5 BELOW:



