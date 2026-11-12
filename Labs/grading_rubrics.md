# Instructor Grading Rubrics & Pedagogical Guide
## Course: CSCI 340 - Database Systems & Forensic Analytics
### Case: Operation Rogue Horizon (OmniCorp Investigation)

This guide provides teaching assistants and instructors with standardized grading criteria (100 points per lab), evaluation benchmarks, query efficiency checks, and common student misconceptions across the 14-week curriculum.

---

## 📊 Standard 100-Point Scoring Breakdown

Each lab assignment is graded out of **100 Points**, divided across three standard pillars:

| Category | Points | Description |
| :--- | :---: | :--- |
| **1. SQL Correctness & Logic** | **50 pts** | Queries execute cleanly without syntax errors; accurate column selections, filters, aggregations, joins, or constraints; exact target records returned. (10 pts per task × 5 tasks). |
| **2. Relational Design & Efficiency** | **25 pts** | Use of appropriate relational constructs (avoiding Cartesian products, correct join predicates, proper indexing, using CTEs instead of redundant subqueries, honoring ACID transaction boundaries). |
| **3. Forensic Clue Extraction & Dossier** | **25 pts** | Accurate narrative interpretation in the header comment: Did the student identify *who* committed the crime, *how* the data proves it, and *what* the forensic significance is? |

---

## 🔍 Detailed Rubric by Lab

### Lab 01: Case Briefing & Schema Discovery
- **Technical Competency (50 pts):** Proper query of `sqlite_master`, usage of `ORDER BY ... DESC`, `LIMIT`, column aliases `AS annual_compensation`.
- **Relational Understanding (25 pts):** Correctly identifying foreign key pointers (`manager_id` linking back to `employee_id`).
- **Forensic Dossier (25 pts):** Student must highlight that Dr. Elena Rostova is marked `DECEASED` and reported directly to CEO Victor Vance.

### Lab 02: Filtering Suspects & Masked Entities
- **Technical Competency (50 pts):** Proper operator precedence with `AND` / `OR`, usage of `IN (...)`, `LIKE '%keyword%'`, `BETWEEN`.
- **Relational Understanding (25 pts):** Correct handling of `NULL` comparisons (`IS NULL` vs `= NULL`).
- **Forensic Dossier (25 pts):** Unmasking the ghost employee Kaspar Hauser in Cayman Islands ($265,000 salary) and identifying the $2.5M wire to Seychelles right before Rostova's death.

### Lab 03: Forensic Accounting & Aggregate Anomalies
- **Technical Competency (50 pts):** Mastery of `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `GROUP BY`, and `HAVING`.
- **Relational Understanding (25 pts):** Distinguishing `WHERE` (pre-aggregation filter) from `HAVING` (post-aggregation filter).
- **Forensic Dossier (25 pts):** Identifying smurfing / structuring payments to `KY-APEX-9910-01` ($9,850 to $9,990 range to evade $10k reporting).

### Lab 04: Multi-Table Link Analysis & Relational Joins
- **Technical Competency (50 pts):** `INNER JOIN`, `LEFT OUTER JOIN`, joining 3 and 4 tables simultaneously with clear table aliases.
- **Relational Understanding (25 pts):** Using `LEFT JOIN ... WHERE right_table.key IS NULL` to detect anti-joins (inactive personnel).
- **Forensic Dossier (25 pts):** Naming Chloe Dupont (requester) and Marcus Sterling (approver) on unapproved vendor contracts to Apex and CypherTech.

### Lab 05: Surveillance Correlation, Self-Joins & Network Maps
- **Technical Competency (50 pts):** `SELF JOIN` syntax aliasing the same table twice (`emp` vs `mgr`), timestamp range filters.
- **Relational Understanding (25 pts):** Understanding self-referential foreign keys and graph edge traversal.
- **Forensic Dossier (25 pts):** Catching the common satellite/VoIP call to burner number `+1 345 555 9011` placed by Vance and Sterling on Nov 14, 2023.

### Lab 06: Deep Surveillance & Subquery Forensics
- **Technical Competency (50 pts):** Scalar subqueries in `WHERE` and `SELECT`, multi-row subqueries with `IN`, correlated subqueries with `EXISTS` and `NOT EXISTS`.
- **Relational Understanding (25 pts):** Understanding correlated subquery evaluation per row vs independent subquery evaluation once.
- **Forensic Dossier (25 pts):** Identifying Container `CT-9042` (Shipment 7001) carrying unmanifested cryo-unit valued at $85M with 1,450 kg undeclared weight.

### Lab 07: Ledger Reconciliation & Set Operations
- **Technical Competency (50 pts):** `UNION` vs `UNION ALL`, `INTERSECT`, `EXCEPT`. Strict matching of column count and compatible data types.
- **Relational Understanding (25 pts):** Set union deduplication vs multiset union retention.
- **Forensic Dossier (25 pts):** Conclusively proving Kaspar Hauser is a ghost employee (appears in `employees` but completely absent from `security_badge_logs` across 200,000 entries).

### Lab 08: Evidence Staging, DDL & Schema Integrity
- **Technical Competency (50 pts):** DDL statements: `CREATE TABLE`, `CHECK (...)`, `UNIQUE`, `NOT NULL`, `FOREIGN KEY (...) REFERENCES ...`.
- **Relational Understanding (25 pts):** Testing integrity constraints with negative testing (proving illegal inserts fail).
- **Forensic Dossier (25 pts):** Successful staging of intercepted Aegis Q-9 prototype chip into the isolated quarantine evidence tables.

### Lab 09: Catching Data Tampering & DML Transactions
- **Technical Competency (50 pts):** `INSERT`, `UPDATE`, `DELETE`, `BEGIN TRANSACTION`, `COMMIT`, `ROLLBACK`.
- **Relational Understanding (25 pts):** ACID properties: atomicity of multiple updates, audit logging within the same transaction scope.
- **Forensic Dossier (25 pts):** Catching DBA Lukas Bader tampering with container weights and audit logs; executing legal rollback and suspending the rogue account.

### Lab 10: Virtual Evidence Lockers: Views & Security Access Control
- **Technical Competency (50 pts):** `CREATE VIEW`, column expressions, string masking (`SUBSTR`, string concatenation).
- **Relational Understanding (25 pts):** Principle of Least Privilege: abstracting sensitive data while presenting computed analytics.
- **Forensic Dossier (25 pts):** Uncovering privilege escalation in network logs where non-IT staff attempted audit log scrubbing.

### Lab 11: High-Throughput Forensics: Indexing & Query Optimization
- **Technical Competency (50 pts):** `EXPLAIN QUERY PLAN`, `CREATE INDEX`, composite index column ordering (`(door_name, scan_time)`).
- **Relational Understanding (25 pts):** Comparing `SCAN table` (O(N) full table scan) vs `SEARCH table USING INDEX` (O(log N) B-Tree lookup).
- **Forensic Dossier (25 pts):** Uncovering the midnight Vault-7B break-in: Erik Vogel using `MASTER_KEY` and Alexei Rivera using `PIN_OVERRIDE` while Dr. Rostova's badge was deactivated.

### Lab 12: Financial Trajectory & Window Functions
- **Technical Competency (50 pts):** `OVER()`, `PARTITION BY`, `ORDER BY`, `ROW_NUMBER()`, `RANK()`, `LAG()`, running sums.
- **Relational Understanding (25 pts):** Distinguishing window calculations (retaining row identity) from `GROUP BY` aggregations (collapsing rows).
- **Forensic Dossier (25 pts):** Exposing the massive insider stock dumps by Vance ($28.5M), Sterling ($15.5M), and Dupont ($7.9M) right before Rostova's death.

### Lab 13: Unraveling the Syndicate: Common Table Expressions & Recursive CTEs
- **Technical Competency (50 pts):** `WITH` clauses, chained CTEs, `WITH RECURSIVE` anchor and recursive member with `UNION ALL`.
- **Relational Understanding (25 pts):** Hierarchical data traversal, termination condition in recursive CTEs to prevent infinite loops.
- **Forensic Dossier (25 pts):** Tracing the corporate shell tree from Apex Global up to Swiss parent Vanguard Strategic Holdings, proving CEO Victor Vance is the UBO.

### Lab 14: Grand Jury Indictment & Capstone Forensic Dossier
- **Technical Competency (50 pts):** Synthesis of complex queries across 5 distinct evidence vectors using CTEs, window functions, and multi-table joins.
- **Relational Understanding (25 pts):** End-to-end query optimization, clean formatting, accurate joins without Cartesian explosion.
- **Forensic Dossier (25 pts):** Complete indictment brief naming all 6 conspirators with exact dollar proceeds, roles, and criminal statutes.

---

## 🛠️ Common Pitfalls to Watch For During Grading

1. **Cartesian Product Disasters:**  
   Students forgetting `ON` or `USING` clauses in multi-table joins, turning 5,000 shipments × 10,000 manifest items into 50,000,000 rows.
2. **`WHERE` vs `HAVING` Confusion:**  
   Students filtering aggregated sums (`SUM(amount) > 10000`) inside a `WHERE` clause instead of `HAVING`.
3. **`NULL` Comparison Errors:**  
   Students writing `WHERE manager_id = NULL` instead of `WHERE manager_id IS NULL`.
4. **Window Function Frame Specification:**  
   Forgetting that `ORDER BY` inside `OVER()` defaults to `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW` for running totals.
5. **Composite Index Column Order:**  
   In Lab 11, creating an index on `(scan_time, door_name)` instead of `(door_name, scan_time)` when door equality is checked first.
