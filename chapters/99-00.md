

# Appendix

## Common Command Comparison Table

| Task Category | Description | HP-UX Command(s) | SLES 16 Command(s) |
| :--- | :--- | :--- | :--- |
| **Service Control** | Start/Stop/Check Service Status | `init.d/<service> start` or `/sbin/init.d/net stop` | `systemctl start <service>` or `systemctl status sshd` |
| **Package Management** | Install a Package | `swinstall -x autoreboot=true -s /tmp/depot/pkgname` | `zypper install pkgname` |
| **Patch/System Update** | Apply all system patches | `swinstall` or `patchadd` | `zypper update` |
| **Process Monitoring** | View interactive process list | `top` or `glance` | `top` or `htop` |
| **CPU/Memory Stats** | View system resources | `sar -u` or `vmstat` | `sar -u` or `vmstat` (Output differences) |
| **Filesystem Status** | Check disk space usage | `bdf` (similar to `df`) | `df -h` |
| **LVM - Display VGs** | List Volume Groups | `vgdisplay` | `vgdisplay` (similar syntax, different implementation) |
| **Networking - IP** | View/Configure IP addresses | `ifconfig <interface>` | `ip a` or `ip addr show` |
| **Networking - Status** | View network connections | `netstat -rn` | `ss -tuln` (preferred) or `netstat -rn` |
| **Firewall Mgmt** | View or modify firewall rules | `ipfstat` (if using IPFilter) | `firewall-cmd --list-all` |
| **System Hostname** | View current hostname | `hostname` | `hostnamectl` or `hostname` |
| **System Log Review** | Check the system boot log | `tail /var/adm/syslog/syslog.log` | `journalctl -b` |


