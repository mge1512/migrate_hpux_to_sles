# Migrating from HP-UX to SLES 16.0

## SUSE Linux 16.0 Basics
* Official SUSE Documentation and Technical Resources
* Availability on different Hardware Architecture
* Quick Start: Two Paths to SLES 16

## The Architectural Divide (System Core & Philosophy)
* Init System and Service Management: From Sequence to Dependency
* The UsrEtc Revolution and Filesystem Hierarchy Divergence

## Daily Administration and Command Tools
* Package Management: SD-UX vs. Zypper and Cockpit
* Disk, LVM, and Filesystems (HP LVM/VxFS vs. Linux LVM/Btrfs/Snapper)
* Command Shells (sh/ksh vs. Bash)  
* Missing
	* System Management Tools (SMH/SAM vs. Cockpit)
	* Networking Configuration (Traditional vs. NetworkManager)

## Advanced Systems Management and Security
* Security and Access Control
* Logging and Auditing
* Clustering and High Availability: Serviceguard vs. Pacemaker
* Kernel Patching: Zero Downtime with kGraft
* Missing
	* Time Sync Services (ntpd vs. Chrony)

## Future-Proofing and Development Ecosystem
* Configuration Management: The Shift to IaC
* Dynamic Linking, Compilation, and Symbol Versioning: Itanium vs. x86-64
* Missing
	* Development Tools (Proprietary Compilers vs. GCC): Extended Development framework description
	* Virtualization/Containers (HPVM vs. KVM/Podman/Docker)
	* Monitoring & Performance (GlancePlus vs. Prometheus/Grafana)

