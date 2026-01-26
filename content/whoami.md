---
title: "WHOAMI"
date: 2026-01-26
layout: "single"
showFullContent: true
---

<style>
    /* Targeting the specific container to ensure override */
    #single-post-container .term-user { color: #00ff41 !important; font-weight: bold; }
    #single-post-container .term-at { color: #666666 !important; }
    #single-post-container .term-host { color: #ff3e3e !important; font-weight: bold; }
    #single-post-container .term-path { color: #ffffff !important; }
    
    /* Hide the default layout header if it conflicts */
    .terminal-window > .terminal-header:first-of-type { display: none; }
</style>

<div class="terminal-header" style="display: block !important;">
    <div style="margin-bottom: 5px;">
        <span class="term-user">xoce</span><span class="term-at">@</span><span class="term-host">darkarch</span>
        <span class="term-path">:~#</span> <span style="color: #00e5ff;">whoami --identity-split --detail</span>
    </div>
    <div style="color: #00ff41;">> ACCESSING_PERSONA_DATABASE...</div>
    <div style="color: #00ff41;">> IDENTITY_STATE: [ JOSÉ MARÍA MICOLI ] ⇌ [ OPERATOR XOCE ]</div>
    <div style="border-bottom: 1px dashed #00ff41; margin: 15px 0;"></div>
</div>


## I. THE CORE DUALITY

### THE GHOST: OPERATOR XOCE
**STATUS:** `NON-ATTRIBUTABLE` // **OPERATIONAL PHILOSOPHY:** `CONSTANT_AGGRESSIVE_RD`

Within the noise of the wire, I am **Operator Xoce**. I am the manifestation of the **"Ghost Factor."** My approach is born from the belief that security is never a static product; it is a relentless pursuit of the invisible. 

In my [Ghost-Hydra Manifesto](/posts/manifesto), I posit that when defense builds a wall, the standard auditor looks for a crack. I do not. I study the **"chemistry of the bricks"**—the fundamental logic and binary composition of the system—to make the entire structure evaporate. I operate in the spaces between protocols, weaponizing OIDC trust and hiding inside gRPC traffic, ensuring that the tradecraft is indistinguishable from the system itself.

### THE ARCHITECT: JOSÉ MARÍA MICOLI
**REAL-WORLD ROLE:** Senior Red Team Operator & Offensive Security R&D Engineer

Behind the mask, I am a technical authority bridging the chasm between deep-tier offensive research and high-fidelity defense. With over a decade entrenched in the high-stakes financial sector (**ICBC, BANCOR, Grant Thornton**), I have mastered the industry standards not to follow them, but to transcend them.

I translate the aggressive R&D of the "Ghost" into strategic, Executive-level risk intelligence. My goal is to force the industry to move faster by building the very tools—custom C2 frameworks, reporting engines, and ransomware simulators—that reveal exactly where the Blue Team is truly blind.

---

## II. PROFESSIONAL EXPERIENCE: THE HYDRA PHILOSOPHY

I operate under the **"Hydra Philosophy"**: any attack with a single vector is a pre-calculated failure. My engineering focuses on **Persistence through Redundancy**. Like the mythic beast, my tradecraft is multi-headed; if a SOC severs one C2 channel, the "Ghost" remains active through secondary gRPC streams or hijacked OIDC trust. 

## III. TECHNICAL DRILL: THE 7-TOOL 4D INFILTRATION

I execute engagements through a research-driven cycle I call **4D Infiltration**:

1.  **Shadow Mapping:** Utilizing `VaporTrace` for surgical API discovery of "forgotten" endpoints.
2.  **Initial Access & Identity Hijack:** Neutralizing MFA by weaponizing OIDC trust through `Ghost-Pipeline`.
3.  **Persistence & Evasion:** Deploying `Hydra-C2` for stealthy communication and `Hydra-Worm` to automate lateral movement.
4.  **Impact & Intelligence:** Simulating the end-game with `APEX-PRO` to audit IR readiness, delivered via `VectorVue`.



---

## ⚙️ TECHNICAL CORE & ADVERSARIAL R&D

### 🛡️ Offensive Engineering & Adversary Emulation
* **Custom Tradecraft:** Architecting stealth agents in **Rust** and high-concurrency C2 orchestrators in **Go** to bypass EDR/XDR behavioral heuristics and kernel hooks.
* **Temporal Evasion:** Implementing **NHPP-based stochastic jitter** and non-standard protocol tunneling (DNS, ICMP, gRPC) for resilient, low-observable persistence.
* **Active Directory & Infrastructure:** On-prem AD exploitation (Kerberoasting, GPO, Bloodhound), Azure AD/Entra ID identity hijacking, and Network/VLAN pivoting.
* **Offensive R&D:** Deep-tier Binary Analysis & Reverse Engineering of closed-source drivers and binaries to identify zero-day vulnerabilities or bypass security hooks.

### 🌐 AppSec, Web & Cloud Surface Discovery
* **API Security Research:** Specialist in Shadow API mining and bypass of modern **OIDC/OAuth2** trust models (REST/GraphQL), fully aligned with **OWASP Top 10 API:2023** (BOLA, BFLA, Broken Authentication).
* **Web & Cloud:** High-fidelity testing of Web Applications (aligned with OWASP Top 10 and ASVS) and Cloud-native environments (AWS/Azure/GCP), including CI/CD pipeline auditing (GitHub Actions/OIDC hijacking).
* **Mobile Security & Reverse Engineering:** Expert Android Pentesting, specializing in APK/SDK reverse engineering (**JADX, Ghidra**), bypassing SSL pinning, and native C++ code analysis to identify memory corruption or hardcoded secrets.

---

## 📝 REPORTING PHILOSOPHY & THREAT INTEL

Every engagement is concluded with high-impact technical and executive documentation strictly following the **NIST SP 800-61 R3 lifecycle**. My reports bridge the gap between exploitation and remediation by providing:

* **MITRE ATT&CK Mapping:** Every finding is cross-referenced with specific Tactics and Techniques to help the SOC identify detection gaps.
* **OWASP Risk Scoring:** Web and API vulnerabilities are prioritized using OWASP Top 10 and API:2023 risk impact assessments.
* **Comprehensive IoC Tables:** Every mission includes a detailed table of Indicators of Compromise (IoCs) to facilitate rapid **Containment, Eradication, and Recovery**.



### 🔍 COMPREHENSIVE IoC TABLES
| ARTIFACT TYPE | SPECIFICATION | PURPOSE |
| :--- | :--- | :--- |
| **Network Signatures** | C2 Jitter, DNS patterns, gRPC noise | Pattern-based detection audit |
| **System Artifacts** | SHA-256 Hashes of custom agents | Integrity & EDR alert validation |
| **Identity Trails** | OIDC/Session token usage logs | IAM & Zero-Trust audit |

---

## 🎓 EDUCATION & LANGUAGES
* **🎓 B.S. Telecommunications Engineering** | IUA FRC | In Progress
* **📜 Certifications:** 
    * **APISec University:** ASCP API Security Certified Professional - API Pentesting
    * **Fortinet:** NSE4 FortiGate Security 7.2 & Infrastructure 7.2
    * **Sophos:** Certified Firewall v18.5 Engineer - Sophos Central Email Support
    * **CISCO:** CCNA R&S - Cisco Certified Network Associate
* **🗣️ Languages:** 
    * **English:** EFSET Certificate 65/100 (C1 Advanced)
    * **Spanish:** Native
    * **Portuguese:** Native
    * **Russian:** A1 - Learning

---
## 📡 SECURE COMMUNICATION CHANNELS

To initiate a secure exchange or request technical consultation, utilize the following non-attributable channel. All communications are treated with the **Hydra-Redundancy** protocol.

### PRIMARY DIRECTIVE: ENCRYPTED UPLINK
* **EMAIL:** [ghost-hydra@proton.me](mailto:ghost-hydra@proton.me)
* **ENCRYPTION:** `PGP_REQUIRED` (Proton-to-Proton native encryption active)
* **STATUS:** `MONITORED_IN_SHADOW_MODE`

> **OPERATOR NOTE:** For high-sensitivity intelligence disclosure, ensure the subject line follows the `[INTEL-ID: XXXX]` format to bypass automated noise filters.

---

<div class="terminal-footer" style="margin-top: 50px;">
    <div style="border-top: 1px dashed #00ff41; padding-top: 15px;"></div>
    <div style="margin-bottom: 5px;">
        <span class="term-user">xoce</span><span class="term-at">@</span><span class="term-host">darkarch</span>
        <span class="term-path">:~#</span> <span style="color: #666;">rm -rf /tmp/session_logs</span>
    </div>
    <div style="color: #666;">DELETING_TRACE_DATA... DONE.</div>
    <div style="color: #666;">[ SESSION_TERMINATED ]</div>
</div>