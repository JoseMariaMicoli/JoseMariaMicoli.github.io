---
title: "Ghost-Pipeline: CI/CD Post-Exploitation Framework"
date: 2026-01-20
categories: ["pro-suite"]
series: ["Professional Suite"]
type: "posts"
cover: "images/Ghost_White.png"
coverCaption: "GHOST-PIPELINE OFFENSIVE MODULE"
draft: false
---

<div style="text-align: center; border: 1px solid #00e5ff; padding: 40px; margin-bottom: 50px; background-color: rgba(0, 229, 255, 0.05);">
  <img src="/images/ghost-hydra-ops.png" alt="GHOST-PIPELINE" style="width: 300px; max-width: 80%; margin-bottom: 30px;">
  <h1 style="color: #00e5ff; text-transform: uppercase; letter-spacing: 8px; margin-bottom: 10px; border: none;">TECHNICAL WHITE PAPER</h1>
  <p style="font-family: monospace; font-size: 1.2rem; margin: 0; color: #00e5ff;">MODULE: GHOST-PIPELINE</p>
  <p style="font-family: monospace; margin: 5px 0; color: #00e5ff;">RESEARCHER: J.M. MICOLI</p>
  <div style="border-top: 1px double #00e5ff; width: 60%; margin: 25px auto;"></div>
  <p style="color: #ff3e3e; font-weight: bold; letter-spacing: 2px;">[ CLASSIFIED: PRO-SUITE TRADEKRAFT ]</p>
</div>

<div style="text-align: left !important; color: #00e5ff !important; font-family: 'Courier New', monospace; margin-bottom: 40px; line-height: 1.4; width: 100%; display: block;">
  <p style="margin: 0;"><span style="color: #888;">[xoce@darkarch ~]$</span> ./ghost-hydra-suite --initialize</p>
  <p style="margin: 0;">> [ LOADED MODULES: 7/7 STABLE ]</p>
  
  <p style="margin: 0;"><span style="color: #888;">[xoce@darkarch ~]$</span> ghost-suite --check-integrity</p>
  <p style="margin: 0;">> SIGNATURE: Jose Maria Micoli (Verified)</p>
  
  <p style="margin: 0;"><span style="color: #888;">[xoce@darkarch ~]$</span> set --theme cyan-offensive</p>
  <p style="margin: 0;">> UI_THEME: #00e5ff_CYAN_REACTIVE</p>
  
  <p style="margin: 0;"><span style="color: #888;">[xoce@darkarch ~]$</span> ./transmiter.py --mode technical-whitepaper</p>
  <p style="margin: 0;">> [ STATUS >> READY FOR DATA DUMP... ]</p>
  <div style="border-bottom: 1px dashed #00e5ff; width: 100%; margin: 15px 0;"></div>
</div>

### 1. EXECUTIVE SUMMARY
[cite_start]Ghost-Pipeline is a sophisticated security research framework designed to audit the trust relationship between modern CI/CD environments and Cloud Service Providers[cite: 25]. [cite_start]By targeting ephemeral OpenID Connect (OIDC) identities rather than static secrets, Ghost-Pipeline demonstrates a critical shift in the attack surface of modern DevOps: **Identity is the new perimeter**[cite: 26].

#### CORE ATTACK VECTORS
* [cite_start]**Target**: OIDC/Cloud Ephemeral Identities[cite: 17].
* [cite_start]**The Vector**: Modern runners swap a GitHub JWT for short-lived cloud credentials[cite: 31].
* [cite_start]**The Gap**: Traditional scanners miss temporary JWTs generated in-memory during a build[cite: 32].

---

### 2. DEVELOPMENT LIFECYCLE (PHASES 0-5)

| PHASE | DESCRIPTION |
| :--- | :--- |
| **Phase 0: Research** | [cite_start]Researching the `AssumeRoleWithWebIdentity` API and OIDC/JWT vectors[cite: 32]. |
| **Phase 1: The Weaver** | [cite_start]A Go-based agent (static binary) that intercepts `$ACTIONS_ID_TOKEN_REQUEST_TOKEN`[cite: 34, 36]. |
| **Phase 2: AES-256-GCM** | [cite_start]Cryptographic integrity layer with a 32-byte auto-padding engine to bypass DLP scanners[cite: 37, 39]. |
| **Phase 3: Relay/C2** | [cite_start]An asynchronous Python/Flask "Mailbox" relay utilizing ngrok for encrypted tunneling[cite: 41, 42]. |
| **Phase 4: Triage Engine** | [cite_start]Automated log-sniffing for the `net/v1.0.4` signature to decrypt stolen identities in real-time[cite: 46, 47]. |
| **Phase 5: Recursive Sync** | [cite_start]Uses Linux `dd` for recursive chunking (50KB segments) to bypass HTTP log truncation[cite: 50, 51]. |



---

### 3. MITRE ATT&CK® MAPPING

| Tactic | Technique Name | ID | Implementation |
| :--- | :--- | :--- | :--- |
| **Initial Access** | Supply Chain Compromise | T1195.002 | [cite_start]Injecting weaver into the build process[cite: 57]. |
| **Credential Access** | Steal Application Access Token | T1528 | [cite_start]Intercepting the GitHub OIDC JWT[cite: 57]. |
| **Defense Evasion** | Obfuscated Information | T1027 | [cite_start]AES-256-GCM encryption in STDOUT logs[cite: 57]. |
| **C2** | Application Layer Protocol | T1071.001 | [cite_start]Using HTTPS Webhooks via ngrok[cite: 57]. |
| **Exfiltration** | Transfer Data to Cloud Account | T1537 | [cite_start]Moving stolen data to an attacker S3 bucket[cite: 57]. |

---

### 4. INCIDENT RESPONSE (IR) PLAYBOOK
If the signature `net/v1.0.4` is detected in CI/CD logs:

1.  [cite_start]**Immediate Revocation**: Use `aws iam put-role-policy` to deny all actions for the affected IAM Role[cite: 64].
2.  [cite_start]**Session Invalidation**: Terminate all active STS sessions associated with the OIDC provider[cite: 65].
3.  [cite_start]**Audit Workflows**: Search for unauthorized binary execution or modified YAML steps[cite: 66].
4.  [cite_start]**Harden OIDC Claims**: Restrict the `sub` claim in IAM Trust Policies to specific branches[cite: 67].

---

### 5. RULES OF ENGAGEMENT & LEGAL
* [cite_start]**Authorization**: Written permission is mandatory[cite: 72].
* [cite_start]**Cleanup**: Execute the `exit` command to purge relay buffers and local logs[cite: 74].
* **Disclaimer**: Ghost-Pipeline is provided "as-is" for authorized testing. [cite_start]The developer (**Jose Maria Micoli**) assumes no liability for illegal use[cite: 78].

---

### THE UNCOVER
> [cite_start]"SECURITY IS A PROCESS OF CONSTANT R&D. THE ADVERSARY IS ALWAYS BUILDING; WE MUST BUILD FASTER." [cite: 116, 117]

<div style="font-family: monospace; color: #00e5ff; background: rgba(0, 229, 255, 0.05); padding: 20px; border-right: 3px solid #00e5ff; text-align: right;">
  [xoce@darkarch ~]$ ghost-pipeline --detach --purge<br>
  > [ AUTHENTICATED BY: GHOST-HYDRA INT. ENGINE ]<br>
  > [ STATUS ] SIGNAL TERMINATED<br>
  _
</div>