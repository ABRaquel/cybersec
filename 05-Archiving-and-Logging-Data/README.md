## Week 5 Homework Submission File: Archiving and Logging Data

Please edit this file by adding the solution commands on the line below the prompt.

Save and submit the completed file for your homework submission.

---

### Step 1: Create, Extract, Compress, and Manage tar Backup Archives

1. Command to **extract** the `TarDocs.tar` archive to the current directory:
> `tar xvvf TarDocs.tar` -- vv flag added for increased verbosity.

2. Command to **create** the `Javaless_Doc.tar` archive from the `TarDocs/` directory, while excluding the `TarDocs/Documents/Java` directory:
> `tar -cvvf Javaless_Docs.tar --exclude='TarDocs/Documents/Java' TarDocs/`

3. Command to ensure `Java/` is not in the new `Javaless_Docs.tar` archive:
> `tar -tvvf Javaless_Docs.tar | grep "Java"`

**Bonus**
- Command to create an incremental archive called `logs_backup_tar.gz` with only changed files to `snapshot.file` for the `/var/log` directory:
> `sudo tar czvvf logs_backup.tar.gz --listed-incremental=snapshot_logs_backup.snar --level=0 /var/log`

#### Critical Analysis Question

- Why wouldn't you use the options `-x` and `-c` at the same time with `tar`?
> The **-x** flag will extract the contents of a tar file, while **-c** flag is to create a tar file. Those can't be combined, either we create or we extract.

---

### Step 2: Create, Manage, and Automate Cron Jobs

1. Cron job for backing up the `/var/log/auth.log` file:
> `0 6 * * 3 sudo tar czvvf auth_backup.tgz /var/log/auth.log >/dev/null 2>&1`

---

### Step 3: Write Basic Bash Scripts

1. Brace expansion command to create the four subdirectories:
>`mkdir -p ~/backups/{freemem,diskuse,openlist,freedisk}`

2. Paste your `system.sh` script edits below:

```bash
    #!/bin/bash
    #available memory
    free -h > ~/backups/freemem/free_mem.txt
    #list of open files
    sudo lsof /dev/null > ~/backups/openlist/open_list.txt
    #free disk space
    df -h /dev/sda1 > ~/backups/freedisk/free_disk.txt
    #disk use output
    sudo du -kh / | sort -h > ~/backups/diskuse/disk_usage.txt
 ```

3. Command to make the `system.sh` script executable:
> `chmod +x system.sh`

**Optional**
- Commands to test the script and confirm its execution:
> * To execute the script > `./system.sh`
> * To verify output > `ls -l backups/*`
> * Check contents > `head backups/*`

**Bonus**
- Command to copy `system` to system-wide cron directory:
> `sudo cp system /etc/cron.weekly`

![System Cron](/05-Archiving-and-Logging-Data/screenshots/system_cron.png)

---

### Step 4. Manage Log File Sizes

1. Run `sudo nano /etc/logrotate.conf` to edit the `logrotate` configuration file.

    Configure a log rotation scheme that backs up authentication messages to the `/var/log/auth.log`.

- Add your config file edits below:

```bash
    /var/log/auth.log {
    rotate 7  
    weekly
    notifempty
    delaycompress
    missingok  
}
```
    
---

### Bonus: Check for Policy and File Violations

1. Command to verify `auditd` is active:
> `systemctl status auditd`

2. Command to set number of retained logs and maximum log file size:
> `sudo nano /etc/audit/auditd.conf`

- Add the edits made to the configuration file below:

```bash
    #
    # This file controls the configuration of the audit daemon
    #
    local_events = yes
    write_logs = yes
    log_file = /var/log/audit/audit.log
    log_group = adm
    log_format = RAW
    flush = INCREMENTAL_ASYNC
    freq = 50
    max_log_file = 35
    num_logs = 7
    priority_boost = 4
    disp_qos = lossy
    dispatcher = /sbin/audispd
    name_format = NONE
```

3. Command using `auditd` to set rules for `/etc/shadow`, `/etc/passwd` and `/var/log/auth.log`:
>`sudo nano /etc/audit/rules.d/audit.rules`

  - Add the edits made to the `rules` file below:

```bash
-w /etc/shadow -p wra -k hashpass_audit
-w /etc/passwd -p wra -k userpass_audit
-w /var/log/auth.log -p wra -k authlog_audit
```

4. Command to restart `auditd`:
>`sudo systemctl restart auditd`

5. Command to list all `auditd` rules:
>`sudo auditctl -l`

6. Command to produce an audit report:
>`sudo aureport -au`

7. Create a user with `sudo useradd attacker` and produce an audit report that lists account modifications:
> `sudo aureport -m`

![aureport](/05-Archiving-and-Logging-Data/screenshots/auditd-m.png)

8. Command to use `auditd` to watch `/var/log/cron`:
>`sudo auditctl -w /var/log/cron`

9. Command to verify `auditd` rules:
>`sudo auditctl -l`

---

### Bonus (Research Activity): Perform Various Log Filtering Techniques

1. Command to return `journalctl` messages with priorities from emergency to error:
>`journalctl -p 3 -b` or `sudo journalctl -b -p emerg..err`

1. Command to check the disk usage of the system journal unit since the most recent boot:
>`journalctl --disk-usage`

1. Comand to remove all archived journal files except the most recent two:
>`journalctl --vacuum-files=2`

1. Command to filter all log messages with priority levels between zero and two, and save output to `/home/sysadmin/Priority_High.txt`:
>`journalctl -p 2 -b > /home/sysadmin/Priority_High.txt`

1. Command to automate the last command in a daily cronjob. Add the edits made to the crontab file below:

```bash
  0 0 * * * journalctl -p 2 -b > /home/sysadmin/Priority_High.txt >/dev/null 2>&1
```
