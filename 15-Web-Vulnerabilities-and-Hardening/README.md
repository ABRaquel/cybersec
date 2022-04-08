### Web Application 1: *Your Wish is My Command Injection*

![web1-unit15](/15-Web-Vulnerabilities-and-Hardening/screenshots/web1-unit15.png)

* The command injection used was ```127.0.0.1; cat ../../../../etc/passwd && cat ../../../../etc/hosts```. I used a semicolon to allow for the commands to be executed sequentially, irrelevant if the first command was successful or not.
**Preventive** measures would be to create an array of blocked characters, only allowing numbers and periods. We could also implement ```trim()``` to remove any whitespace without modifying the string.


### Web Application 2: *A Brute Force to Be Reckoned With*

* Intercepted the data from bWAPP in Burpsuite and sent the results to ```Intruder``` process. Cleared the auto assigned positions and manually set ```login``` and ```password``` fields for Payload 1 & 2. Set attack type to ```Cluster bomb```.

![web_cluster](/15-Web-Vulnerabilities-and-Hardening/screenshots/web_cluster.png)

* Added ```listofadmin.txt``` to ```Payload Set 1``` and ```breached_passwords.txt``` to ```Payload Set 2```. Both Payloads are set to ```Simples list```.

![web_payload](/15-Web-Vulnerabilities-and-Hardening/screenshots/web_payload.png)

* Analyzed the results, sorting by ```Length```, the login ```ironman``` and password ```I am Iron Man``` resulted in a succesful login. This can be verified under ```Response```.

![web_ironman](screenshots/wb_ironman.png)

To help **mitigate** a brute force attack of this nature, it would be recommended to implement **2FA**, **automatic lockout** after X amount of login attempts, paired with a system like **Fail2Ban**[^1], where the IP address would be banned as well.

### Web Application 3: Where's the BeEF?


#### References:
[^1]: https://www.fail2ban.org/wiki/index.php/Main_Page
