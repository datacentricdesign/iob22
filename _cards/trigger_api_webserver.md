---
link-assignment: /assignments/05-covid-dashboard/step1/#task-13-trigger-api-from-a-web-browser
---

# Task 1.3 Trigger API from a web browser

To see how the data looks like, copy and paste the URL of each API in your favourite web browser. Once loaded, you should obtain something like this:

![Assignment 5 - API Countries Result]({{site.baseurl}}/assets/images/assignment5-step1-json.png)

Note: depending on the web browser, the result is shown on multiple lines or kept "as raw".

The data is structured in the JavaScript Object Notation  (JSON, pronounced 'Jason') format. It is a typical data structure for sharing or storing data on the web. It starts and ends with curly brackets `{}`, and it is composed of key/value pairs separated by a colon and a comma between each pair. The value can be of the following types:

- a string (with double quotes, similar to Python);
- a number;
- a boolean (true or false)
- an array (a list of values separated by a comma, delimited by square brackets `[]`)
- an object (a sub-JSON structure, delimited by curly brackets `{}`)

We can see in this example that we have first the key `Global`, leading to a sub-JSON structure with the latest global COVID statistics. Then, we have the key `Countries`, leading to an array. Each JSON structure in this array represents the latest  COVID  numbers for a specific country.