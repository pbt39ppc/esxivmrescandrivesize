#!/bin/bash
### https://serverfault.com/questions/306737/how-do-i-get-centos-vm-to-re-read-its-increased-disk-size-without-a-reboot
as root:
You need to issue the rescan command to your SCSI bus.

In VMware the SCSI controller might be found in some unusual place. First find it:

find /sys -iname 'scan'
For me that returned

/sys/devices/pci0000:00/0000:00:07.1/host0/scsi_host/host0/scan
/sys/devices/pci0000:00/0000:00:07.1/host1/scsi_host/host1/scan
/sys/devices/pci0000:00/0000:00:10.0/host2/scsi_host/host2/scan
Then just issue the rescan command

echo "- - -" >/sys/devices/pci0000:00/0000:00:07.1/host0/scsi_host/host0/scan
echo "- - -" >/sys/devices/pci0000:00/0000:00:07.1/host0/scsi_host/host1/scan
echo "- - -" >/sys/devices/pci0000:00/0000:00:10.0/host0/scsi_host/host2/scan
That should help. :)
