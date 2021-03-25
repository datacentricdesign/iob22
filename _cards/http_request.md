---
link-assignment: /assignments/05-covid-dashboard/step2/#task-21-download-summary
---

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