#!/bin/bash

## Linux LVM Storage Management

## Author: Nandana Mohan J

echo "Starting LVM Setup"

# Create Physical Volume

pvcreate /dev/sdb

# Create Volume Group

vgcreate vgdata /dev/sdb

# Create Logical Volume

lvcreate -L 2G -n lvbackup vgdata

# Create XFS Filesystem

mkfs.xfs /dev/vgdata/lvbackup

# Create Mount Point

mkdir -p /backup

# Mount Logical Volume

mount /dev/vgdata/lvbackup /backup

# Display LVM Information

echo ""
echo "Physical Volumes:"
pvs

echo ""
echo "Volume Groups:"
vgs

echo ""
echo "Logical Volumes:"
lvs

echo ""
echo "Mounted Filesystems:"
df -h

echo ""
echo "LVM setup completed successfully."

