#!/usr/bin/env python3
"""
Automated SQL Lab Tester & Grading Harness
Course: CSCI 340 - Database Systems & Forensics
Case: Operation Rogue Horizon (OmniCorp Investigation)

Usage:
  python3 test_runner.py --lab 1              # Test Lab 01 for student
  python3 test_runner.py -l 03                # Test Lab 03
  python3 test_runner.py --all                # Test all 14 labs
  python3 test_runner.py --lab 1 --solution   # Test master solution key for Lab 01
"""

import os
import sys
import re
import sqlite3
import argparse
import shutil
import tempfile

from tests.test_specs import LAB_VALIDATORS

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DB_FILE = os.path.join(BASE_DIR, "database", "omnicorp_investigation.db")
LABS_DIR = os.path.join(BASE_DIR, "labs")
SOLUTION_FILE = os.path.join(BASE_DIR, "instructor", "master_solution_key.md")

LAB_FOLDERS = {
    1: "lab01_briefing_and_discovery",
    2: "lab02_filtering_suspects",
    3: "lab03_forensic_aggregations",
    4: "lab04_relational_joins",
    5: "lab05_network_itinerary_joins",
    6: "lab06_subquery_surveillance",
    7: "lab07_set_operations_reconciliation",
    8: "lab08_ddl_evidence_staging",
    9: "lab09_dml_tampering_transactions",
    10: "lab10_views_security_privilege",
    11: "lab11_indexing_big_log_forensics",
    12: "lab12_window_functions_insider_trading",
    13: "lab13_ctes_shell_corporation_trees",
    14: "lab14_capstone_grand_jury_indictment"
}

def clean_sql(raw_sql):
    lines = []
    for line in raw_sql.splitlines():
        trimmed = line.strip()
        # ignore dot commands (.mode, .headers)
        if trimmed.startswith("."):
            continue
        # ignore single line comments starting with --
        if trimmed.startswith("--"):
            continue
        lines.append(line)
    sql_text = "\n".join(lines).strip()
    # Strip block comments
    sql_text = re.sub(r'/\*.*?\*/', '', sql_text, flags=re.DOTALL).strip()
    return sql_text

def parse_student_sql(file_path, lab_num):
    if not os.path.exists(file_path):
        return None, f"File not found: {file_path}"
    
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Split queries by task markers like -- Task X.Y: ...
    queries = {}
    pattern = rf'--\s*(?:Task|TASK)\s*({lab_num}\.[1-5])[^\n]*'
    splits = list(re.finditer(pattern, content, flags=re.IGNORECASE))
    
    for i, match in enumerate(splits):
        task_id = match.group(1)
        start_pos = match.end()
        end_pos = splits[i+1].start() if i + 1 < len(splits) else len(content)
        chunk = content[start_pos:end_pos]
        
        # Remove "WRITE YOUR QUERY FOR TASK ... BELOW:"
        chunk = re.sub(r'--\s*WRITE YOUR QUERY.*', '', chunk, flags=re.IGNORECASE)
        # Remove objective lines
        chunk = re.sub(r'--\s*Objective:.*', '', chunk, flags=re.IGNORECASE)
        chunk = re.sub(r'--\s*-+.*', '', chunk)
        
        cleaned = clean_sql(chunk)
        queries[task_id] = cleaned

    return queries, None

def parse_solution_sql(lab_num):
    if not os.path.exists(SOLUTION_FILE):
        return None, f"Solution file not found: {SOLUTION_FILE}"
    
    with open(SOLUTION_FILE, "r", encoding="utf-8") as f:
        content = f.read()

    lab_header = f"## Lab {lab_num:02d}:"
    if lab_header not in content:
        return None, f"Lab {lab_num} not found in solution key."
    
    part = content.split(lab_header)[1]
    if "## Lab " in part:
        part = part.split("## Lab ")[0]

    queries = {}
    pattern = rf'-- Task ({lab_num}\.[1-5]):[^\n]*\n(.*?)(?=(?:-- Task {lab_num}\.[1-5]|\Z))'
    matches = re.finditer(pattern, part, re.DOTALL)
    for m in matches:
        t_num = m.group(1)
        raw_code = m.group(2).replace("```sql", "").replace("```", "")
        cleaned = clean_sql(raw_code)
        queries[t_num] = cleaned

    return queries, None

def run_test_for_lab(lab_num, use_solution=False, custom_file=None):
    folder_name = LAB_FOLDERS.get(lab_num)
    if not folder_name:
        print(f"Error: Invalid lab number {lab_num}. Choose 1 to 14.")
        return False

    print("=" * 70)
    print(f"🕵️  OPERATION ROGUE HORIZON: AUTOMATED LAB TESTER")
    print(f"Course: CSCI 340 - Database Systems & Forensics")
    print(f"Testing: Lab {lab_num:02d} ({folder_name})")
    
    if use_solution:
        print(f"Mode: INSTRUCTOR MASTER SOLUTION KEY VERIFICATION")
        queries, err = parse_solution_sql(lab_num)
    else:
        target_file = custom_file or os.path.join(LABS_DIR, folder_name, "student_queries.sql")
        print(f"Target File: {os.path.relpath(target_file, BASE_DIR)}")
        queries, err = parse_student_sql(target_file, lab_num)

    if err:
        print(f"❌ Error: {err}")
        print("=" * 70)
        return False

    validators = LAB_VALIDATORS.get(lab_num, {})
    expected_tasks = [f"{lab_num}.{i}" for i in range(1, 6)]

    # Use a temporary scratch copy of DB for DDL/DML isolation (Labs 8, 9, 10, 11)
    needs_isolated_db = lab_num in (8, 9, 10, 11)
    temp_db_path = None
    
    if needs_isolated_db:
        temp_fd, temp_db_path = tempfile.mkstemp(suffix=".db")
        os.close(temp_fd)
        shutil.copyfile(DB_FILE, temp_db_path)
        active_db = temp_db_path
    else:
        active_db = DB_FILE

    conn = sqlite3.connect(active_db)
    cursor = conn.cursor()

    passed_count = 0
    total_tasks = 5

    print("-" * 70)

    try:
        for t_num in expected_tasks:
            sql_query = queries.get(t_num, "").strip()
            print(f"\n[TASK {t_num}] Checking...")
            
            if not sql_query:
                print(f"  ❌ FAIL: No query found for Task {t_num}.")
                print(f"     Hint: Write your SQL query inside the Task {t_num} section in student_queries.sql.")
                continue

            validator = validators.get(t_num)
            if not validator:
                print(f"  ⚠️  WARNING: No validator defined for Task {t_num}.")
                continue

            try:
                # Handle scripts with multiple semicolons
                statements = [s.strip() for s in sql_query.split(";") if s.strip()]
                rows = []
                cols = []

                caught_expected_error = False
                for stmt in statements:
                    try:
                        cursor.execute(stmt)
                        if cursor.description:
                            cols = [d[0] for d in cursor.description]
                            rows = cursor.fetchall()
                    except sqlite3.IntegrityError as ie:
                        if t_num == "8.4":
                            caught_expected_error = True
                            break
                        else:
                            raise ie
                
                # Run custom validator
                if t_num == "8.4" and caught_expected_error:
                    passed, msg = True, "Constraint successfully rejected invalid data (CHECK constraint triggered as expected)."
                else:
                    passed, msg = validator(rows, cols, sql_query)
                if passed:
                    print(f"  ✅ PASS: {msg}")
                    passed_count += 1
                else:
                    print(f"  ❌ FAIL: {msg}")
            except Exception as e:
                print(f"  ❌ SYNTAX / RUNTIME ERROR: {str(e)}")
                print(f"     Executed SQL:\n     {sql_query[:100]}...")

    finally:
        conn.close()
        if temp_db_path and os.path.exists(temp_db_path):
            os.remove(temp_db_path)

    print("\n" + "=" * 70)
    score_pct = (passed_count / total_tasks) * 100
    print(f"📊 SUMMARY FOR LAB {lab_num:02d}: {passed_count}/{total_tasks} PASSED ({score_pct:.1f}%)")
    
    if passed_count == total_tasks:
        print("🏆 STATUS: ALL TESTS PASSED! READY FOR SUBMISSION!")
    else:
        print("⚠️  STATUS: SOME TESTS FAILED. Review the feedback and try again.")
    print("=" * 70 + "\n")

    return passed_count == total_tasks

def main():
    parser = argparse.ArgumentParser(description="Automated SQL Lab Tester for CSCI 340")
    parser.add_argument("-l", "--lab", type=int, help="Lab number to test (1 to 14)")
    parser.add_argument("--all", action="store_true", help="Run tests for all 14 labs")
    parser.add_argument("--solution", action="store_true", help="Run validator against instructor solution key")
    parser.add_argument("-f", "--file", type=str, help="Path to custom student SQL file")

    args = parser.parse_args()

    if args.all:
        print("\n🚀 Running Master Test Suite across all 14 labs...\n")
        all_passed = True
        for lab in range(1, 15):
            res = run_test_for_lab(lab, use_solution=args.solution)
            if not res:
                all_passed = False
        if all_passed:
            print("🌟 ALL 14 LABS PASSED WITH 100% SUCCESS!")
        else:
            print("⚠️  Some labs failed.")
    elif args.lab:
        run_test_for_lab(args.lab, use_solution=args.solution, custom_file=args.file)
    else:
        parser.print_help()

if __name__ == "__main__":
    main()
