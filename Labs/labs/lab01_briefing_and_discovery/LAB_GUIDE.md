# Lab 01: Case Briefing & Schema Discovery
## Course: CSCI 340 - Database Systems & Forensics
**Case Code:** `OP-ROGUE-HORIZON` | **Target:** OmniCorp Global Logistics & Technologies

### 🎯 Pedagogical & Technical Focus
- **Core SQL Concepts:** Relational Concepts, SQLite CLI, SELECT, Column Aliases, ORDER BY, LIMIT
- **Target Database:** `database/omnicorp_investigation.db`

---

### 🕵️‍♂️ Investigative Case Briefing
Welcome to the Task Force, Investigator. You have been granted access to the cloned forensic database of OmniCorp Global Logistics & Technologies (OGLT). Your first task is to orient yourself within this multi-billion dollar enterprise database. You must inspect the table structures, review the corporate department hierarchy, identify key executive leadership, and verify the alarming rumors regarding Dr. Elena Rostova.

---

### 📋 Investigative Tasks & Questions

#### Task 1.1: Database Schema Reconnaissance
**Objective:** Inspect SQLite metadata using the sqlite_master catalog table to retrieve the names and types of all user tables in the database.

> **Investigative Tip / Hint:** `SELECT type, name FROM sqlite_master WHERE type='table' ORDER BY name;`

#### Task 1.2: Department Budgets and Hierarchy
**Objective:** Retrieve all department names and their allocated annual budgets from the departments table. Order the departments from highest budget to lowest budget.

> **Investigative Tip / Hint:** `SELECT dept_name, budget FROM departments ORDER BY budget DESC;`

#### Task 1.3: Executive Compensation Scrutiny
**Objective:** Query the employees table to retrieve the top 10 highest-earning employees. Display their employee_id, first_name, last_name, role, and salary, renaming salary as annual_compensation. Order by compensation descending.

> **Investigative Tip / Hint:** `SELECT employee_id, first_name, last_name, role, salary AS annual_compensation FROM employees ORDER BY salary DESC LIMIT 10;`

#### Task 1.4: Locating Whistleblower Dr. Elena Rostova
**Objective:** Search the employees table specifically for Dr. Elena Rostova. Select all columns to examine her role, department, security clearance, manager, and current employment status.

> **Investigative Tip / Hint:** `SELECT * FROM employees WHERE last_name = 'Rostova';`

#### Task 1.5: Forensic Finding & Chain of Command
**Objective:** Identify Dr. Rostova's direct manager by employee_id, and query that manager's name and corporate role. Document your initial forensic findings regarding her status and manager.

> **Investigative Tip / Hint:** `SELECT employee_id, first_name, last_name, role FROM employees WHERE employee_id = 1001;`

---

### 📤 Submission Deliverables
1. Save your completed SQL queries in [`student_queries.sql`](student_queries.sql).
2. Execute your script against `omnicorp_investigation.db` to verify syntax and outputs.
3. In the header comment of your SQL file, write a 2-3 sentence **Forensic Finding** explaining what clue you uncovered in this lab and how it advances the investigation against OmniCorp leadership.
