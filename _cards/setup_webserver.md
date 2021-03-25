---
link-assignment: /assignments/05-covid-dashboard/step1/#task-11-set-up-a-web-server
---

# Task 1.1 Set Up a Web Server

Let's start with what we already know from the previous assignment. Go to _Replit_ and create a new project for this Python programming assignment. Go to the package manager and install _Flask_, the Python package we use to make a web server. Have a look at Task 3.1 of the previous assignment if you are struggling to find your way with this.

As we can see from the screenshot above, we aim to generate three different charts:

- the 'New Cases' in the world in the last 24hrs ring chart;
- the 'Total cases per Country' horizontal bar chart;
- the distribution of 'Confirmed Cases' in a given country over time area chart.

Thus, we can structure our code with three HTTP routes with there respective Python function to serve each chart. In addition, we will need a fourth one to serve the dashboard itself.

#### COVID Dashboard HTTP Routes

```markdown
Import the object Flask from the flask module

Create a webserver object called 'COVID Dashboard' and keep track of it in the variable called server

Define an HTTP route / to serve the dashboard home web page
Define the function 'index()' and connect it to the route /
Return the string "A nice COVID dashboard."

Define an HTTP route /summary to serve the summary chart
Define the function 'serve_summary()' and connect it to the route /summary
Return the string "A bar chart summary of COVID cases per country."

Define an HTTP route /new to serve the new count worldwide chart
Define the function 'serve_summary_new()' and connect it to the route /new
Return the string "A pie chart summary of new COVID cases globally."

Define an HTTP route /netherlands to serve the chart of the Netherlands
Define the function 'serve_netherlands_history()' and connect it to the route /netherlands
Return the string "An area chart of COVID cases over time in the Netherlands."

Start the webserver
```

[Check the code on Replit](https://repl.it/@IO1075/05-covid-dashboard-step1)

Copy and paste this English description in the file `main.py` of your _Replit_ project as comments. Then, for each comment, convert it to its Python implementation. Note that for now, our HTTP routes are returning a string. Here we are just putting in place the general structure of our web server.

**Don't remember the syntax?** You might want to look at the previous assignment, Step 3 (Serve web page Python Syntax) for a reminder on the syntax.
{: .fs-5 .ls-10 .code-example .bg-yellow-000}

Execute the code and visit the four HTTP routes `/`, `/summary`, `/new` and `/netherlands` to check that you receive the four sentences as expected.

![Assignment 5 - Sample code]({{site.baseurl}}/assets/images/task 5-1-1.gif)