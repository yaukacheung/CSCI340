-- =====================================================================
-- CSCI 340: Database Systems & Forensics
-- Lab 08: Evidence Staging, DDL & Schema Integrity
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
-- Task 8.1: Design the Evidence Custody Table
-- Objective: Create table evidence_lockbox with columns: evidence_id (INT PK), case_ref (TEXT NOT NULL), item_description (TEXT NOT NULL), seizure_location (TEXT NOT NULL), custody_officer_id (INT FK -> employees), seizure_date (DATE NOT NULL), integrity_sha256 (TEXT UNIQUE NOT NULL).
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 8.1 BELOW:



-- ---------------------------------------------------------------------
-- Task 8.2: Design the Contraband Hardware Registry
-- Objective: Create table contraband_hardware with columns: hardware_id (INT PK), serial_no (TEXT UNIQUE NOT NULL), model_name (TEXT NOT NULL), classification (TEXT CHECK IN ('CONFIDENTIAL', 'SECRET', 'TOP_SECRET')), physical_condition (TEXT CHECK IN ('INTACT', 'TAMPERED', 'DAMAGED')), associated_shipment_id (INT FK -> shipments). Include CHECK constraint: serial_no must begin with 'SN-AEGIS-'.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 8.2 BELOW:



-- ---------------------------------------------------------------------
-- Task 8.3: Add Foreign Key Relationships & Indexes
-- Objective: Verify that foreign keys are enabled (PRAGMA foreign_keys = ON;). Create an index on associated_shipment_id in contraband_hardware.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 8.3 BELOW:



-- ---------------------------------------------------------------------
-- Task 8.4: Test Constraint Enforcement (Negative Testing)
-- Objective: Write an INSERT statement that deliberately violates the CHECK constraint on serial_no (e.g., 'SN-GENERIC-001') and verify that SQLite rejects the insertion.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 8.4 BELOW:



-- ---------------------------------------------------------------------
-- Task 8.5: Stage Intercepted Aegis Prototype Chips
-- Objective: Insert the seized Aegis-X prototype chip recovered from Container CT-9042: hardware_id 1, serial 'SN-AEGIS-PROTOTYPE-01', model 'Aegis Quantum Processor Q-9', classification 'TOP_SECRET', condition 'INTACT', shipment 7001.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 8.5 BELOW:



