---
layout: default
title: Step 2 HTTP Requests
parent: '05 COVID Dashboard'
grand_parent: Computational Thinking
---

# Step 2 HTTP Requests

{: .no_toc }

## Table of contents

{: .no_toc .text-delta }

1. TOC
{:toc}

---

We have identified a service to access the latest COVID-19 data. However, we need our Python code to download the data itself, which is different from what we achieved in Python so far. Currently, our server serves content on the web, but it does not collect content from the web. For this, we need to make an `HTTP Request`.

# HTTP Request

An HTTP Request is a message that a computer sends to the web to receive information in response: the HTTP Response. It is what we want to achieve to collect data from the covi19api.com service. The algorithm of an HTTP Request has the following elements:

- `URL` Where is the resource located?
- `method` What is the HTTP method?
- `response` Where should the response be stored?
- `responseStatus` What is the status of the response? Did it succeed? Did it fail?
- `successAction` What shall we do if the request was successful?
- `errorAction` What shall we do if the request failed?

#### HTTP Request Algorithm

The algorithm looks as follows:

```markdown
Send the request to [URL] using [method] and store the response in the variable [response]
Then, check the [responseStatus] for a 'successful' code
Do the [successAction]
Otherwise, something went wrong
Do the [errorAction]
```

The HTTP protocol has an extensive list of response codes to indicate a response's status (i.e. how did it go?) The typical successful status code is `200`. You can see the full list of [HTTP response status codes on MDN Web Docs](https://developer.mozilla.org/nl/docs/Web/HTTP/Status) (You might have seen 404 before). 

Regarding the HTTP methods, the most commonly used are GET (to get data from a web server) and POST (to send data to a web server).

#### HTTP Request Sequence Diagram

![HTTP Request Sequence Diagram]({{site.baseurl}}/assets/images/assignment5-step2-http-req.png)

#### HTTP Request Python Syntax

Switching to the Python syntax, we use the function `get()` from the module `requests` to make an HTTP request with the method GET. The same structure would apply for a POST request (with the function post() instead). 

`get()` takes a parameter:`URL` (where is the resource located?). Here we use the URL that we typed in the web browser in the previous step. We store the result of `get()` (what comes back from the web service) in the variable response. The HTTP response includes a property: `status_code`, which contains the request's HTTP response status. As discussed above, we check for the status `200`, meaning that the request was successful. Otherwise, we use the `else` to run an `errorAction`.


```python
from requests import get

# Send the request to url using the get method and store the response in response
response = get("http://api.covid19api.com/summary")
# Check response status for the code 200 (OK)
if response.status_code == 200:
    # Do successAction
# Otherwise, something went wrong
else:
    # Do errorAction
```

# Task 2.1 Download Summary

Let's give it a try. In your _Replit_ project, create a new file, `covid.py`, where we interact directly with the COVID19 API.

Inside this file, to make an HTTP request, we first need to import the `get` function (see the first line of Python code example above). Then, we create a function `download_summary()`, as follows:

```python
def download_summary():
	"""
  Send HTTP request to API /summary and return the response in JSON format.

  API details: https://documenter.getpostman.com/view/10808728/SzS8rjbc#00030720-fae3-4c72-8aea-ad01ba17adf8

	"""
  # Send the HTTP request
  # Check for the HTTP response status 200 (OK)
  	# Return the response as JSON
  # Otherwise, something went wrong
    # Show the error message
    # Return an empty result
```

Convert to the Python code's appropriate line based on the previous step, 'HTTP Request Python syntax'. What we miss is what to do in `successAction` and `errorAction`. In these cases, the success action should return the JSON object response (what we were looking at in the web browser in Step 1). We extract it from the response variable as follows:

```python
        # Return the response as JSON
        return response.json()
```

If it fails, it would be practical to get some information about the error. This can be done by printing the HTTP response status. Then we would finish by return an empty JSON object.

```python
        # Log the error message
        print(f'An error has occurred: HTTP status {response.status_code}')
        # Return an empty result
        return {}
```

We are done implementing our HTTP request in Python. We can go back to the file `main.py` and import this function at the top of the file (the same way we imported the SVG functions in the previous assignment). Finally, we can replace the sentence `"Bar chart summary of COVID cases per country."` by a call to the function `download_summary()`, which returns the JSON data instead of the sentence.

Run the code and trigger the route `/summary` to check if it serves the COVID data. The expected result is the same as directly calling the COVID19 API: our Python code downloads the data and forwards it to the web browser.

![Assignment 5 - Summary]({{site.baseurl}}/assets/images/task 5-2-1.gif)

# Task 2.2 Download Confirmed Cases per Country

Let's repeat this process to download the data from the `/country` API. We want to download the historical data for the Netherlands. Back in `covid.py`, create a function `download_confirmed_per_country()`.

```python
def download_confirmed_per_country(country):
  """
  Send HTTP request to API /country/<country>/status/confirmed to receive the daily number of confirmed cases for the requested country. Return the response in JSON format.

  API details: https://documenter.getpostman.com/view/10808728/SzS8rjbc#b07f97ba-24f4-4ebe-ad71-97fa35f3b683

  country -- the name of the requested
  """
  # Send the HTTP request
  # Check for the HTTP response status 200 (OK)
  	# Return the response as JSON
  # Otherwise, something went wrong
    # Show the error message
    # Return an empty result
```

The only major difference from the previous 'download_summary()' declaration is the new function parameter `country`. We want to specify the country's name as a parameter so that we can reuse this function for an arbitrary country. We use the country parameter in the URL of the HTTP request like so:

```python
    # Send the HTTP request
    response = get(f'http://api.covid19api.com/country/{country}/status/confirmed')
```

In `main.py`, we import this new function at the top of the file. Finally, we can replace the sentence `" Area chart of COVID cases over time in the Netherlands. "` by a call to `download_confirmed_per_country()`, which returns the JSON data instead of the sentence. Let's not forget to provide the name of a valid country when we call our function:

```python
    return download_confirmed_per_country("netherlands")
```

Run the code, and trigger the route `/netherlands` to check if it serves the correct COVID data. Once again, the expected result is the same as directly calling the COVID19 API: our Python code downloads the data and forwards it.

Oh! It does not work! `500 Internal Server Error`, what can that possibly mean! Well, `500` is the generic HTTP status code for when something went wrong on the server (as opposed to `200`). If we look at the Terminal in _Replit_, we can indeed see that something went wrong.

![Assignment 5 - 500 Internal Server Error]({{site.baseurl}}/assets/images/assignment5-step2-error.png)

Let's not be scared out by an error stack: something went wrong, so Python is showing us the list of functions it went through before the error, along with the lines and files, so that we can identify where the problem is. The first thing to notice here are the files: `flask/app.py`. This tells us that the error occurred in the Flask module that we used for our web server. We are not going to look at this code as, especially for a well-known module, chances are very high that the issue is on our side. In that case, we look at the bottom, the description of the error itself.

```
TypeError: The view function did not return a valid response. The return type must be a string, dict, tuple, Response instance, or WSGI callable, but it was a list.
```

It tells us that our Python code returns a list where it is not permitted. It says `Response Instance`, most lines in the error message are about Flask so we can safely assume it is about the HTTP Response we try to send back to the web browser. The one containing the Netherlands data. Let's have a look at the Netherlands data once again: [http://api.covid19api.com/country/netherlands/status/confirmed](http://api.covid19api.com/country/netherlands/status/confirmed).

Indeed, this data does not start and end with curly brackets `{}`. It starts directly with square brackets `[]`; this is a list of values instead of a JSON object composed of key/value pairs. As this is not JSON standard, _Flask_ does not seem to like it. To solve the problem, we can put this list into a JSON object as follows:

```json
{
    "data": [ ... ]
}
```

Note that we choose `data` as the key where we could have picked any key name. In Python code, we can use a similar syntax to express this. The equivalent of a JSON structure (i.e. a map of keys and values) is the data type `dict` (for dictionary). We will explore further what we can do with `dict` when manipulating the data in the next step. For now, we can change the code of `download_confirmed_per_country()` as follows by taking the list from the response and inserting it into a `dict` under the key `data` and returning it.

```python
        # Return the response as JSON
        return { "data" : response.json() }
```

Rerun the code, and trigger the route `/netherlands` to check if the COVID data is served. This time it works, and note the difference in regards to the original response from the COVID19 API: it starts with the key `data`.

![Assignment 5 - Netherlands]({{site.baseurl}}/assets/images/task 5-2-2.gif)

# Constant

At this stage, we can make a couple of improvements to our code in `covid.py`.

First, we are duplicating the URL of the COVID19 API. As duplicating is never a good strategy, we suggest to create a constant variable `URL_API` at the top of the file, just after the `import` statement:

```python
# Create a constant 'URL_API' with the URL of the API
URL_API = "http://api.covid19api.com"
```

We can now replace this part of the URL in both functions with `{URL_API}` (using an f-string). This is always a good practice to place all repeating strings as constant at the top of the file.

# Logging

As your code is growing, it becomes hard to keep track of what is happening. It feels appropriate to introduce logs. Logging refers to keeping track of what the programme is doing with regular prompt updates. As we move our user interface from the Terminal to the web browser, the only information we want to show in the Terminal are, in fact, logs. While the function `print()` is good to start with, it has many shortcomings. It can only show information we insert in the Terminal. If we want any extra information, such as the time of incidence or line number from the code emitting this message, we would need to do that ourselves. When switching from debugging to regular execution, we would need to go through the code to remove/comment on all of the `print()` instances. Instead of showing this information in the Terminal, we also often want it in a file or somewhere else. A logger can provide all these functionalities.

- You can `format` the information you want to see for each log;
- You can change the `log level` to quickly switch from `DEBUG` logging (showing many details) to `ERROR` logging (only showing the explicit errors);
- You can change the logging output from the Terminal to a file, or maybe both at the same time.

![Assignment 5 - Netherlands]({{site.baseurl}}/assets/images/task 5-2-2 log.png)

In short, as soon as you start to code more complex programs, logging can save you hours of unnecessary work.

# Task 2.3 Log Errors and Service Access

Python provides the `logging` module to do just that. In `main.py`, add the three following lines of code at the top of the file.

```python
# Import and setup logging
import logging
log_format = "[%(levelname)s] - %(asctime)s : %(message)s in %(module)s:%(lineno)d"
logging.basicConfig(filename='covid.log', format=log_format, level=logging.INFO)
```

The first line is familiar; we are importing the module `logging`. Then, we defined the logging format, what we want to show for each log. This setting shows the log level, the time of execution, the message (the information usually coming from `print()`), and which module and line of code is currently running. The third line puts it all together, saying that we want to write the logs in the file `covid.log`, with the format we have defined above for all logs of level `INFO` or higher. The log levels are as follows: `DEBUG` (lowest), `INFO`, `WARN`, `ERROR` and `CRITICAL` (highest). Thus, the above set would show all logs but `DEBUG`.

Let's make use of these logs. In `covid.py`, we have two `print()` statements to show what went wrong for a failed HTTP request. At the top of the file, import the logging module. We do not need any configuration, as we already set up the logger in `main.py`. Then, replace the two `print()` statement with logs; for instance, replace:

```python
        # Show the error message
        print(f'An error has occurred: HTTP status {response.status_code}')
```

By:

```python
        # Log the error message
        logging.error(f'An error has occurred: HTTP status {response.status_code}')
```

We can also log accesses to our API. In this case, we would use the log level `INFO`. For example, we could generate an info log each time we receive the data with a status of `200` (successful request):

```python
        # Return the response as JSON
        logging.info('Successfully received Dutch data from COVID19 API')
        return { "data" : response.json() }
```

Rerun the code, and trigger the route `/netherlands` to see what happens. The web page should work as before. In _Replit_, You should see much less lines in the Terminal. A file `covid.log` should now exist with a few log statements.

![Assignment 5 - Logging]({{site.baseurl}}/assets/images/task 5-2-3- split screen.gif)

You can experiment with the logging parameters in `main.py`. If you remove the filename, then your logs appear in the Terminal. Suppose you change the level parameter from `logging.INFO` into `logging. ERROR`, then your INFO logs are not appearing anymore. In conclusion, we recommend using the `logging` module instead of `print()` for more complex code that you write, as it helps you diagnose problems more efficiently.

We now have our web server in place, which fetches new data about the most current COVID situation and forwards that to the web browser. Still, this is not a compelling way of presenting this data. That is the goal of Step 3 - Data Visualization.

[Check the code on Replit](https://repl.it/@IO1075/05-covid-dashboard-step2)

[Next: Step 3 - Chart]({{site.baseurl}}/assignments/05-covid-dashboard/step3){: .btn .btn-purple }