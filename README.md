# OSS Audit — 24BCE11085

> **Open Source Software Audit** | VITyarthi | OSS NGMC Course
---

## Student Information

| Field | Details |
|---|---|
| **Name** | Sparsh Patil |
| **Roll Number** | 24BCE11085 |
| **Slot** | A24 |
| **Date of Submission** | 31/03/26 |

---

## Chosen Software

**VLC Media Player** — A free, cross-platform multimedia player that can play almost any video format, licensed under GPL v2 and LGPL v2.1.

---

## Repository Structure
```
├── README.md
├── script1_system_identity.sh
├── script2_package_inspector.sh
├── script3_disk_permission_auditor.sh
├── script4_log_analyzer.sh
└── script5_manifesto_generator.sh
```

---

## Scripts Overview

### Script 1 — System Identity Report
**File:** `script1_system_identity.sh`  
**Description:** Grabs basic system info like the distro, kernel, uptime, and user, and formats it into a clean welcome screen. 
**Concepts Used:** Variables, `echo`, command substitution (`$()`), output formatting.

---

### Script 2 — FOSS Package Inspector
**File:** `script2_package_inspector.sh`  
**Description:** uses a case statement to print a quick note about what the package stands for.  
**Concepts Used:** `if-then-else`, `case` statement, `dpkg -l`, pipe with `grep`.

---

### Script 3 — Disk and Permission Auditor
**File:** `script3_disk_permission_auditor.sh`  
**Description:** Loops through a list of important system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`) and reports disk usage and owner/permission details for each. Also checks if the chosen software's config directory exists.  
**Concepts Used:** `for` loop, `df`, `ls -ld`, `awk`, `cut`.

---

### Script 4 — Log File Analyzer
**File:** `script4_log_analyzer.sh`  
**Description:** Reads a log file line by line, counts occurrences of a specified keyword (default: `error`), and prints a summary. Accepts the log file path and keyword as command-line arguments.  
**Concepts Used:** `while read` loop, `if-then`, counter variables, command-line arguments (`$1`, `$2`).

---

### Script 5 — Open Source Manifesto Generator
**File:** `script5_manifesto_generator.sh`  
**Description:** generates a custom text file with my open source manifesto based on the answers.  
**Concepts Used:** `read` for user input, string concatenation, file writing with `>` and `>>`, `date` command.

---

## How to Run the Scripts

### Prerequisites

- A Linux system (Tested on Ubuntu 24.04 via WSL)
- Bash shell (`bash --version` to verify)
- The chosen software package installed (for Script 2)

### Step 1 — Clone the Repository
```bash
git clone https://github.com/sparsh24bce11085/oss-audit-24BCE11085.git
cd oss-audit-24BCE11085
```

### Step 2 — Make All Scripts Executable
```bash
chmod +x *.sh
```

### Step 3 — Run Each Script

**Script 1 — System Identity Report**
```bash
./script1_system_identity.sh
```

**Script 2 — FOSS Package Inspector**
```bash
./script2_package_inspector.sh
```

**Script 3 — Disk and Permission Auditor**
```bash
./script3_disk_permission_auditor.sh
```

**Script 4 — Log File Analyzer**
```bash
./script4_log_analyzer.sh /var/log/syslog
```

**Script 5 — Open Source Manifesto Generator**
```bash
./script5_manifesto_generator.sh
```

---

## Dependencies

| Script | Dependencies | Install Command |
|---|---|---|
| Script 1 | `uname`, `uptime`, `whoami` | Pre-installed on all Linux systems |
| Script 2 | `dpkg`, `grep` | Pre-installed on all Linux systems |
| Script 3 | `du`, `ls`, `awk`, `cut` | Pre-installed on all Linux systems |
| Script 4 | `grep`, `tail` | Pre-installed on all Linux systems |
| Script 5 | `date`, `cat` | Pre-installed on all Linux systems |

> All scripts are written in standard Bash and have no external dependencies beyond a base Linux installation.

---

## License

This project was submitted as part of the **Open Source Software (OSS NGMC)** course at VIT. All shell scripts and written content are original work by Sparsh Patil.

---

*Submitted via the VITyarthi portal as part of The Open Source Audit Capstone Project.*
