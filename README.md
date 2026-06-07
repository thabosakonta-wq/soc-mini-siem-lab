SOC Mini SIEM Lab

A lightweight Security Operations Center (SOC) simulation built in Bash and Termux.

Overview

This project simulates core Security Operations Center functionality using Bash scripting and Linux monitoring tools. It provides real-time file monitoring, event correlation, incident generation, burst attack detection, and dashboard reporting.

Features

- File Integrity Monitoring (FIM)
- Real-Time Event Monitoring
- Incident Correlation Engine
- Severity Classification
- Burst Attack Detection
- Live SOC Dashboard
- Log Rotation
- Cron-Based Automation
- Incident Tracking

Architecture

File Activity
      |
      v
 FIM Engine
      |
      v
 Event Correlator
      |
      v
 Incident Log
      |
      +----> Dashboard
      |
      +----> Alerting

Technologies

- Bash
- Linux
- Termux
- inotifywait
- Cronie

Detection Capabilities

Event Type| Severity
CREATE| LOW
MODIFY| LOW
DELETE| HIGH
Burst Activity| CRITICAL

Example Incident

2026-04-30 08:19:24 | INC-31 | CRITICAL | BURST DETECTED | FILE=burst.txt | SCORE=10

Dashboard Metrics

- Total Incidents
- Severity Breakdown
- Event Type Counts
- Top Target File
- Recent Activity
- Threat Status

Future Enhancements

- Email Alerting
- JSON Logging
- CSV Export
- Threat Intelligence Integration
- Web-Based Dashboard
- SIEM Integration

Learning Objectives

This project was built to strengthen practical skills in:

- Security Monitoring
- Incident Detection
- Linux Administration
- Bash Scripting
- SOC Operations
- Blue Team Concepts

Author

Thabo Sakonta

Cybersecurity Learning Project
