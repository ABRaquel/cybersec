#!/bin/bash
#available memory
free -h > ~/backups/freemem/free_mem.txt
#list of open files
sudo lsof /dev/null > ~/backups/openlist/open_list.txt
#free disk space
df -h /dev/sda1 > ~/backups/freedisk/free_disk.txt
#disk use output
sudo du -kh / | sort -h > ~/backups/diskuse/disk_usage.txt