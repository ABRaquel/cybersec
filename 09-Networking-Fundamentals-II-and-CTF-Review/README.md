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

- OSPF transit link ``Batuu`` > ``D`` > ``C`` > ``E`` > ``F`` > ``J`` > ``I`` > ``L`` > ``Q`` > ``T`` > ``V`` > ``Jedha``
  
### Mission 6

> - 172.16.0.101 | 00:13:CE:55:98:EF
> - 172.16.0.1 | 00:0F:66:E3:E4:01


### Mission 7 

![telnet](/09-Networking-Fundamentals-II-and-CTF-Review/screenshots/telnet.png)
 
  

