-- =====================================================================
-- CSCI 340: Database Systems & Forensics
-- Lab 11: High-Throughput Forensics: Indexing & Query Optimization
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
-- Task 11.1: Baseline Performance Profiling (Table Scan)
-- Objective: Run EXPLAIN QUERY PLAN on a query filtering security_badge_logs by door_name = 'Vault-7B (High-Security R&D)' and scan_time BETWEEN '2023-11-15 00:00:00' AND '2023-11-15 04:00:00'. Note the 'SCAN security_badge_logs' plan.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 11.1 BELOW:



-- ---------------------------------------------------------------------
-- Task 11.2: Creating Composite B-Tree Index
-- Objective: Create a composite index idx_badge_door_time on security_badge_logs(door_name, scan_time).
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 11.2 BELOW:



-- ---------------------------------------------------------------------
-- Task 11.3: Verifying Index Utilization
-- Objective: Re-run EXPLAIN QUERY PLAN on the exact same query. Verify that the planner now uses 'SEARCH security_badge_logs USING INDEX idx_badge_door_time'. Measure the instantaneous retrieval.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 11.3 BELOW:



-- ---------------------------------------------------------------------
-- Task 11.4: Optimizing Network Exfiltration Logs
-- Objective: Examine network_access_logs. Create index idx_network_emp_bytes on network_access_logs(employee_id, bytes_transferred). Run a query finding all sessions where bytes_transferred > 10,000,000,000 (10 GB).
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 11.4 BELOW:



-- ---------------------------------------------------------------------
-- Task 11.5: Forensic Finding: Midnight Vault Infiltration
-- Objective: Execute the optimized badge query for Vault-7B between 01:00 and 03:00 on Nov 15, 2023. Who scanned in? What auth methods were used? What happened to Dr. Elena Rostova's badge?
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 11.5 BELOW:



