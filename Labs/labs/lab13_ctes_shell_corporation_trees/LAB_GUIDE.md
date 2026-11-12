# Lab 13: Unraveling the Syndicate: Common Table Expressions & Recursive CTEs
## Course: CSCI 340 - Database Systems & Forensics
**Case Code:** `OP-ROGUE-HORIZON` | **Target:** OmniCorp Global Logistics & Technologies

### 🎯 Pedagogical & Technical Focus
- **Core SQL Concepts:** Common Table Expressions (WITH), Chained CTEs, Recursive CTEs (WITH RECURSIVE), Graph Traversal
- **Target Database:** `database/omnicorp_investigation.db`

---

### 🕵️‍♂️ Investigative Case Briefing
The Cayman shell entity 'Apex Global Horizon Ltd' was merely an intermediary. To convict the true mastermind, the Task Force must penetrate a multi-jurisdictional shell company network designed with nested layers of holding companies across Luxembourg, Panama, BVI, and Seychelles. In this lab, you will construct recursive CTEs to trace the ultimate beneficial ownership.

---

### 📋 Investigative Tasks & Questions

#### Task 13.1: Simplifying Vendor Procurement Risk with CTE
**Objective:** Write a Common Table Expression (WITH vendor_risk AS (...)) that calculates the total spend and average order size per vendor, and then query it to display vendors with high/critical risk whose total spend exceeds $500,000.

> **Investigative Tip / Hint:** `WITH vendor_risk AS (SELECT v.vendor_id, v.vendor_name, v.risk_rating, SUM(p.total_amount) AS total_spend FROM vendors v JOIN procurement_orders p USING(vendor_id) GROUP BY v.vendor_id) SELECT * FROM vendor_risk WHERE total_spend > 500000;`

#### Task 13.2: Chaining CTEs for Capital Flight Balancing
**Objective:** Construct two chained CTEs: CTE 1 computes total procurement received per vendor; CTE 2 computes total offshore wires received per account. Query the joined CTEs to detect capital flight discrepancies.

> **Investigative Tip / Hint:** `WITH po_totals AS (...), wire_totals AS (...) SELECT ... FROM po_totals JOIN wire_totals ...;`

#### Task 13.3: Recursive Shell Company Hierarchy Traversal
**Objective:** Write a RECURSIVE CTE (WITH RECURSIVE shell_tree AS (...)) starting at the root Swiss parent entity ('Vanguard Strategic Holdings AG', company_id = 1) and recursively selecting all subsidiary entities, tracking the hierarchy level and full corporate path.

> **Investigative Tip / Hint:** `WITH RECURSIVE shell_tree AS (SELECT company_id, entity_name, jurisdiction, parent_company_id, 1 AS depth, entity_name AS path FROM shell_companies WHERE parent_company_id IS NULL UNION ALL SELECT c.company_id, c.entity_name, c.jurisdiction, c.parent_company_id, st.depth + 1, st.path || ' -> ' || c.entity_name FROM shell_companies c JOIN shell_tree st ON c.parent_company_id = st.company_id) SELECT * FROM shell_tree;`

#### Task 13.4: Reverse Recursive Traversal (Bottom-Up to UBO)
**Objective:** Write a reverse recursive CTE starting from 'Apex Global Horizon Ltd' (company_id = 4) and climbing upward through parent_company_id to determine the root parent entity and its beneficial owner.

> **Investigative Tip / Hint:** `WITH RECURSIVE reverse_tree AS (SELECT company_id, entity_name, parent_company_id, beneficial_owner_id FROM shell_companies WHERE company_id = 4 UNION ALL SELECT sc.company_id, sc.entity_name, sc.parent_company_id, sc.beneficial_owner_id FROM shell_companies sc JOIN reverse_tree rt ON sc.company_id = rt.parent_company_id) SELECT * FROM reverse_tree;`

#### Task 13.5: Forensic Finding: The Ultimate Beneficial Owner
**Objective:** Join the root entity of the shell hierarchy with the employees table to name the Ultimate Beneficial Owner (UBO) hiding behind nominee directors.

> **Investigative Tip / Hint:** `Confirm company_id = 1 beneficial_owner_id = 1001 (Victor Vance).`

---

### 📤 Submission Deliverables
1. Save your completed SQL queries in [`student_queries.sql`](student_queries.sql).
2. Execute your script against `omnicorp_investigation.db` to verify syntax and outputs.
3. In the header comment of your SQL file, write a 2-3 sentence **Forensic Finding** explaining what clue you uncovered in this lab and how it advances the investigation against OmniCorp leadership.
