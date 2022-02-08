### Submission Guidelines

Provide the following:

- **Deliverable for Task 1:** Take a screenshot of all the GPOs created for this homework assignment. To find these, launch the Group Policy Management tool, select **Group Policy Objects**, and take a screenshot of the GPOs you've created.

![gpo](/07-Windows-Administration-and-Hardening/screenshots/1_gpo.png)
- **Deliverable for Task 2:** Submit a screenshot of the different `Account Lockout` policies in Group Policy Management Editor. It should show the three values you set under the Policy and Policy Setting columns.

![accountlockout](/07-Windows-Administration-and-Hardening/screenshots/2_accountlockout.png)
- **Deliverable for Task 3:** Submit a screenshot of the different `Windows PowerShell` policies within the Group Policy Management Editor. Four of these should be enabled.

![powershell](/07-Windows-Administration-and-Hardening/screenshots/3_powershell.png)
- **Deliverable for Task 4:** Submit a copy of your `enum_acls.ps1` script.
>Link to [enum_acls.ps1](https://github.com/ABRaquel/cybersec/blob/main/07-Windows-Administration-and-Hardening/enum_acls.ps1)
```bash
Param([string]$directory = $PWD)
foreach ($file in $directory) {
   Get-ChildItem $directory -Recurse
   Get-Acl $file | ForEach-Object { $_.Access } | Format-Table -Wrap
}
```
- **Deliverable for Bonus Task 5:** Submit a screenshot of the contents of one of your transcribed PowerShell logs or a copy of one of the logs.
>Link to [Powershell log.](https://github.com/ABRaquel/cybersec/blob/main/07-Windows-Administration-and-Hardening/PowerShell_transcript.DESKTOP-SITPOTH.p8rYP1ca.20220203025650.txt)
