# Lab 08: Evidence Staging, DDL & Schema Integrity
## Course: CSCI 340 - Database Systems & Forensics
**Case Code:** `OP-ROGUE-HORIZON` | **Target:** OmniCorp Global Logistics & Technologies

### 🎯 Pedagogical & Technical Focus
- **Core SQL Concepts:** Data Definition Language (DDL), CREATE TABLE, Constraints (PK, FK, CHECK, UNIQUE, NOT NULL)
- **Target Database:** `database/omnicorp_investigation.db`

---

### 🕵️‍♂️ Investigative Case Briefing
As physical evidence, seized hard drives, and intercepted cargo arrive from Rotterdam and Panama, the Task Force needs an isolated, secure database staging schema to maintain chain of custody and forensic quarantine. In this lab, you will write DDL to engineer new tables with strict integrity constraints.

---

### 📋 Investigative Tasks & Questions

#### Task 8.1: Design the Evidence Custody Table
**Objective:** Create table evidence_lockbox with columns: evidence_id (INT PK), case_ref (TEXT NOT NULL), item_description (TEXT NOT NULL), seizure_location (TEXT NOT NULL), custody_officer_id (INT FK -> employees), seizure_date (DATE NOT NULL), integrity_sha256 (TEXT UNIQUE NOT NULL).

> **Investigative Tip / Hint:** `CREATE TABLE evidence_lockbox (...);`

#### Task 8.2: Design the Contraband Hardware Registry
**Objective:** Create table contraband_hardware with columns: hardware_id (INT PK), serial_no (TEXT UNIQUE NOT NULL), model_name (TEXT NOT NULL), classification (TEXT CHECK IN ('CONFIDENTIAL', 'SECRET', 'TOP_SECRET')), physical_condition (TEXT CHECK IN ('INTACT', 'TAMPERED', 'DAMAGED')), associated_shipment_id (INT FK -> shipments). Include CHECK constraint: serial_no must begin with 'SN-AEGIS-'.

> **Investigative Tip / Hint:** `CHECK (serial_no LIKE 'SN-AEGIS-%')`

#### Task 8.3: Add Foreign Key Relationships & Indexes
**Objective:** Verify that foreign keys are enabled (PRAGMA foreign_keys = ON;). Create an index on associated_shipment_id in contraband_hardware.

> **Investigative Tip / Hint:** `CREATE INDEX idx_contraband_shipment ON contraband_hardware(associated_shipment_id);`

#### Task 8.4: Test Constraint Enforcement (Negative Testing)
**Objective:** Write an INSERT statement that deliberately violates the CHECK constraint on serial_no (e.g., 'SN-GENERIC-001') and verify that SQLite rejects the insertion.

> **Investigative Tip / Hint:** `INSERT INTO contraband_hardware VALUES (1, 'SN-GENERIC-001', ...); -- Should fail`

#### Task 8.5: Stage Intercepted Aegis Prototype Chips
**Objective:** Insert the seized Aegis-X prototype chip recovered from Container CT-9042: hardware_id 1, serial 'SN-AEGIS-PROTOTYPE-01', model 'Aegis Quantum Processor Q-9', classification 'TOP_SECRET', condition 'INTACT', shipment 7001.

> **Investigative Tip / Hint:** `INSERT INTO contraband_hardware VALUES (1, 'SN-AEGIS-PROTOTYPE-01', 'Aegis Quantum Processor Q-9', 'TOP_SECRET', 'INTACT', 7001);`

---

### 📤 Submission Deliverables
1. Save your completed SQL queries in [`student_queries.sql`](student_queries.sql).
2. Execute your script against `omnicorp_investigation.db` to verify syntax and outputs.
3. In the header comment of your SQL file, write a 2-3 sentence **Forensic Finding** explaining what clue you uncovered in this lab and how it advances the investigation against OmniCorp leadership.
