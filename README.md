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
    ├── lvs1.png
    ├── lvs.png
    └── mounted_lv.png
# Part 2: Logical Volume Extension

## Objective

After creating and mounting the Logical Volume, the next task is to increase the available storage space without affecting existing data.

## Checking Available Space

Verify the current status of the Volume Group and Logical Volume.

vgs
lvs
df -h

Example Output:

VG      VSize   VFree
vgdata  10.00g  8.00g

The `VFree` column shows the amount of free space available for extending the Logical Volume.

## Extending the Logical Volume

Increase the size of the Logical Volume by 2 GB.

lvextend -L +2G /dev/vgdata/lvbackup

Verify the new Logical Volume size:

lvs

## Extending the Filesystem

### For XFS Filesystems

xfs_growfs /backup

### For EXT4 Filesystems

resize2fs /dev/vgdata/lvbackup

## Verifying the Changes

Check the updated filesystem size:

df -h

Example:

Before Extension: 2G
After Extension : 4G

## LVM Extension Workflow

1. Verify available free space in the Volume Group.
2. Extend the Logical Volume using `lvextend`.
3. Resize the filesystem using `xfs_growfs` or `resize2fs`.
4. Verify the new storage capacity using `df -h`.

## Commands Used

vgs
lvs
df -h
lvextend -L +2G /dev/vgdata/lvbackup
xfs_growfs /backup
resize2fs /dev/vgdata/lvbackup


## Skills Demonstrated

* Logical Volume Management (LVM)
* Storage Expansion
* Filesystem Resizing
* Capacity Management
* Linux Storage Administration
* Online Storage Growth


## Author

Nandana Mohan J

