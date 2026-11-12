# Lab 11: High-Throughput Forensics: Indexing & Query Optimization
## Course: CSCI 340 - Database Systems & Forensics
**Case Code:** `OP-ROGUE-HORIZON` | **Target:** OmniCorp Global Logistics & Technologies

### 🎯 Pedagogical & Technical Focus
- **Core SQL Concepts:** B-Trees, CREATE INDEX, Composite Indexes, EXPLAIN QUERY PLAN, Cost & Performance Profiling
- **Target Database:** `database/omnicorp_investigation.db`

---

### 🕵️‍♂️ Investigative Case Briefing
With over 200,000 security badge records and 100,000 network session logs, routine forensic queries are taking several seconds or minutes, threatening to miss the court filing deadline. In this lab, you will profile slow query plans using EXPLAIN QUERY PLAN, identify table scans, build strategic B-Tree and composite indexes, and benchmark the execution speedups.

---

### 📋 Investigative Tasks & Questions

#### Task 11.1: Baseline Performance Profiling (Table Scan)
**Objective:** Run EXPLAIN QUERY PLAN on a query filtering security_badge_logs by door_name = 'Vault-7B (High-Security R&D)' and scan_time BETWEEN '2023-11-15 00:00:00' AND '2023-11-15 04:00:00'. Note the 'SCAN security_badge_logs' plan.

> **Investigative Tip / Hint:** `EXPLAIN QUERY PLAN SELECT * FROM security_badge_logs WHERE door_name = 'Vault-7B (High-Security R&D)' AND scan_time BETWEEN '2023-11-15 00:00:00' AND '2023-11-15 04:00:00';`

#### Task 11.2: Creating Composite B-Tree Index
**Objective:** Create a composite index idx_badge_door_time on security_badge_logs(door_name, scan_time).

> **Investigative Tip / Hint:** `CREATE INDEX idx_badge_door_time ON security_badge_logs(door_name, scan_time);`

#### Task 11.3: Verifying Index Utilization
**Objective:** Re-run EXPLAIN QUERY PLAN on the exact same query. Verify that the planner now uses 'SEARCH security_badge_logs USING INDEX idx_badge_door_time'. Measure the instantaneous retrieval.

> **Investigative Tip / Hint:** `EXPLAIN QUERY PLAN SELECT * FROM security_badge_logs WHERE door_name = 'Vault-7B (High-Security R&D)' AND scan_time BETWEEN '2023-11-15 00:00:00' AND '2023-11-15 04:00:00';`

#### Task 11.4: Optimizing Network Exfiltration Logs
**Objective:** Examine network_access_logs. Create index idx_network_emp_bytes on network_access_logs(employee_id, bytes_transferred). Run a query finding all sessions where bytes_transferred > 10,000,000,000 (10 GB).

> **Investigative Tip / Hint:** `CREATE INDEX idx_network_bytes ON network_access_logs(bytes_transferred DESC); SELECT * FROM network_access_logs WHERE bytes_transferred > 10000000000;`

#### Task 11.5: Forensic Finding: Midnight Vault Infiltration
**Objective:** Execute the optimized badge query for Vault-7B between 01:00 and 03:00 on Nov 15, 2023. Who scanned in? What auth methods were used? What happened to Dr. Elena Rostova's badge?

> **Investigative Tip / Hint:** `Identify Erik Vogel (MASTER_KEY), Alexei Rivera (PIN_OVERRIDE), and Dr. Rostova's card returning 'CARD_EXPIRED'.`

---

### 📤 Submission Deliverables
1. Save your completed SQL queries in [`student_queries.sql`](student_queries.sql).
2. Execute your script against `omnicorp_investigation.db` to verify syntax and outputs.
3. In the header comment of your SQL file, write a 2-3 sentence **Forensic Finding** explaining what clue you uncovered in this lab and how it advances the investigation against OmniCorp leadership.
