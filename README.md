# Linux and Bash for Data Engineering — Duke University Coursework

This repository documents hands-on labs, automation scripts, and stream-processing pipelines developed as part of the **Linux and Bash for Data Engineering** course offered by Duke University.

---

## 📂 Repository Structure

```text
.
├── README.md
└── 01-shell-pipes-and-redirection/
    ├── server_logs.txt      # Raw ingestion log dataset
    ├── pipeline.sh          # Core Bash ETL & audit script
    └── report.txt           # Generated analytical audit report
```

---

## 🛠️ Lab 01: Shell Pipelines, Streams & Redirection

### 1. Overview
This module demonstrates an automated in-memory **Extract-Transform-Load (ETL)** pipeline designed to audit server activity logs. The pipeline filters critical anomalies, computes aggregate failure metrics, sorts incidents, and writes structured audit reports without requiring intermediate temporary disk files.

### 2. Core Concepts Applied

| Concept | Bash Implementation | Data Engineering Role |
| :--- | :--- | :--- |
| **Piping (`|`)** | `grep "ERROR" file | wc -l` | In-memory data streaming between processes |
| **Output Redirection (`>`)** | `echo "..." > report.txt` | Overwriting and initializing target destinations |
| **Output Appending (`>>`)** | `grep ... >> report.txt` | Telemetry logging and continuous record preservation |
| **Conditional Execution (`&&`)** | `[ -f file ] && command` | Strict pipeline step dependency validation |
| **Error Suppression (`2>/dev/null`)**| `... 2>/dev/null` | Discarding stream noise to maintain clean log output |
| **Stream Sorting (`sort -r`)** | `grep ... | sort -r` | Sorting records to surface the most recent failures |

---

### 3. Pipeline Workflow (`pipeline.sh`)

1. **Dependency Validation:** Verifies the existence of `server_logs.txt` prior to execution; silently handles missing file errors using `/dev/null`.
2. **Aggregation:** Evaluates incoming streams for `ERROR` markers and computes total incident counts via `wc -l`.
3. **Stream Transformation:** Isolates error events and sorts them in reverse order to identify patterns quickly.
4. **Audit Trail:** Appends completion timestamps (`date`) to ensure full operational traceability.

---

### 4. Reproduction & Execution

1. **Navigate to the module directory:**
   ```bash
   cd 01-shell-pipes-and-redirection
   ```

2. **Grant execution permissions:**
   ```bash
   chmod +x pipeline.sh
   ```

3. **Execute the pipeline:**
   ```bash
   ./pipeline.sh
   ```

4. **Verify the generated report:**
   ```bash
   cat report.txt
   ```

---

### 💻 Environment
- **Platform:** Linux (GitHub Codespaces / Cloud Environment)
- **Shell:** GNU Bash
- **Track:** Data Engineering
