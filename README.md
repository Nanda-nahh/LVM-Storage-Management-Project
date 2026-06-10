# Linux LVM Storage Management

## Project Overview

This project demonstrates the implementation of Linux Logical Volume Manager (LVM) for flexible storage management. The lab covers the creation of Physical Volumes (PV), Volume Groups (VG), Logical Volumes (LV), filesystem creation, and mounting storage for use by the system.

## Objectives

* Create and manage Physical Volumes (PV)
* Create and manage Volume Groups (VG)
* Create and manage Logical Volumes (LV)
* Format logical volumes with the XFS filesystem
* Mount storage and verify availability
* Understand the LVM storage hierarchy

## Environment

* Operating System: RHEL / Rocky Linux / CentOS
* Storage Technology: LVM (Logical Volume Manager)
* Filesystem: XFS

## LVM Architecture

Physical Disk (/dev/sdb)
        │
        ▼
Physical Volume (PV)
        │
        ▼
Volume Group (VG)
        │
        ▼
Logical Volume (LV)
        │
        ▼
XFS Filesystem
        │
        ▼
Mount Point (/backup)

## Implementation Steps

### 1. Verify Available Disks

lsblk

### 2. Create Physical Volume

pvcreate /dev/sdb

### 3. Create Volume Group

vgcreate vgdata /dev/sdb

### 4. Create Logical Volume

lvcreate -L 2G -n lvbackup vgdata

### 5. Create XFS Filesystem

mkfs.xfs /dev/vgdata/lvbackup

### 6. Create Mount Point

mkdir -p /backup

### 7. Mount Logical Volume

mount /dev/vgdata/lvbackup /backup

### 8. Verify Configuration

pvs
vgs
lvs
df -h

## Validation

The following checks were performed:

* Physical Volume created successfully
* Volume Group created successfully
* Logical Volume created successfully
* XFS filesystem created successfully
* Logical Volume mounted successfully
* Storage accessible through `/backup`

## Skills Demonstrated

* Linux System Administration
* Storage Management
* Logical Volume Manager (LVM)
* Physical Volumes (PV)
* Volume Groups (VG)
* Logical Volumes (LV)
* XFS Filesystem Administration
* Disk Provisioning and Mounting

## Project Structure

Linux-LVM-Storage-Management/
│
├── README.md
├── lvm_setup.sh
└── screenshots/
    ├── lsblk.png
    ├── pvs.png
    ├── vgs.png
    ├── lvs.png
    └── mounted_lv.png

## Author

Nandana Mohan J
Linux System Administration Learning Project

