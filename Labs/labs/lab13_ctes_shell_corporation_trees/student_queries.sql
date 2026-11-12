-- =====================================================================
-- CSCI 340: Database Systems & Forensics
-- Lab 13: Unraveling the Syndicate: Common Table Expressions & Recursive CTEs
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
-- Task 13.1: Simplifying Vendor Procurement Risk with CTE
-- Objective: Write a Common Table Expression (WITH vendor_risk AS (...)) that calculates the total spend and average order size per vendor, and then query it to display vendors with high/critical risk whose total spend exceeds $500,000.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 13.1 BELOW:



-- ---------------------------------------------------------------------
-- Task 13.2: Chaining CTEs for Capital Flight Balancing
-- Objective: Construct two chained CTEs: CTE 1 computes total procurement received per vendor; CTE 2 computes total offshore wires received per account. Query the joined CTEs to detect capital flight discrepancies.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 13.2 BELOW:



-- ---------------------------------------------------------------------
-- Task 13.3: Recursive Shell Company Hierarchy Traversal
-- Objective: Write a RECURSIVE CTE (WITH RECURSIVE shell_tree AS (...)) starting at the root Swiss parent entity ('Vanguard Strategic Holdings AG', company_id = 1) and recursively selecting all subsidiary entities, tracking the hierarchy level and full corporate path.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 13.3 BELOW:



-- ---------------------------------------------------------------------
-- Task 13.4: Reverse Recursive Traversal (Bottom-Up to UBO)
-- Objective: Write a reverse recursive CTE starting from 'Apex Global Horizon Ltd' (company_id = 4) and climbing upward through parent_company_id to determine the root parent entity and its beneficial owner.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 13.4 BELOW:



-- ---------------------------------------------------------------------
-- Task 13.5: Forensic Finding: The Ultimate Beneficial Owner
-- Objective: Join the root entity of the shell hierarchy with the employees table to name the Ultimate Beneficial Owner (UBO) hiding behind nominee directors.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 13.5 BELOW:



