# Network Forensic Analysis Report

## Time Thieves
You must inspect your traffic capture to answer the following questions:

1. What is the domain name of the users' custom site? `frank-n-ted.com`
2. What is the IP address of the Domain Controller (DC) of the AD network? `10.6.12.12`
![](images/ip_domain_controller.png)
3. What is the name of the malware downloaded to the 10.6.12.203 machine? `june11.dll`
![](images/filter_malware.png)
   - Once you have found the file, export it to your Kali machine's desktop.
   ![](images/export_junedll.png)
4. Upload the file to [VirusTotal.com](https://www.virustotal.com/gui/).
![](images/virus_total.png)
5. What kind of malware is this classified as? `Trojan`

---

## Vulnerable Windows Machine

1. Find the following information about the infected Windows machine:
    - Host name: `ROTTERDAM-PC`
    - IP address `172.16.4.205`
    - MAC address `00:59:07:b0:63:a4`
![](images/infected_windows_machine.png)
2. What is the username of the Windows user whose computer is infected? `mattijs.dervies`
![](images/computer_name.png)
3. What are the IP addresses used in the actual infection traffic? `185.243.115.84`
![](images/infected_traffic.png)
4. As a bonus, retrieve the desktop background of the Windows host.
![](images/find_background.png)

![](images/background.png)

---

## Illegal Downloads

1. Find the following information about the machine with IP address `10.0.0.201`:
    - MAC address: `00:16:17:18:66:c8`
    - Windows username: `elmer.blanco`
    - Computer host name: `BLANCO-DESKTOP`
![](images/illegal_downloads.png)
2. Which torrent file did the user download? `Betty_Boop_Rhythm_on_the_Reservation.avi.torrent`
![](images/torrent.png)
