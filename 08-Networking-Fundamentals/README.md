### **Phase 1**: _"I'd like to Teach the World to `Ping`"_

You have been provided a list of network assets belonging to RockStar Corp. Use `fping` to ping the network assets for only the Hollywood office.

  - IP ranges provided by RockStar for the Hollywood office are:
    - 15.199.95.91/28
    - 15.199.94.91/28
    - 11.199.158.91/28
    - 167.172.144.11/32
    - 11.199.141.91/28

  - Following command was used against the list of IPs provided:
    - > cat ip_list.txt | xargs -n1 fping -g | grep alive > alive.txt ## for servers that respond to ICMP packets
    - > cat ip_list.txt | xargs -n1 fping -g | grep unreachable > dead.txt ## for servers that do not respond to ICMP packets

  - IPs that responded to ICMP echo **167.172.144.11** -- all other IPs did not respond to ICMP packets.
    - Supporting summary results:
      - [IPs that responded to ICMP](https://github.com/ABRaquel/cybersec/blob/main/08-Networking-Fundamentals/supplemental/alive.txt)
      - [IPs that did NOT respond to ICMP](https://github.com/ABRaquel/cybersec/blob/main/08-Networking-Fundamentals/supplemental/dead.txt)

  - ICMP responses are on Layer 3 (Network) of the OSI model.

### **Phase 2**:  _"Some `Syn` for Nothin`"_

With the IP(s) found from Phase 1, determine which ports are open:

  - Port 22 for SSH service is open. SSH is an Application Layer protocol.
![nmap](/08-Networking-Fundamentals/screenshots/nmap.png)

### Phase 3: _"I Feel a `DNS` Change Comin' On"_

With your findings from Phase 2, determine if you can access the server that is accepting connections.

  - Hosts file modified to redirect rollingstone.com to unknown.yahoo.com at **98.137.246.8**
![hosts](/08-Networking-Fundamentals/screenshots/hosts.png)
![nslookup](/08-Networking-Fundamentals/screenshots/nslookup.png)

### Phase 4:  _"Sh`ARP` Dressed Man"_

Within the RockStar server that you SSH'd into, and in the same directory as the configuration file from **Phase 3**, the hacker left a note as to where he stored away some packet captures.  

- Ran ``head *`` inside ``/etc`` and grabbed file from a G-Drive share.



