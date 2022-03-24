### Answer the following questions:

In the last 7 days, how many unique visitors were located in India?
> **244** unique visitors.

![unique visitors](https://github.com/ABRaquel/cybersec/blob/main/Project_1-ELK_Stack/Screenshots/7in.png)

In the last 24 hours, of the visitors from China, how many were using Mac OSX?
> **10** users were using Mac OSX

![china-os](https://github.com/ABRaquel/cybersec/blob/main/Project_1-ELK_Stack/Screenshots/2cn.png)

In the last 2 days, what percentage of visitors received 404 errors? How about 503 errors?
> **5.479%** visitors received **404** errors and **8.219%** received **503** errors.

![error codes](https://github.com/ABRaquel/cybersec/blob/main/Project_1-ELK_Stack/Screenshots/404_503.png)

In the last 7 days, what country produced the majority of the traffic on the website?
> China produced the majority of traffic with **257** visitors, followed by India with **244**.

![traffick](https://github.com/ABRaquel/cybersec/blob/main/Project_1-ELK_Stack/Screenshots/uniquecn.png)
![traffick-follow](https://github.com/ABRaquel/cybersec/blob/main/Project_1-ELK_Stack/Screenshots/followedin.png)

Of the traffic that's coming from that country, what time of day had the highest amount of activity?
> The highest activity was between **12PM and 1PM**.

![activity time](https://github.com/ABRaquel/cybersec/blob/main/Project_1-ELK_Stack/Screenshots/timeofday.png)

List all the types of downloaded files that have been identified for the last 7 days, along with a short description of each file type.
> * ```gz``` : compressed archive using GZIP algorythim
> * ```css``` : Cascading Style Sheet is used to format webpage contents
> * ```zip``` : compressed archive, similar to ```gz``` format.
> * ```deb``` : Debian software package format for Debian Linux based systems, used for distribution of installable data.
> * ```rpm``` : Similar to ```deb```, ```rpm``` (Red Hat Package Manager) is used with Red Hat Linux based system, usually for distribution of installable data.

![file type](https://github.com/ABRaquel/cybersec/blob/main/Project_1-ELK_Stack/Screenshots/filetype.png)

#### Now that you have a feel for the data, Let's dive a bit deeper. Look at the chart that shows Unique Visitors Vs. Average Bytes.
Locate the time frame in the last 7 days with the most amount of bytes (activity).
> 03/20/2022 - 9PM | 3 visitors | ~11k bytes

![high activity](https://github.com/ABRaquel/cybersec/blob/main/Project_1-ELK_Stack/Screenshots/dataout.png)

In your own words, is there anything that seems potentially strange about this activity?
> With such low user count, it could potentially indicate data exfiltration, or probing of vulnerabilities.

#### Filter the data by this event.
What is the timestamp for this event?
> 03/20/2022 - 9:57PM
What kind of file was downloaded?
> ```rpm``` package was downloaded.

![file out](https://github.com/ABRaquel/cybersec/blob/main/Project_1-ELK_Stack/Screenshots/downloadfile.png)

From what country did this activity originate?
> India

![country origin](https://github.com/ABRaquel/cybersec/blob/main/Project_1-ELK_Stack/Screenshots/countryorigin.png)

What HTTP response codes were encountered by this visitor?
> Reponse code was **200**.

![response code](https://github.com/ABRaquel/cybersec/blob/main/Project_1-ELK_Stack/Screenshots/responsecode.png)

#### Switch to the Kibana Discover page to see more details about this activity.
What is the source IP address of this activity?
> ```35.143.166.159```
What are the geo coordinates of this activity?
> ```Lat: 43.34121 | lon: -73.6103075```
What OS was the source machine running?
> Machine was using Windows 8.
What is the full URL that was accessed?
> ```https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-6.3.2-i686.rpm```
From what website did the visitor's traffic originate?
> Facebook.

![IP source](https://github.com/ABRaquel/cybersec/blob/main/Project_1-ELK_Stack/Screenshots/sourceip.png)

#### Finish your investigation with a short overview of your insights. 

What do you think the user was doing?
> User was downloading RPM package for Metricbeats.

Was the file they downloaded malicious? If not, what is the file used for?
> No. The file is used to deploy Metricbeats agent on a server for system stats recording.

Is there anything that seems suspicious about this activity?
> Not really, only that it originated from Facebook, which is an odd place. User could've been following a targetted ad on Facebook, since Elastic provides commercial services.

Is any of the traffic you inspected potentially outside of compliance guidlines?
> Without knowing the guidelines, there's nothing out of bounds with this traffic.
