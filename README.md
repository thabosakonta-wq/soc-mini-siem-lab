# SOC Mini SIEM Lab

Lightweight SOC (Security Operations Center) Mini SIEM Lab built in Bash for Linux and Termux environments.

---

## 📌 Overview

This project demonstrates core SOC monitoring and incident detection concepts using shell scripting.

It simulates several Security Operations Center functions including:

- File Integrity Monitoring (FIM)
- Event Correlation
- Burst Detection
- Incident Logging
- Log Rotation
- Real-Time SOC Dashboard
- Alert Generation

---

## 🚀 Features

### File Integrity Monitoring (FIM)
Detects file changes by monitoring hashes and identifying unauthorized modifications.

### Event Correlation
Analyzes multiple security events and identifies suspicious patterns.

### Burst Detection
Detects abnormal spikes in activity that may indicate attacks or misuse.

### Incident Logging
Creates structured security logs for analysis and auditing.

### Log Rotation
Automatically archives logs to prevent excessive storage consumption.

### Real-Time Dashboard
Displays current security events and system status.

---

## 🧰 Technologies Used

- Bash
- Linux
- Termux
- SHA256 Hashing
- Log Analysis
- Shell Scripting
- Git
- GitHub

---

## 📁 Project Structure

```text
SOC/
├── dashboard.sh
├── run_soc.sh
├── rotate_logs.sh
├── README.md
├── engine/
│   ├── fim_engine.sh
│   ├── correlation_engine.sh
│   └── incident_correlator.sh
├── logs/
│   ├── incidents.log
│   └── log_event.sh
├── rules/
├── screenshots/
├── docs/
└── examples/
```
#Author

Thabo Sakonta

Microsoft Certified Security Operations Analyst (SC-200)

GitHub: https://github.com/thabosakonta-wq

LinkedIn: https://www.linkedin.com/in/thabo-sakonta-377a3748

License

This project is provided for educational and portfolio purposes. 
