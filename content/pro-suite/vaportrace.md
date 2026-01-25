---
title: "[API] VaporTrace: Surgical API Exploitation Suite"
date: 2026-01-24
categories: ["pro-suite"]
tags: ["go", "api-security", "red-team", "exploitation", "bola"]
description: "A high-performance Go framework for surgical reconnaissance and logic exploitation of modern API architectures."
---

<div class="terminal-header-line"></div>

### **📡 VAPORTRACE: SURGICAL API EXPLOITATION**

```text
    __  __                         _____                    
    \ \ / /___  _ __  ___  _ __   |_   _| __ __ _  ___ ___ 
     \ V // _ `| '_ \/ _ \| '__|    | || '__/ _` |/ __/ _ \
      \  / (_| | |_)  (_) | |       | || | | (_| | (_|  __/
       \/ \__,_| .__/\___/|_|       |_||_|  \__,_|\___\___|
               |_|      [ Surgical API Exploitation Suite]

```

> **Framework Profile:** High-performance reconnaissance and exploitation of REST/Microservices.
> **Core Specialization:** Shadow API discovery, BOLA/BFLA analysis, and attack surface mapping.
> **Language:** Golang (Concurrency-focused, statically linked).

---

### **📋 THE TACTICAL SHELL: PERSISTENCE & CONTEXT**

The **VaporTrace Shell** is the core differentiator, providing a **Persistent Security Context** required for complex logic testing. Unlike one-shot tools, the shell maintains a global state for `Attacker` and `Victim` tokens, automatically handling "Identity Swaps" during probes.

* **Identity Management:** Configure tokens once; the engine handles the swapping.
* **Real-time Triage:** Integrated `pterm` tables provide immediate feedback on 403 (Blocked), 404 (Missing), or 200 (Leaked) status codes.

---

## I. STRATEGIC ROADMAP (PHASES 1-10)

VaporTrace follows a multi-phase development cycle, currently moving into automated exfiltration:

* **Phase 1-2 (Foundation & Discovery):** Cobra CLI engine, JS route scraping, and OpenAPI ingestion.
* **Phase 3-4 (Authorization & Injection):** BOLA/BOPLA probers and resource exhaustion (API4).
* **Phase 5-7 (Intelligence & Logic):** SQLite persistence, timing attacks, and state-machine mapping.
* **Phase 8-9 (Exfiltration & Engineering):** Automated PII scanning and industrial-scale concurrency engines.
* **Phase 10 (Future):** AI-driven fuzzing and auto-exploit PoC generation.

---

## II. MITRE ATT&CK® MAPPING

| Phase | Tactic | Technique | Component |
| --- | --- | --- | --- |
| **Discovery** | Reconnaissance | T1595.002: Active Scanning | `map`, `swagger`, `mine`. |
| **Discovery** | Reconnaissance | T1592: Victim Info | `pipeline` categorization. |
| **Auth Logic** | Privilege Escalation | T1548: Abuse Elevation | `bola --pipeline`. |
| **Injection** | Impact | T1499: Endpoint DoS | `resource-exhaustion`. |
| **Standardization** | Exfiltration | T1071.001: Web Protocols | `SafeDo` Universal Mirroring. |

---

## III. FULL COMMAND REFERENCE

### **Identity & Reconnaissance**

* **`auth <role> <token>`**: Set identity tokens (JWT/Cookies) in the session store.
* **`map -u <url>`**: Execute full Phase 2 Recon and endpoint mapping.
* **`scrape <url>`**: Extract hidden API paths from client-side JavaScript bundles.
* **`proxy <url>`**: Route all tactical traffic through an intercepting proxy (e.g., Burp Suite).

### **Logic Exploitation**

* **`bola <url> <id>`**: Execute a live BOLA ID-swap probe (API1).
* **`bopla <url> <json>`**: Execute Mass Assignment / BOPLA fuzzing (API3).
* **`bfla <url>`**: Execute Method Shuffling / Verb Tampering (API5).
* **`flow race <id> <threads>`**: High-concurrency synchronized TOCTOU attack.

### **Verification & Reporting**

* **`test-bola` / `test-ssrf**`: Run logic verification against test engines.
* **`loot`**: Scan response bodies for sensitive data (Credit Cards, SSN, JWTs).
* **`report`**: Generate a classified Markdown/PDF "Mission Debrief".

---

### **🛡️ RULES OF ENGAGEMENT (ROE)**

1. **Authorization:** Never use VaporTrace without explicit written permission.
2. **Logic Risk:** Automated probing can modify server-side data; always use staging environments.
3. **No Liability:** Contributors assume no responsibility for misuse or data loss.

> **STATUS:** STABLE v9.10 **DOC_ID:** VT-TECHNICAL-README-2026.

---
