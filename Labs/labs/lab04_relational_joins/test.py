#!/usr/bin/env python3
import os, sys
base_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
sys.path.insert(0, base_dir)
from test_runner import run_test_for_lab

if __name__ == '__main__':
    ok = run_test_for_lab(4)
    sys.exit(0 if ok else 1)
