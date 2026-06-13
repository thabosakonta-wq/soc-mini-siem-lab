SOC Mini SIEM Lab

Lightweight SOC (Security Operations Center) Mini SIEM Lab built in Bash for Linux and Termux environments.

Overview

This project demonstrates core SOC monitoring and incident detection concepts using shell scripting.

The lab simulates several Security Operations Center functions including:

- File Integrity Monitoring (FIM)
- Event Correlation
- Burst Detection
- Incident Logging
- Log Rotation
- Real-Time SOC Dashboard
- Alert Generation

Features

File Integrity Monitoring (FIM)

Detects file changes by monitoring hashes and identifying unauthorized modifications.

Event Correlation

Analyzes multiple security events and identifies suspicious patterns.

Burst Detection

Detects abnormal spikes in activity that may indicate attacks or misuse.

Incident Logging

Creates structured security logs for analysis and auditing.

Log Rotation

Automatically archives logs to prevent excessive storage consumption.

Real-Time Dashboard

Displays current security events and system status.

Technologies Used

- Bash
- Linux
- Termux
- SHA256 Hashing
- Log Analysis
- Shell Scripting
- Git
- GitHub

Project Structure

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

Running the Lab

Start the SOC monitoring environment:

bash run_soc.sh

Launch the dashboard:

watch -n 3 bash dashboard.sh

Screenshots

SOC Dashboard

"Dashboard" (screenshots/Dashboard.png)

Incident Log

"Incident Log" (screenshots/Incident%20Log.png)

Burst Detection

"Burst Detection" (screenshots/Burst%20Detection1.png)

"Burst Detection" (screenshots/Burst%20Detection2.png)

Learning Objectives

This project helps develop practical skills in:

- Security Monitoring
- Threat Detection
- Incident Response
- Log Analysis
- Linux Administration
- SOC Operations

Skills Demonstrated

- File Integrity Monitoring (FIM)
- Security Event Correlation
- Incident Detection
- Log Analysis
- Bash Scripting
- Linux Administration
- Threat Monitoring
- Security Operations Center (SOC) Concepts
- Git Version Control
- GitHub Repository Management

Example Use Cases

- Cybersecurity portfolio project
- SOC analyst practice lab
- SIEM concept demonstration
- Bash scripting practice
- Security monitoring exercises

Future Enhancements

- Email alerts
- Web dashboard
- Threat intelligence integration
- Automated response actions
- Cloud log collection
- MITRE ATT&CK mapping
- Microsoft Sentinel integration

Author

Thabo Sakonta

Aspiring Cybersecurity Professional | Microsoft SC-200 Certified | SOC Analyst | GRC Enthusiast

GitHub:
https://github.com/thabosakonta-wq

License

This project is released for educational and portfolio purposes.