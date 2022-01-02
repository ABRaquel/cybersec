## Week 2 Homework: Assessing Security Culture

This week we learned about security culture and how to promote it within organizations.

It’s important that all employees are aware of common security risks and treat security seriously. The majority of cyberattacks aim to exploit human weaknesses with methods like phishing.

For this reason, people are most often the weakest link in an organization’s security defenses.

### Scenario

- Employees at SilverCorp are increasingly using their own personal devices for company work.

- Specifically, over half of all employees check their work email and communications via Slack on their personal mobile phones.

- Another 25% of employees are doing other work-related activities using work accounts and work-related applications on their personal phone.

- Allowing sensitive work information to be shared on employees’ personal devices has a number of security implications.

- You must research these security risks and use the security culture framework to develop a plan to mitigate the concerns.

### Instructions

Compose the answers to the following four steps in a Google Doc.

---
#### Step 1: Measure and Set Goals

Answer the following questions:

1. Using outside research, indicate the potential security risks of allowing employees to access work information on their personal devices. Identify at least three potential attacks that can be carried out.
>  * Stolen or lost devices;
>  * Insider threat, making it harder to control access to data, thus being susceptible to exfiltration and corruption of said data;
>  * Mobile device malware -- specifically if the user allows non-trusted apps to be installed/side-loaded.

2. Based on the above scenario, what is the preferred employee behavior?
>  * Device encryption, with PIN/Biometric unlock. Install only trusted applications from official app stores.

3. What methods would you use to measure how often employees are currently _not_ behaving according to the preferred behavior?
>  * Run access logs within Slack to get the user_agent on what type of device is being used to access Slack, same thing can be done either for G-Suite or Office 365 (unknown type of exchange for this company.)
\
>**NOTE:** The problem with internal surveys, is that you need buy-in to get it completed and a push from leads to their direct reports. From personal experience, even a survey asking what kind of holiday swag staff want, takes time and a lot of reminders. The carrot and the stick approach not always works.

4. What is the goal that you would like the organization to reach regarding this behavior?
>   * All access to work data will be compliant using app protection policies.

---
#### Step 2: Involve the Right People

Now that you have a goal in mind, who needs to be involved?  

>* Security Team:
>    * This team will be responsible for research and implementation of the new security rules.
They are also responsible for creating the reports and framework of said rules, specifically the justification for why it's being implemented, including potential costs.

>* IT Helpdesk:
>   * IT Team will be handle end-user support and create how-to guides if required.

>* Communications Team:
>    * The communications team will draft an all staff communications announcing the changes, and also be a second set of eyes on the how-to guides. Specifically for clarity and how easy it is to follow any changes.

>* HR Team:
>    * HR team will handle any possible changes to the acceptable use policy in the employee handbook.

>* C-Suite/Management Team:
>   * Notification and buy-in from all department leads and C-Suite. Especially as to why, how and timeframe of such implementation.

---
#### Step 3: Training Plan

Training is part of any security culture framework plan. How will you train your employees on this security concern? In one page, indicate the following:

1. How frequently will you run training? What format will it take? (i.e. in-person, online, a combination of both)
>  * Training on initial implementation, online only with access to IT Helpdesk for any questions. Following the initial training, it can be done on-demand upon new staff starting, and keeping it part of an internal wiki/kb for reference.


2. What topics will you cover in your training and why? (This should be the bulk of the deliverable.)
>  * The topics will be how to setup PIN/Biometric authentication once app protection policies are turned on. Best practices on installing apps and a secure/clean device.


3. After you’ve run your training, how will you measure its effectiveness?
>  * Effectiveness is measured by enforcing app protection policies for all unmanaged devices. Requiring PIN/Biometric to access *[Slack](https://slack.com/help/articles/360033808693-Require-a-mobile-passcode-on-Enterprise-Grid-)*, likewise for *[Office 365](https://docs.microsoft.com/en-us/mem/intune/apps/app-protection-policy)* and *[G-Suite](https://cloud.google.com/identity/solutions/secure-corp-on-personal-devices)*. *-- unknown what type of email exchange is being used.* Once access controls are turned on, use reporting tools to create a report on what type of user_agent is being used and if the security policy is active.

---
This portion will require additional outside research on the topic so that you can lay out a clear and thorough training agenda.

#### Bonus: Other Solutions

Training alone often isn't the entire solution to a security concern.

- Indicate at least two other potential solutions. For each one, indicate the following:

#### Solution 1: Data Access Restriction on Non-Managed Devices

1. What type of control is it? Administrative, technical, or physical?
> - Technical.


2. What goal does this control have? Is it preventive, deterrent, detective, corrective, or compensating?
> - Preventive.  


3. What is one advantage of each solution?
> - Complete control on how data is accessed.


4. What is one disadvantage of each solution?
> - Allowing only managed devices to access any data can impede productivity, it can also be costly if the company needs to provide a mobile device to every staff.

#### Solution 2: Acceptable Use policy

1. What type of control is it? Administrative, technical, or physical?
> - Administrative


2. What goal does this control have? Is it preventive, deterrent, detective, corrective, or compensating?
> -  Deterrent.


3. What is one advantage of each solution?
> -  Easy and cost effective, only requiring an update to the employee handbook and requiring all employees to adhere to it.


4. What is one disadvantage of each solution?
> - Can't prevent an employee from accessing the data from their own device. Reporting can be used to see who is accessing data from a personal device and apply corrective measures.
