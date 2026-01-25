
---
title: "[TRUST] Ghost-Pipeline: OIDC Trust Hijacking"
date: 2026-01-25
categories: ["pro-suite"]
tags: ["python", "go", "ci-cd", "oidc", "cryptography", "cloud-security"]
description: "A deep dive into CI/CD post-exploitation, OIDC identity interception, and recursive exfiltration mechanics."
---

### **🛡️ GHOST-PIPELINE: THE OIDC WEAVER**

```text
          .-.
         (o o)      ________  ___  ___  ________  _________  _________  
         | O |     |\   ____\|\  \|\  \|\   __  \|\   ____\|\___   ___\ 
          '-'      \ \  \___|\ \  \\\  \ \  \|\  \ \  \___|\|___ \  \_| 
         // \\      \ \  \  __\ \   __  \ \  \\\  \ \_____  \   \ \  \  
        //   \\      \ \  \|\  \ \  \ \  \ \  \|\  \|____|\  \   \ \  \ 
       //     \\      \ \_______\ \__\ \__\ \_______\____\_\  \   \ \__\
      //       \\      \|_______|\|__|\|__|\|_______|\_________\   \|__|
                                                       \|_________|        

      [ 2026 Offensive R&D Research Project ]
      [ AUTHOR: JOSE MARIA MICOLI (XOCE) ] 
      [ SYSTEM: DARKARCH LINUX ] 

```

> **Project Phase:** 🛰️ Cloud-Pivot: VERIFIED (Phase 7.1).
> **Research Status:** 🟢 STABLE v4.3.0 / RED TEAM R&D.
> **Core Principle:** 🕸️ Ephemeral Identity Interception & 🔄 Recursive Exfiltration.

---

### **📋 PROJECT DESCRIPTION 👻**

**Ghost-Pipeline v4.3.0** is a sophisticated CI/CD post-exploitation framework designed to audit the trust relationship between modern CI/CD environments (GitHub Actions) and Cloud Service Providers (AWS, Azure, GCP).

The project simulates a "Supply Chain Attack" where a malicious binary (the **Weaver**) is injected into a CI/CD pipeline. Instead of targeting static credentials, the framework intercepts the **short-lived OIDC JWT** provided to the runner. This token is encrypted with **AES-256-GCM** and leaked through build logs, disguised as benign dependency warnings. The C2 station then recovers this token, decrypts it, and "forges" temporary AWS credentials, allowing an attacker to pivot from a GitHub runner into a secure AWS cloud environment.

---

### ⚠️ **LEGAL & ETHICAL DISCLAIMER**

**Strictly for Educational and Authorized Security Testing Purposes.** Project Ghost-Pipeline is a CI/CD Post-Exploitation framework. The use of these tools against target environments without explicit, prior, and written authorization is illegal and unethical. The developers and maintainers assume **no liability** for any damage, data loss, or legal consequences resulting from the use or misuse of this software. By utilizing this framework, you agree to comply with all local and international cybersecurity laws.

---

## I. PROJECT ROADMAP & OPERATIONAL SPRINTS

| Sprint | Focus / Technical Deliverable | Status |
| --- | --- | --- |
| **Sprint 0** | **OIDC Trust Research:** Detailing `AssumeRoleWithWebIdentity`. | **DONE** |
| **Sprint 1** | **The Weaver:** Go-based static binary (Multi-distro support). | **DONE** |
| **Sprint 2** | **AES-256-GCM:** 32-byte Auto-Padding crypto engine. | **DONE** |
| **Sprint 3** | **Mailbox Relay:** Asynchronous Flask C2 with NGROK tunneling. | **DONE** |
| **Sprint 4** | **Red-CLI:** `rich`-powered terminal UI & Triage Engine. | **DONE** |
| **Sprint 5** | **Recursive Sync:** Foundation for log chunking & exfiltration. | **DONE** |
| **Sprint 6** | **Automation:** C2-integrated `aws_pivot` and clipboard sync. | **DONE** |
| **Sprint 7** | **Cloud Pivot:** Verified STS exchange and S3 transport. | **DONE** |
| **Sprint 8** | **Ghost-Monitor:** Headless watchdog & OPSEC Hardening. | **DONE** |
| **Sprint 9** | **Infra:** Recursive Chunking (Fix) for >1MB logs. | **PLANNED** |
| **Sprint 10** | **Cloud:** Universal Multi-Cloud Pivot (GCP/Azure). | **PLANNED** |

---

## II. THE 6-TIER ATTACK HIERARCHY

| Tier | Protocol | Stealth Method | Use Case |
| --- | --- | --- | --- |
| **1** | **OIDC-Trust** | Federated Identity | Bypassing static secret scanners. |
| **2** | **AEAD Crypto** | AES-256-GCM | Bypassing network-level DLP scanners. |
| **3** | **C2 Relay** | Ngrok Tunneling | Traversing NAT/Firewalls. |
| **4** | **Log Masking** | Benign Signatures | Hiding payloads (`net/v1.0.4`). |
| **5** | **Recurse Sync** | `dd` Offset Logic | Reassembling logs >1MB. |
| **6** | **Pivot-S3** | Forged STS | Atomic exfiltration to S3. |

---

## III. TECHNICAL WHITE PAPER: OIDC EXPLOITATION MECHANICS

### **1. Cloud Infrastructure & OIDC Trust**

This framework exploits the OIDC trust relationship between GitHub and AWS. The AWS IAM Role must be configured with a Trust Policy utilizing a **Federated Principal** (`token.actions.githubusercontent.com`) and the `sts:AssumeRoleWithWebIdentity` action. Compromising a pipeline in this architecture is equivalent to a physical breach of a legacy data center.

### **2. Mathematical Foundation: Recursive Chunking Logic**

To bypass size limitations where standard HTTP POST requests truncate logs over 1MB, Ghost-Pipeline utilizes a `dd` byte-offset algorithm.

Let  be total log size and  be chunk size (50KB). The number of required segments  is:

$$ N = \lceil S / c \rceil $$

Data is fetched via offset:

$$ O_i = (i-1) \times c \quad \text{for } i \in {1, \dots, N} $$

### **3. Cryptographic Integrity: 32-Byte Auto-Padding**

The AES-256-GCM implementation ensures the master key meets the required 256-bit entropy via sanitization:

$$ K_{sanitized} = Pad(K, 32) $$

### **4. Atomic Pivot-Exfiltration**

The framework utilizes **Atomic Command Chaining** to ensure credentials persist during transport within ephemeral runners. All high-entropy data exists only in volatile RAM, leaving a zero-disk footprint on the runner.

---

## IV. INDICATORS OF COMPROMISE (IoC)

* **Log Signature:** `net/v1.0.4` (Masked encrypted OIDC JWTs).
* **Process Name:** `kworker_system_auth` (Masqueraded Weaver agent).
* **Network:** `*.ngrok-free.dev` (Traffic to known ngrok relay endpoints).
* **AWS CloudTrail:** Unexpected `AssumeRoleWithWebIdentity` calls.

---

## V. DFIR RESPONSE (NIST SP 800-61 R3)

1. **Preparation:** Restrict OIDC trust policies with strict `sub` claim conditions.
2. **Detection:** Flag the `net/v1.0.4` signature in CI/CD pipeline outputs.
3. **Containment:** Apply an explicit `Deny *` policy to compromised IAM Roles and invalidate STS sessions.
4. **Post-Incident:** Analyze injection vectors (Pull Requests or compromised dependencies).

---

## VI. OPERATIONAL PROCEDURES (GHOST SHELL)

| Command | Description |
| --- | --- |
| **fetch_log** | Recursive sync of remote logs using `dd` math. |
| **triage** | Scans logs for signatures, decrypts, and caches JWT. |
| **aws_pivot** | Automates OIDC-to-AWS STS exchange. |
| **s3_exfil** | Atomic exfiltration to attacker S3 bucket. |

---

## VII. PROJECT STRUCTURE

```text
[xoce@darkarch] ~/Workspace/Ghost-Pipeline ⚡ tree
.
├── agent/                      # 🕸️ The Weaver (Go Source)
├── controller/                 # 📟 Red-CLI & Triage Engine (Python)
│   ├── ghost_shell.py          # ANSI-optimized terminal UI
│   └── relay_server.py         # Flask-based asynchronous mailbox
├── .github/workflows/          # ⚙️ CI/CD Workflows
└── dec.py                      # Core AES-256-GCM module

```

---

