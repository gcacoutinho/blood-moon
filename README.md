<img width="4128" height="1024" alt="A wide panoramic landscape bathed entirely in deep red and crimson hues. In the upper left, a large, glowing blood moon hangs in a starry night sky with wispy clouds. In the left foreground, four silhouetted figures in long cloaks stand on the edge of a rocky cliff, gazing out over a vast, desolate mountain valley. On the right side, the rocky cliff faces feature subtle, geometric, grid-like carvings that faintly resemble data patterns or circuitry blending into the stone. In the distance, a solitary watchtower sits atop a sharp mountain peak." src="https://github.com/user-attachments/assets/f3b51260-37f0-498f-85a4-b85fadc89337" />

# Blood Moon

Blood Moon is a Nix flake that provides a penetration testing dev shell with a curated toolset.

The goal is simple: run `nix develop` and get a practical security testing environment that is reproducible and easy to reuse.

This is mostly a personal project, but it is public and intended to be useful to others.

## Why the name?

`Blood Moon` comes from:

- **Blood**: the "Red" in red team and RedNix (an inspiration for this project)
- **Moon**: from Nyx (night)

## Quick Start

Prerequisites:

- Nix installed
- Flakes enabled

Enter the environment:

```bash
nix develop
```

## Included Tools

The dev shell currently includes tools across recon, exploitation, web testing, and utilities.

- **Core security tools:** `metasploit`, `msfpc`, `sqlmap`, `nikto`, `gobuster`, `ffuf`, `responder`
- **Network and recon:** `nmap`, `hping`, `netcat`, `tcpdump`, `whois`, `dnsrecon`, `dnsenum`, `nbtscan`, `nbtscanner`, `enum4linux`
- **Analysis and cracking:** `wireshark`, `termshark`, `hashcat`, `hashcat-utils`, `john`, `exploitdb`, `go-exploitdb`
- **Access and connectivity:** `openvpn`, `freerdp`, `openssh`, `samba`, `socat`, `mitmproxy`
- **Scripting and development:** `python3`, `ruby`, `perl`, `gdb`, `jq`, `ripgrep`, `curl`, `wget`, `git`, `unzip`, `htop`

## Optional Packages

Some packages are intentionally opt-in:

- **Unfree packages** (set `ALLOW_UNFREE=1`): `unrar`, `burpsuite`
- **Broken packages** (set `ALLOW_BROKEN=1`): `tigervnc`, `bettercap`

Examples:

```bash
ALLOW_UNFREE=1 nix develop
ALLOW_BROKEN=1 nix develop
```

Broken packages can fail to evaluate or build depending on the current `nixpkgs` state.

## Platform Support

At the moment, the dev shell is defined for `aarch64-darwin`.

## Working With This Repository

For setup and usage, this README is the main reference.

If you are less familiar with Nix, `AGENTS.md` can help with practical context while working in this repo. It contains concise project guidance (tooling and workflow conventions) that can make it easier to understand how things fit together across the broader repository.

## Legal and Ethical Use

Use these tools only on systems you own or are explicitly authorized to test.

You are responsible for complying with all applicable laws and policies.
