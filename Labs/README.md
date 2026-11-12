# CSCI 340: Database Systems & Forensic Analytics
## Operation Rogue Horizon: A 14-Week Investigative Database Lab Series

> **Joint Special Task Force: Financial & Cyber Crimes Division**  
> **Target Entity:** OmniCorp Global Logistics & Technologies (OGLT)  
> **Case Code:** `OP-ROGUE-HORIZON`  
> **Database Engine:** SQLite 3 (Compatible with PostgreSQL / MySQL / DuckDB)  
> **Dataset Size:** 15 Tables | 400,000+ Records | High-Throughput Forensic Logs

---

### 🚨 Case Background & Investigator Briefing

You have been deputized as a **Forensic Database Investigator** for the International Joint Task Force on Corporate Fraud and Counter-Proliferation.

**OmniCorp Global Logistics & Technologies** is a multi-billion dollar multinational shipping and aerospace contractor headquartered in Zurich, Switzerland, with major operational hubs across Rotterdam, Singapore, Houston, Dubai, and Panama City.

Three weeks ago, **Dr. Elena Rostova**, Vice President of Advanced Research at OmniCorp and head of the classified **"Project Aegis-X"** (next-generation quantum encryption hardware), sent an encrypted distress signal to the SEC and Interpol alleging:
1. Systematic diversion of quantum-grade microprocessors and aerospace guidance hardware.
2. Falsified maritime customs declarations and container weight discrepancies.
3. Millions of dollars laundered through offshore shell companies in the Cayman Islands and Panama via structured procurement kickbacks.
4. Active deletion and tampering of enterprise database audit logs.

Within 48 hours of sending the alert, Dr. Rostova was discovered deceased in her Zurich laboratory under suspicious circumstances. Company executives claimed accidental asphyxiation. Internal database audit logs for that night appear altered.

The Federal Court has granted our team a **clandestine forensic mirror** of OmniCorp’s production database cluster (`omnicorp_investigation.db`). 

Over the next 14 weeks, your mission is to use SQL to query, analyze, stage, optimize, and reconstruct the digital evidence. Each lab uncovers a new layer of the conspiracy until you assemble the complete **Grand Jury Indictment Dossier** in Week 14.

---

### 🗺️ 14-Week Curriculum & Pedagogical Map

| Week | Lab Title & Focus | Core SQL & Relational Topics | Investigative Crime Vector |
| :---: | :--- | :--- | :--- |
| **01** | [Case Briefing & Schema Discovery](labs/lab01_briefing_and_discovery/) | Relational model, SQLite CLI, `SELECT`, aliases, `LIMIT`, `ORDER BY` | Inspecting executive org chart, finding Dr. Rostova's 'DECEASED' record |
| **02** | [Filtering Suspects & Masked Entities](labs/lab02_filtering_suspects/) | `WHERE`, `AND`/`OR`/`NOT`, `LIKE`, `IN`, `BETWEEN`, `IS NULL` | Uncovering ghost employees and secrecy haven vendors |
| **03** | [Forensic Accounting & Structuring](labs/lab03_forensic_aggregations/) | `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `GROUP BY`, `HAVING` | Smurfing: detecting structured transfers under $10,000 threshold |
| **04** | [Multi-Table Link Analysis & Joins](labs/lab04_relational_joins/) | PK/FK constraints, `INNER JOIN`, `LEFT JOIN`, multi-table joins | Linking illicit procurement orders to rogue approvers & fake vendors |
| **05** | [Surveillance Logs & Network Joins](labs/lab05_network_itinerary_joins/) | `SELF JOIN`, cross-table correlations, timestamp joins | Cross-referencing executive burner phone logs with foreign operatives |
| **06** | [Deep Surveillance & Subqueries](labs/lab06_subquery_surveillance/) | Scalar subqueries, multi-row subqueries (`IN`, `EXISTS`), correlated | Identifying unmanifested shipments & anomalous executive salary gaps |
| **07** | [Ledger Reconciliation & Set Ops](labs/lab07_set_operations_reconciliation/) | `UNION`, `UNION ALL`, `INTERSECT`, `EXCEPT` | Reconciling discrepancies between Zurich HQ and Cayman offshore ledgers |
| **08** | [Evidence Staging & Schema Design](labs/lab08_ddl_evidence_staging/) | DDL, `CREATE TABLE`, `CHECK`, `UNIQUE`, `FOREIGN KEY`, Normalization | Building isolated forensic evidence tables for seized contraband |
| **09** | [Catching Data Tampering & DML](labs/lab09_dml_tampering_transactions/) | `INSERT`, `UPDATE`, `DELETE`, `BEGIN`, `COMMIT`, `ROLLBACK`, ACID | Detecting DBA Lukas Bader altering shipment weights & rollback scripts |
| **10** | [Forensic Lockers & Security Views](labs/lab10_views_security_privilege/) | `CREATE VIEW`, security abstraction, row/column masking | Constructing redacted prosecutor views & privilege audit |
| **11** | [High-Throughput Log Optimization](labs/lab11_indexing_big_log_forensics/) | B-Trees, `CREATE INDEX`, composite indexes, `EXPLAIN QUERY PLAN` | Searching 200,000+ badge logs to uncover midnight Vault-7B break-in |
| **12** | [Trajectory Analysis & Window Functions](labs/lab12_window_functions_insider_trading/) | `OVER()`, `PARTITION BY`, `ROW_NUMBER`, `RANK`, `LEAD`, `LAG`, Running Totals | Detecting executive stock dumping 48 hours prior to whistleblower death |
| **13** | [Unraveling Shell Networks & CTEs](labs/lab13_ctes_shell_corporation_trees/) | Common Table Expressions, Recursive CTEs (`WITH RECURSIVE`) | Tracing multi-tiered offshore holding companies to CEO Victor Vance |
| **14** | [Grand Jury Indictment Capstone](labs/lab14_capstone_grand_jury_indictment/) | Full SQL synthesis, complex queries, multi-vector evidence report | Assembling the final prosecution dossier and indictment brief |

---

### 💻 Quick Start & Setup

#### Prerequisites
- Python 3.8+ (for synthetic data generator & automated test runner)
- SQLite 3 (built-in on macOS/Linux; zero-friction standalone DB)
- **Optional / Alternative:** MySQL 8.0+ or MariaDB 10.5+ (full native MySQL dump provided)

#### 1. SQLite Database Setup (Zero Installation)
The SQLite database is pre-built at [`database/omnicorp_investigation.db`](database/omnicorp_investigation.db). You can inspect or re-generate it at any time:
```bash
# Re-generate SQLite forensic database (400,000+ rows)
python3 database/generate_data.py
```

#### 2. MySQL Database Import (Direct MySQL Import)
A production-ready MySQL dump (`database/mysql_omnicorp_investigation.sql`, ~43.4 MB) is provided with InnoDB engine settings, indexes, foreign keys, and batched inserts:
```bash
# Export or re-generate MySQL dump from SQLite at any time:
python3 database/export_to_mysql.py

# Import directly into your local or cloud MySQL server:
mysql -u root -p < database/mysql_omnicorp_investigation.sql
```
This automatically creates the `omnicorp_investigation` database, builds all 15 tables with constraints, and populates all 400,000+ records in seconds.

---

### 🧪 Automated SQL Test Runner & Self-Grading

Each lab includes automated testing so students can run, debug, and verify their queries until they pass 100% before submitting.

#### How to Test Your Work as a Student:
1. Open the lab folder (e.g. `labs/lab01_briefing_and_discovery/`).
2. Write your SQL queries in [`student_queries.sql`](labs/lab01_briefing_and_discovery/student_queries.sql) under each task header.
3. Run the automated tester:
```bash
# Option A: From inside the lab folder
cd labs/lab01_briefing_and_discovery
python3 test.py

# Option B: From the course root folder
python3 test_runner.py --lab 1
```

The tester will execute each task query, validate row counts, check column structures, verify forensic breadcrumbs, and provide immediate feedback:
```text
[TASK 1.1] Database Schema Reconnaissance
  ✅ PASS: Correctly retrieved 15 user tables.

[TASK 1.2] Department Budgets and Hierarchy
  ✅ PASS: All 10 departments returned and correctly ordered by budget DESC.
...
📊 SUMMARY FOR LAB 01: 5/5 PASSED (100.0%)
🏆 STATUS: ALL TESTS PASSED! READY FOR SUBMISSION!
```

#### Testing All Labs (Instructor / Self-Audit):
```bash
# Test all 14 labs against the master instructor key:
python3 test_runner.py --all --solution
```

---

### 📂 Directory Structure

```text
.
├── README.md                      # Master course syllabus & case overview
├── database/
│   ├── schema.sql                 # Complete relational DDL schema
│   ├── generate_data.py           # Synthetic forensic data generator (400k+ rows)
│   └── omnicorp_investigation.db  # Generated SQLite forensic database
├── labs/
│   ├── lab01_briefing_and_discovery/
│   ├── lab02_filtering_suspects/
│   ├── lab03_forensic_aggregations/
│   ├── lab04_relational_joins/
│   ├── lab05_network_itinerary_joins/
│   ├── lab06_subquery_surveillance/
│   ├── lab07_set_operations_reconciliation/
│   ├── lab08_ddl_evidence_staging/
│   ├── lab09_dml_tampering_transactions/
│   ├── lab10_views_security_privilege/
│   ├── lab11_indexing_big_log_forensics/
│   ├── lab12_window_functions_insider_trading/
│   ├── lab13_ctes_shell_corporation_trees/
│   └── lab14_capstone_grand_jury_indictment/
└── instructor/
    ├── master_solution_key.md     # Full SQL solutions, query outputs & storyline guide
    └── grading_rubrics.md         # Standardized 100-point rubric per lab
```

---

### ⚖️ Evidence Integrity Guidelines
As a forensic investigator, ensure that:
1. All analytical queries on the core evidence tables remain non-destructive unless specifically tasked in DDL/DML labs (Labs 8 & 9).
2. Query performance counts: in high-throughput logs (Labs 11 & 12), inefficient full-table scans can stall real-time forensic monitoring.
3. Every SQL query submitted must be accompanied by your **Investigative Finding**—explaining what the data reveals about the criminal conspiracy.
