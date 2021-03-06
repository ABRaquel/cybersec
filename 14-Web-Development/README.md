## Week 14 Homework: Web Development

#### HTTP Requests and Responses

Answer the following questions about the HTTP request and response process.

1. What type of architecture does the HTTP request and response process occur in?
> HTTP request and response occur in a client-server model architecture.

2. What are the different parts of an HTTP request? 
> **Request Line** contains the request method, **Headers** contains details on the resource requested (e.g., authentication) and **Whitespace** indicates the end of the request.

3. Which part of an HTTP request is optional?
> ```BODY```, optional set of data, can contain text or binary, or simply be empty.

4. What are the three parts of an HTTP response?
> **Status Line** contains the response status code, **Headers** contains for example the date, information on the server, etc., **Whitespace** separates response headers from the **Response Body** which contains the resource requested by the client.

5. Which number class of status codes represents errors?
> ```400-499``` for client errors and ```500-599``` for server errors.

6. What are the two most common request methods that a security professional will encounter?
> ```GET``` and ```POST```.

7. Which type of HTTP request method is used for sending data?
> ```POST```

8. Which part of an HTTP request contains the data being sent to the server?
> ```BODY``` during an HTTP request is used to send additional information being send to the server.

9. In which part of an HTTP response does the browser receive the web code to generate and style a web page?
> ```BODY``` during an HTTP response is where the web page is generated.

#### Using curl

Answer the following questions about `curl`:

10. What are the advantages of using `curl` over the browser?
> One of the main advantages of using ```curl``` is the ability to automate in a predicable way various tests, either server configurations, ensuring no data leak through HTTP responses, what type of responses the server allows and checking for various other vulnerabilities on a web server.[^1]

11. Which `curl` option is used to change the request method?
>```curl -X```[^2]

12. Which `curl` option is used to set request headers?
>```curl -H```[^2]

13. Which `curl` option is used to view the response header?
>```curl -I```[^2]

14. Which request method might an attacker use to figure out which HTTP requests an HTTP server will accept?
>```curl -X OPTIONS```[^3]

#### Sessions and Cookies

Recall that HTTP servers need to be able to recognize clients from one another. They do this through sessions and cookies.

Answer the following questions about sessions and cookies:

15. Which response header sends a cookie to the client?

    ```HTTP
    HTTP/1.1 200 OK
    Content-type: text/html
    Set-Cookie: cart=Bob
    ```
>**```Set-Cookie: cart=Bob```**

16. Which request header will continue the client's session?

    ```HTTP
    GET /cart HTTP/1.1
    Host: www.example.org
    Cookie: cart=Bob
    ```
>**```Cookie: cart=Bob```**

#### Example HTTP Requests and Responses

Look through the following example HTTP request and response and answer the following questions:

**HTTP Request**

```HTTP
POST /login.php HTTP/1.1
Host: example.com
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
Content-Type: application/x-www-form-urlencoded
Content-Length: 34
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Mobile Safari/537.36

username=Barbara&password=password
```

17. What is the request method?

>```POST```

18. Which header expresses the client's preference for an encrypted response?

>```Upgrade-Insecure-Requests: 1```

19. Does the request have a user session associated with it?

>There's no presence of a cookie to preserve or continue the user session.

20. What kind of data is being sent from this request body?

>Authentication data.

**HTTP Response**

```HTTP
HTTP/1.1 200 OK
Date: Mon, 16 Mar 2020 17:05:43 GMT
Last-Modified: Sat, 01 Feb 2020 00:00:00 GMT
Content-Encoding: gzip
Expires: Fri, 01 May 2020 00:00:00 GMT
Server: Apache
Set-Cookie: SessionID=5
Content-Type: text/html; charset=UTF-8
Strict-Transport-Security: max-age=31536000; includeSubDomains
X-Content-Type: NoSniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block

[page content]
```

21. What is the response status code?

>```HTTP/1.1 200 OK```

22. What web server is handling this HTTP response?

>```Server: Apache```

23. Does this response have a user session associated to it?

>Yes, under ```Set-Cookie: SessionID=5```.

24. What kind of content is likely to be in the [page content] response body?

> Most likely text in HTML format. ```Content-Type: text/html```

25. If your class covered security headers, what security request headers have been included?

>```Strict-Transport-Security: max-age=31536000; includeSubDomains``` -- enforces HTTPS access only, including subdomains. [^4]

>```X-Content-Type: NoSniff``` -- protection against MIME sniffing, prevents the upload of disguised unsupported content. [^5]

>```X-Frame-Options: DENY``` -- prevents the website from being loaded in a frame, prevents embedding. [^6]

>```X-XSS-Protection: 1; mode=block``` -- stops page from loading if cross-site scripting is detected. [^7]

#### Monoliths and Microservices

Answer the following questions about monoliths and microservices:

26. What are the individual components of microservices called?

> Front-end server, back-end server and a database.

27. What is a service that writes to a database and communicates to other services?

> Back-end server facilitates communications between other services and the database.

28. What type of underlying technology allows for microservices to become scalable and have redundancy?

> Containerization. [^8]

#### Deploying and Testing a Container Set

Answer the following questions about multi-container deployment:

29. What tool can be used to deploy multiple containers at once?

>```docker-compose``` allows for the orchestration of multiple containers at the same time.

30. What kind of file format is required for us to deploy a container set?

>```docker-compose``` uses ```.yml```/```.yaml``` file format to orchestrate the spinning of containers.

#### Databases

31. Which type of SQL query would we use to see all of the information within a table called `customers`?

>```SELECT * FROM customers;```

32. Which type of SQL query would we use to enter new data into a table? (You don't need a full query, just the first part of the statement.)

>```INSERT INTO [TABLE] (COLUMNS)```
>```VALUES ('DATA');```

33. Why would we never run `DELETE FROM <table-name>;` by itself?
> Using the above query would delete the entire table. Usually one will pair the query with ```WHERE```. [^9]
---

### Bonus Challenge Overview: The Cookie Jar

For this challenge, you'll once again be using `curl`, but this time to manage and swap sessions.

:warning: **Heads Up**: You'll need to have WordPress set up from the Swapping Sessions activity from Day 1 of this unit. If you have not done it or it is improperly set up, please refer to the Day 1 student guide and the Swapping Sessions activity file.

If you recall, on Day 1 of this unit you used Google Chrome's Cookie-Editor extension to swap sessions and cookies. For this homework challenge, we'll be using the command-line tool `curl` to practice swapping cookie and sessions within the WordPress app.

It is important for cybersecurity professionals to know how to manage cookies with `curl`:

- Web application security engineers need to regularly ensure cookies are both functional and safe from tampering.

  - For example, you might need to request a cookie from a webpage and then test various HTTP responses using that cookie. Doing this over and over through the browser is tedious, but can be automated with scripts.

- The same concept applies for penetration testers and hackers: `curl` is used to quickly save a cookie in order to test various exploits.

  - For example, an HTTP server may be configured so that, in order to POST data to specific pages, clients need to have cookies or authentication information set in their request headers, which the server will verify.

#### Logging In and Saving Cookies with Curl

![amanda](/14-Web-Development/screenshots/amanda.png)

#### Using a Saved Cookie

![logver](/14-Web-Development/screenshots/logver.png)

---

### Bonus Challenge Instructions: The Cookie Jar
#### Baselining

For these "baselining" steps, you'll want to log into two different types of accounts to see how the WordPress site looks at the `localhost:8080/wp-admin/users.php` page.  We want to see how the Users page looks from the perspective of an administrator, vs. a regular user.

1. Using your browser, log into your WordPress site as your sysadmin account and navigate to `localhost:8080/wp-admin/users.php`, where we previously created the user Ryan. Examine this page briefly. Log out.

![users](/14-Web-Development/screenshots/wpuser.png)


2. Using your browser, log into your Ryan account and attempt to navigate to `localhost:8080/wp-admin/index.php`. Note the wording on your Dashboard.

3. Attempt to navigate to `localhost:8080/wp-admin/users.php`. Note what you see now.

![wppermissions](/14-Web-Development/screenshots/wppermission.png)

Log out in the browser.

#### Step 3: Using Forms and a Cookie Jar

Navigate to `~/Documents` in a terminal to save your cookies.

1. Construct a `curl` request that enters two forms: `"log={username}"` and `"pwd={password}"` and goes to `http://localhost:8080/wp-login.php`. Enter Ryan's credentials where there are placeholders. 

> ```curl --form "log=Ryan" --form "pwd=password" http://localhost:8080/wp-login.php --verbose```

**Question:** Did you see any obvious confirmation of a login? 
> **Yes.** A logged in cookie was set.

![ryanloggedin](/14-Web-Development/screenshots/curl_ryan_login.png)



2. Construct the same `curl` request, but this time add the option and path to save your cookie: `--cookie-jar ./ryancookies.txt`. This option tells `curl` to save the cookies to the `ryancookies.txt` text file.

> ```curl --cookie-jar ./ryancookies.txt --form "log=Ryan" --form "pwd=password" http://localhost:8080/wp-login.php --verbose```


3. Read the contents of the `ryancookies.txt` file.

**Question:** How many items exist in this file?
> Three items.

![ryan-cookies](/14-Web-Development/screenshots/ryan_cookies.png)


Note that each one of these is a cookie that was granted to Ryan after logging in.

#### Step 4: Log in Using Cookies

1. Craft a new `curl` command that now uses the `--cookie` option, followed by the path to your cookies file. For the URL, use `http://localhost:8080/wp-admin/index.php`.

**Question:** Is it obvious that we can access the Dashboard?
> **Yes**. Dashboard has been loaded, including the dashboard navigation pane.

![ryan_dashboard](/14-Web-Development/screenshots/ryan_dashboard.png)

2. Press the up arrow on your keyboard to run the same command, but this time, pipe `| grep Dashboard` to the end of your command to return all instances of the word `Dashboard` on the page.

**Question:**  Look through the output where `Dashboard` is highlighted. Does any of the wording on this page seem familiar?

> **Yes.** One can verify what the _Editor_ role has access to, for example the ability to post, media, etc.

![ryan-dash2](/14-Web-Development/screenshots/ryan_dash2.png) 
#### Step 5: Test the Users.php Page

1. Finally, write a `curl` command using the same `--cookie ryancookies.txt` option, but attempt to access `http://localhost:8080/wp-admin/users.php`.

**Question:** What happens this time?

> Access was denied to that specific page.

![ryan-denied](/14-Web-Development/screenshots/ryan_denied.png)

#### References:
[^1]:https://isc.sans.edu/diary/Using+Curl+to+Retrieve+Malicious+Websites/8038
[^2]:https://www.keycdn.com/support/popular-curl-examples
[^3]:https://reqbin.com/req/c-d8nxa0fl/curl-options-request
[^4]:https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Strict-Transport-Security
[^5]:https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Content-Type-Options
[^6]:https://credoinfolit.zendesk.com/hc/en-us/articles/360038339213-X-Frame-Options-Set-to-Deny
[^7]:https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-XSS-Protection
[^8]:https://www.ibm.com/cloud/learn/containerization
[^9]:https://www.techonthenet.com/sql/delete.php
