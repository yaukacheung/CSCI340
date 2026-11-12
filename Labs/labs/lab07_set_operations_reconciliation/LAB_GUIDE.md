# Lab 07: Ledger Reconciliation & Set Operations
## Course: CSCI 340 - Database Systems & Forensics
**Case Code:** `OP-ROGUE-HORIZON` | **Target:** OmniCorp Global Logistics & Technologies

### 🎯 Pedagogical & Technical Focus
- **Core SQL Concepts:** UNION, UNION ALL, INTERSECT, EXCEPT (Set Difference), Schema Compatibility
- **Target Database:** `database/omnicorp_investigation.db`

---

### 🕵️‍♂️ Investigative Case Briefing
Financial forensic audits rely heavily on set operations to compare disparate data sets: identifying shared accounts across conflicting departments, merging multiple transactional streams, and locating records that exist in one ledger but have vanished from another.

---

### 📋 Investigative Tasks & Questions

#### Task 7.1: Master Ledger of All Active Accounts (UNION)
**Objective:** Use UNION to compile a distinct list of all account identifiers that appear either as a source (account_from) or destination (account_to) in financial_transactions.

> **Investigative Tip / Hint:** `SELECT account_from AS account_id FROM financial_transactions UNION SELECT account_to FROM financial_transactions;`

#### Task 7.2: Dual-Purpose Accounts: Vendors vs Wire Destinations (INTERSECT)
**Objective:** Use INTERSECT to find account numbers that appear simultaneously in the vendors table (as bank_account_no) AND as destination accounts (account_to) in financial_transactions.

> **Investigative Tip / Hint:** `SELECT bank_account_no FROM vendors INTERSECT SELECT account_to FROM financial_transactions;`

#### Task 7.3: Detecting Ghost Employees via Physical Access (EXCEPT)
**Objective:** Use EXCEPT to find all active employees in the employees table who have ZERO recorded badge swipes in security_badge_logs during the entire year of 2023. Who is receiving a salary without entering any corporate facility?

> **Investigative Tip / Hint:** `SELECT employee_id FROM employees WHERE status = 'ACTIVE' EXCEPT SELECT DISTINCT employee_id FROM security_badge_logs WHERE employee_id IS NOT NULL;`

#### Task 7.4: Procurement Bypasses: Direct Wires with No PO (EXCEPT)
**Objective:** Use EXCEPT to identify vendors that have received direct financial remittances in financial_transactions but have NO corresponding records in procurement_orders.

> **Investigative Tip / Hint:** `SELECT bank_account_no FROM vendors ... EXCEPT SELECT ... FROM procurement_orders;`

#### Task 7.5: Forensic Finding: Ghost Employee Confirmation
**Objective:** Confirm the identity and salary of the ghost employee discovered in Task 7.3, and document who hired/manages them.

> **Investigative Tip / Hint:** `Examine Kaspar Hauser (employee_id 1016), reporting directly to Victor Vance.`

---

### 📤 Submission Deliverables
1. Save your completed SQL queries in [`student_queries.sql`](student_queries.sql).
2. Execute your script against `omnicorp_investigation.db` to verify syntax and outputs.
3. In the header comment of your SQL file, write a 2-3 sentence **Forensic Finding** explaining what clue you uncovered in this lab and how it advances the investigation against OmniCorp leadership.
