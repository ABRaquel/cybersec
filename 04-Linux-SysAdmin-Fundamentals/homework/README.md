### Step 1: Ensure/Double Check Permissions on Sensitive Files

1. Permissions on `/etc/shadow` should allow only `root` read and write access.

    - Command to inspect permissions: `ls -l /etc/shadow`

    - Command to set permissions (if needed): `sudo chmod 600 /etc/shadow`

2. Permissions on `/etc/gshadow` should allow only `root` read and write access.

    - Command to inspect permissions: `ls -l /etc/gshadow`

    - Command to set permissions (if needed): `sudo chmod 600 /etc/gshadow`

3. Permissions on `/etc/group` should allow `root` read and write access, and allow everyone else read access only.

    - Command to inspect permissions: `ls -l /etc/group`

    - Command to set permissions (if needed): `sudo chmod 644 /etc/group`

4. Permissions on `/etc/passwd` should allow `root` read and write access, and allow everyone else read access only.

    - Command to inspect permissions: `ls -l /etc/passwd`

    - Command to set permissions (if needed): `sudo chmod 644 /etc/passwd`

### Step 2: Create User Accounts

1. Add user accounts for `sam`, `joe`, `amy`, `sara`, and `admin`.

    - Command to add each user account (include all five users):
        - `sudo useradd -m sam`
        - `sudo useradd -m joe`
        - `sudo useradd -m amy`
        - `sudo useradd -m sara`
        - `sudo useradd -m admin`

2. Ensure that only the `admin` has general sudo access.

    - Command to add `admin` to the `sudo` group: `sudo usermod -a -G sudo admin`

### Step 3: Create User Group and Collaborative Folder

1. Add an `engineers` group to the system.

    - Command to add group: `sudo groupadd engineers`

2. Add users `sam`, `joe`, `amy`, and `sara` to the managed group.

    - Command to add users to `engineers` group (include all four users): `gpasswd -M sam,joe,amy,sara engineers`

3. Create a shared folder for this group at `/home/engineers`.

    - Command to create the shared folder: `sudo mkdir -p /home/engineers`

4. Change ownership on the new engineers' shared folder to the `engineers` group.

    - Command to change ownership of engineer's shared folder to engineer group: 
        - `sudo chgrp -R engineers /home/engineers`


### Step 4: Lynis Auditing

1. Command to install Lynis: `sudo apt install lynis`

2. Command to see documentation and instructions: `sudo lynis --help` or `man lynis`

3. Command to run an audit: `sudo lynis audit system`

4. Provide a report from the Lynis output on what can be done to harden the system.

    - Screenshot of report output:
![Linys report](/04-Linux-SysAdmin-Fundamentals/homework/screenshot/lynis_audit.png)

### Bonus
1. Command to install chkrootkit: `sudo apt install chkrootkit`

2. Command to see documentation and instructions: `chkrootkit --help` or `man chkrootkit`

3. Command to run expert mode: `chkrootkit -x`

4. Provide a report from the chrootkit output on what can be done to harden the system.
![chkrootkit report](/04-Linux-SysAdmin-Fundamentals/homework/screenshot/chkrootkit.png)

> Shutdown Apache webserver (port 80), SMB (port 139, 445), POP3/SMTP (port 110, 25), FTP (port 21).
> Remove user jack from `sudo` group.

