# 🖥️ SshCommandsRemoteServer

![Shell](https://img.shields.io/badge/Shell-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Use case](https://img.shields.io/badge/Use_Case-Imperva_DNS_Automation-8A2BE2?style=for-the-badge)

Run a **single command across multiple remote servers in one shot** — paste your server list, type the command, and the script SSHes into each device sequentially and executes it.

Built for Imperva DNS appliance administration, where repetitive CLI tasks (record changes, service checks, config updates) previously meant connecting to each device one at a time.

## 🔄 How It Works

```
  Paste server list ──► saved to list.txt
  Enter command      ──► stored
  Enter username     ──► stored
  Enter SSH key path ──► stored
          │
          ▼
  ┌──────────────────────────────┐
  │  loop over every server:     │
  │    ssh -i <key> user@server  │
  │    execute command           │
  └──────────────────────────────┘
          │
          ▼
  cleanup: list.txt removed
```

## ▶️ Usage

```bash
chmod +x MultipleImpervaCmdExecution.sh
./MultipleImpervaCmdExecution.sh
```

Then follow the prompts:

1. **Paste the server IPs** — one per line, finish with `Ctrl+D` (EOF)
2. **Enter the command** to run on each server
3. **Enter your username**
4. **Enter the path to your SSH private key**

Example session:
```
Enter the list
10.0.0.11
10.0.0.12
10.0.0.13
<Ctrl+D>
Enter the command to execute
show services status
Enter your username
admin
Enter your ssh key file with path
/home/user/.ssh/id_rsa
```

## ✨ Features

- **One command → N servers** — no more per-device logins
- **Key-based authentication** — no passwords in scripts or history
- **Self-cleaning** — temporary `list.txt` is deleted after the run
- **Per-server feedback** — each device is echoed as it's processed

## 📋 Requirements

- Bash on a Linux/macOS jump host
- SSH key-based access configured to all target servers

## ⚠️ Notes

- The script executes commands **sequentially** — devices that are unreachable will take as long as their SSH timeout.
- Originally written for **Imperva appliances**; the remote shell target (`admin`) may need adjusting for other platforms.

---

## About

Part of my network automation toolkit — see also [DhcpBulkMacReservation](https://github.com/Noel-Reeves-E/DhcpBulkMacReservation) and [ZPEupgrade](https://github.com/Noel-Reeves-E/ZPEupgrade).
