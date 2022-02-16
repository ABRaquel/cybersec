## Networks Fundamentals II Homework: *In a Network Far, Far Away!*

### Mission 1  

- Ran ``nslookup -q=mx starwars.com``

![mx](/09-Networking-Fundamentals-II-and-CTF-Review/screenshots/mx.png)

- ``asltx.l.google.com`` and the secondary ``asltx.2.google.com`` mail server MX entries are missing from the DNS record.

- MX record should be:

|Record Type | (sub)Domain/Hostname |  Priority |  Value  |  TTL  |
|:---   | :----:               |  :----:   |  :----: |  :----:  |
| **MX**  | @ | 1 | asltx.l.google.com  | 300 |
| **MX**  | @ | 5 | asltx.2.google.com  | 300 |

### Mission 2

  - Ran ``nslookup -q=txt theforce.net``.

 ![spf](/09-Networking-Fundamentals-II-and-CTF-Review/screenshots/spf.png)

  - SPF string is missing the IP address for the mail server. As such it's being flagged as coming from untrusted source.

  - TXT record should include (not removing old IPs, since I'm unaware if they were deprecated):

|Record Type | (sub)Domain/Hostname |  Value  |  TTL  |
|:---   | :----:               |  :----: |  :----:  |
| **TXT**  | @ | v=spf1 a mx mx:smtp.secureserver.net include:aspmx.googlemail.com ip4:104.156.250.80 ip4:45.63.15.159 ip4:45.63.4.215 ip4:45.23.176.21  | 3600 |
  
### Mission 3
 
  - Ran ``nslookup -q=cname www.theforce.net``.
 
  ![cname](/09-Networking-Fundamentals-II-and-CTF-Review/screenshots/cname.png)
  
  - CNAME record needs to be created point the subdomain `resistance` to `theforce.net`.
  
  - CNAME record should be:

|Record Type | (sub)Domain/Hostname |  Value  |  TTL  |
|:---   | :----:               |  :----: |  :----:  |
| **CNAME**  | resistance | theforce.net  | 3600 |  
  
### Mission 4

  - Ran ``nslookup -q=ns princessleia.site``.

![dns](/09-Networking-Fundamentals-II-and-CTF-Review/screenshots/dns.png)

  - NS record should be:

|Record Type | (sub)Domain/Hostname |  Value  |  TTL  |
|:---   | :----:               |  :----: |  :----:  |
| **NS**  | @ |  ns2.galaxybackup.com | 3600 | 
  
### Mission 5

**Issue**: The network traffic from the planet of `Batuu` to the planet of  `Jedha` is very slow.  

- You have been provided a network map with a list of planets connected between `Batuu` and `Jedha`.

- It has been determined that the slowness is due to the Empire attacking `Planet N`.

Your Mission: 

- View the [Galaxy Network Map](resources/Galaxy_Network_map.png) and determine the `OSPF` shortest path from `Batuu` to `Jedha`.

- Confirm your path doesn't include `Planet N` in its route.

- Document this shortest path so it can be used by the Resistance to develop a static route to improve the traffic.
  
### Mission 6

**Issue:** Due to all these attacks, the Resistance is determined to seek revenge for the damage the Empire has caused. 

- You are tasked with gathering secret information from the Dark Side network servers that can be used to launch network attacks against the Empire.

- You have captured some of the Dark Side's encrypted wireless internet traffic in the following pcap: [Darkside.pcap](resources/Darkside.pcap).

Your Mission:

- Figure out the Dark Side's secret wireless key by using Aircrack-ng.

  - Hint: This is a more challenging encrypted wireless traffic using WPA.

  - In order to decrypt, you will need to use a wordlist (-w) such as `rockyou.txt`.

- Use the Dark Side's key to decrypt the wireless traffic in Wireshark.

  - Hint: The format for they key to decrypt wireless is `<Wireless_key>:<SSID>`.

- Once you have decrypted the traffic, figure out the following Dark Side information:

  - Host IP Addresses and MAC Addresses by looking at the decrypted `ARP` traffic.

  - Document these IP and MAC Addresses, as the resistance will use these IP addresses to launch a retaliatory attack.


### Mission 7 

![telnet](/09-Networking-Fundamentals-II-and-CTF-Review/screenshots/telnet.png)
 
  

