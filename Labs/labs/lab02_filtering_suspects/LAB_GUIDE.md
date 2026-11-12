# Lab 02: Filtering Suspects & Masked Entities
## Course: CSCI 340 - Database Systems & Forensics
**Case Code:** `OP-ROGUE-HORIZON` | **Target:** OmniCorp Global Logistics & Technologies

### 🎯 Pedagogical & Technical Focus
- **Core SQL Concepts:** WHERE Clauses, Boolean Logic (AND/OR/NOT), LIKE, IN, BETWEEN, IS NULL
- **Target Database:** `database/omnicorp_investigation.db`

---

### 🕵️‍♂️ Investigative Case Briefing
Intelligence reports indicate that illicit operations within OmniCorp rely on 'ghost employees' on corporate payroll who have no real operational footprint, as well as unvetted shell vendors registered in Caribbean tax havens. Your objective is to filter through thousands of records to isolate suspects, identify suspicious vendors, and flag irregular financial movements.

---

### 📋 Investigative Tasks & Questions

#### Task 2.1: High-Clearance Operatives in Zurich
**Objective:** Query the employees table for all active employees stationed at the Zurich Headquarters (office_id = 1) who hold either 'SECRET' or 'TOP_SECRET' clearance and earn a salary exceeding $250,000.

> **Investigative Tip / Hint:** `WHERE office_id = 1 AND status = 'ACTIVE' AND security_clearance IN ('SECRET', 'TOP_SECRET') AND salary > 250000`

#### Task 2.2: Hunting the Ghost Employee
**Objective:** Identify all employees stationed in tax haven offices (offices in Cayman Islands, Panama, or BVI: office_id IN (6, 7, 15)) who have a salary over $200,000. Examine the record of Kaspar Hauser.

> **Investigative Tip / Hint:** `WHERE office_id IN (6, 7, 15) AND salary > 200000`

#### Task 2.3: High-Risk Offshore Shell Vendors
**Objective:** Query the vendors table to find all vendors whose registration_country is 'Cayman Islands', 'Panama', 'British Virgin Islands', or 'Seychelles', or whose risk_rating is 'CRITICAL'.

> **Investigative Tip / Hint:** `WHERE registration_country IN ('Cayman Islands', 'Panama', 'British Virgin Islands', 'Seychelles') OR risk_rating = 'CRITICAL'`

#### Task 2.4: Pattern Matching on Suspicious Entity Names
**Objective:** Use pattern matching (LIKE) to find vendors whose names contain keywords associated with shell corporations: '%Horizon%', '%Cypher%', '%Aegis%', or '%Strategic%'.

> **Investigative Tip / Hint:** `WHERE vendor_name LIKE '%Horizon%' OR vendor_name LIKE '%Cypher%' OR vendor_name LIKE '%Aegis%' OR vendor_name LIKE '%Strategic%'`

#### Task 2.5: Flagged & High-Value Offshore Transfers
**Objective:** Filter financial_transactions for records where txn_type is 'OFFSHORE_REMITTANCE' OR flagged_by_system = 1, and the amount is strictly greater than $100,000. Order by amount descending.

> **Investigative Tip / Hint:** `WHERE (txn_type = 'OFFSHORE_REMITTANCE' OR flagged_by_system = 1) AND amount > 100000 ORDER BY amount DESC`

---

### 📤 Submission Deliverables
1. Save your completed SQL queries in [`student_queries.sql`](student_queries.sql).
2. Execute your script against `omnicorp_investigation.db` to verify syntax and outputs.
3. In the header comment of your SQL file, write a 2-3 sentence **Forensic Finding** explaining what clue you uncovered in this lab and how it advances the investigation against OmniCorp leadership.
