<div align="center">

# 🛡️ MobSecKit - Security Toolkit

<img src="https://img.shields.io/badge/Version-1.0.0-blue?style=for-the-badge" />
<img src="https://img.shields.io/badge/Security-Recon-red?style=for-the-badge" />
<img src="https://img.shields.io/badge/Shell-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white" />

<p align="center">
  <b>A comprehensive Bash-based utility for rapid network auditing, connectivity tracking, and service discovery.</b>
</p>

</div>

---

### 🌌 Detailed Technical Overview

**MobSecKit** is a specialized script designed to automate the initial phase of network reconnaissance. It focuses on identifying live hosts and auditing common service entry points using native system protocols.

### 🚀 Core Functionalities

* **Connectivity Validation (`check_target`)**: Uses ICMP Echo Requests (Ping) to verify if a target IP or Domain is active before proceeding with scans.
* **TCP Port Auditing (`check_port`)**: Utilizes `/dev/tcp` socket handling to perform lightweight connection attempts without needing heavy external scanners like Nmap.
* **Public Identity Check**: Integrated `curl` request to `ifconfig.me` to retrieve and display your current external network gateway.
* **Automated Scan Sequence**: 
    * Prompts for target input.
    * Validates connectivity status.
    * Iterates through a predefined array of critical ports.

---

### 🛠️ Port Audit Scope

The tool specifically targets the following standard service ports:

| Port | Service | Protocol | Function |
| :--- | :--- | :--- | :--- |
| **21** | FTP | TCP | File Transfer Protocol |
| **22** | SSH | TCP | Secure Shell Remote Access |
| **23** | Telnet | TCP | Unencrypted Remote Terminal |
| **80** | HTTP | TCP | Standard Web Traffic |
| **443** | HTTPS | TCP | Secure Web Traffic (TLS/SSL) |
| **3306** | MySQL | TCP | Database Management System |
| **8080** | HTTP-Proxy | TCP | Alternative Web/Proxy Services |

---

### ⚙️ System Requirements & Logic

The script is optimized for low-overhead environments:
* **Shell**: Bash 4.0+
* **Connectivity**: Requires `ping` binary.
* **Web Requests**: Requires `curl` installed for IP lookups.
* **Network Logic**: Uses built-in Bash TCP pseudo-devices for port checking, making it stealthier than traditional scanners.

### 📥 Setup & Execution

1.  **Grant Execution Rights**:
    ```bash
    chmod +x mob.sh
    ```

2.  **Run the Toolkit**:
    ```bash
    ./mob.sh
    ```

---

### ⚠️ Disclaimer

> [!CAUTION]
> This tool is strictly for **educational and authorized security testing**. Unauthorized scanning of networks is a violation of various international cyber laws. The author, **Norct**, is not responsible for any misuse.

---

<div align="center">

**Developed by [norct](https://github.com/Unjou) 👾** *Fullstack Developer | Game Localization Translator | Security Enthusiast*

</div>
