# Load Testing Project - JSONPlaceholder API

## Overview

This project contains API load testing implementation using **Locust** against:

https://jsonplaceholder.typicode.com

The purpose of this testing is to measure:

* API performance
* Response time
* Stability under concurrent users
* Failure rate during load testing

---

# Tools & Technologies

| Item     | Detail              |
| -------- | ------------------- |
| Tool     | Locust 2.44.0       |
| Language | Python              |
| Protocol | HTTPS               |
| API      | JSONPlaceholder API |

---

# Project Structure

```bash
load-testing/
│
├── locustfile.py
├── payloads.py
├── custom_listener.py
├── requirements.txt
├── README.md
│
├── reports/
│   └── load-test-report.html
│
└── venv/
```

---

# Test Scenario

## Endpoint Tested

| Method | Endpoint | Description     |
| ------ | -------- | --------------- |
| GET    | /posts   | Retrieve posts  |
| POST   | /posts   | Create new post |

---

# Load Configuration

| Parameter        | Value        |
| ---------------- | ------------ |
| Concurrent Users | 100          |
| Spawn Rate       | 10 users/sec |
| Duration         | 2 minutes    |
| Average RPS      | ~54 req/sec  |

---

# How To Run

## 1. Activate Virtual Environment

### Windows

```bash
venv\Scripts\activate
```

---

## 2. Install Dependencies

```bash
pip install -r requirements.txt
```

---

## 3. Run Locust with UI

```bash
locust -f locustfile.py
```

Open browser:

```text
http://localhost:8089
```

---

## 4. Run Headless Mode + Generate HTML Report

```bash
locust -f locustfile.py --headless -u 100 -r 10 -t 2m --host https://jsonplaceholder.typicode.com --html reports/load-test-report.html
```

---

# Test Result Summary

| Metric                | Result        |
| --------------------- | ------------- |
| Total Requests        | 6480          |
| Total Failures        | 0             |
| Failure Rate          | 0%            |
| Average Response Time | 265.6 ms      |
| Average RPS           | 54.14 req/sec |

---

# Performance Analysis

## GET /posts

* Stable performance
* Fast response time
* No failures detected

Average Response Time:

```text
203.68 ms
```

---

## POST /posts

* Slightly slower than GET
* Stable during load test
* No failures detected

Average Response Time:

```text
464.07 ms
```

---

# Conclusion

The API successfully handled:

```text
100 concurrent users
```

with:

* stable throughput
* zero failures
* acceptable response time

Overall, the system performed well under load testing conditions.

---

# Attachments

* locustfile.py
* payloads.py
* custom_listener.py
* load-test-report.html

---
