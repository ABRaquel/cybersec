## Week 16 Homework Submission File: Penetration Testing 1

#### Step 1: Google Dorking


- Using Google, can you identify who the Chief Executive Officer of Altoro Mutual is:

> The CEO of Altoro Mutual is **Karl Fitzgerald**.

![am_ceo](/16-Penetration-Testing/screenshots/am_ceo.png)

- How can this information be helpful to an attacker:

>This information can assist an attacker with phishing and smshing attempts against unsuspecting victims at the Bank.

#### Step 2: DNS and Domain Discovery

Enter the IP address for `demo.testfire.net` into Domain Dossier and answer the following questions based on the results:

  1. Where is the company located: 
  > Sunnyvale, CA 94085

![location](/16-Penetration-Testing/screenshots/location.png)

  2. What is the NetRange IP address:
> 65.61.137.64 - 65.61.137.127

![netrange](/16-Penetration-Testing/screenshots/netrange.png)

  3. What is the company they use to store their infrastructure:
> Rackspace Backbone Engineering

![rackspace](/16-Penetration-Testing/screenshots/rackspace.png)

  4. What is the IP address of the DNS server:
> DNS is ```65.61.137.117```

![dns](/16-Penetration-Testing/screenshots/dns.png)

#### Step 3: Shodan

- What open ports and running services did Shodan find:
> Port ```80```, ```443```, ```8080``` are open, running ```Apache``` service.

![ports_services](/16-Penetration-Testing/screenshots/ports_services.png)

#### Step 4: Recon-ng

Is Altoro Mutual vulnerable to XSS: 

> Yes. ```<script>alert(/www.sec-rlz.com/)</script>```

![recon-ng](/16-Penetration-Testing/screenshots/recon-ng.png)
![decoder](/16-Penetration-Testing/screenshots/decoder.png)


### Step 5: Zenmap

Your client has asked that you help identify any vulnerabilities with their file-sharing server. Using the Metasploitable machine to act as your client's server, complete the following:

- Command for Zenmap to run a service scan against the Metasploitable machine: 
![zenmap-output](/16-Penetration-Testing/screenshots/zenmap_output.png)
 
- Bonus command to output results into a new text file named `zenmapscan.txt`:
>```nmap -T4 -A -v -oN zenmapscan.txt 192.168.0.10``` -> [zenmapscan.txt](/16-Penetration-Testing/files/zenmapscan.txt)

- Zenmap vulnerability script command: 
> ```nmap --script ftp-vsftpd-backdoor,smb-enum-shares 192.168.0.10```

![zenmapvuln](/16-Penetration-Testing/screenshots/zenmap_vuln.png)

- Once you have identified this vulnerability, answer the following questions for your client:
1. What is the vulnerability:
```
PORT     STATE SERVICE
21/tcp   open  ftp
| ftp-vsftpd-backdoor: 
|   VULNERABLE:
|   vsFTPd version 2.3.4 backdoor
|     State: VULNERABLE (Exploitable)
|     IDs:  CVE:CVE-2011-2523  BID:48539
|       vsFTPd version 2.3.4 backdoor, this was reported on 2011-07-04.
|     Disclosure date: 2011-07-03
|     Exploit results:
|       Shell command: id
|       Results: uid=0(root) gid=0(root)
|     References:
|       https://www.securityfocus.com/bid/48539
|       https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2011-2523
|       http://scarybeastsecurity.blogspot.com/2011/07/alert-vsftpd-download-backdoored.html
|_      https://github.com/rapid7/metasploit-framework/blob/master/modules/exploits/unix/ftp/vsftpd_234_backdoor.rb
```
```
Host script results:
| smb-enum-shares: 
|   account_used: <blank>
|   \\192.168.0.10\ADMIN$: 
|     Type: STYPE_IPC
|     Comment: IPC Service (metasploitable server (Samba 3.0.20-Debian))
|     Users: 1
|     Max Users: <unlimited>
|     Path: C:\tmp
|     Anonymous access: <none>
|   \\192.168.0.10\IPC$: 
|     Type: STYPE_IPC
|     Comment: IPC Service (metasploitable server (Samba 3.0.20-Debian))
|     Users: 1
|     Max Users: <unlimited>
|     Path: C:\tmp
|     Anonymous access: READ/WRITE
|   \\192.168.0.10\opt: 
|     Type: STYPE_DISKTREE
|     Comment: 
|     Users: 1
|     Max Users: <unlimited>
|     Path: C:\tmp
|     Anonymous access: <none>
```
2. Why is it dangerous:
> vsFTPd version 2.3.4 backdoor allows for the exploit of FTP by escaping during a telnet connection, which in turn will open port 6200. This allows us to connect with root access. [^1]

> SMB vulnerability which gives write access to a samba share and execute code as root. [^2]

3. What mitigation strategies can you recommendations for the client to protect their server:

> Update and patch vsFTPd and SMB to the latest stable version.

#### References:
[^1]: https://westoahu.hawaii.edu/cyber/forensics-weekly-executive-summmaries/8424-2/
[^2]: https://access.redhat.com/security/cve/cve-2017-7494
