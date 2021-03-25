---
link-assignment: /assignments/04-generative-art/step3/#what-is-an-http-route
---

## What is an HTTP route?

Then, we have the definition of an HTTP route. It means that we connect the URL of the web page (i.e. `https://tudelft.nl/io`) to a function in the Python code. For instance, on the TU Delft website, we reach the IO Faculty web page with the route `/io`. To connect an HTTP route to our code, we need the following elements:

- `HTTP_route` The 'web page' we want to access from the web browser such as `/io`
- `function` The definition of a Python function to call when a client requests the `HTTP_route`
- `response` The content to send to the client in response to the request

#### Serve web page Algorithm

```markdown
Listen on [HTTP_route]
When receiving a request on [HTTP_route];
Call [function];
Return [response] to the client
```

Note the 'when', indicating that the webserver continuously listen and call the function for each new request. In Python, this algorithm involves complicated tasks such as listening on the network, managing requests from web clients and sending back a response on the network. However, we can install a `package` that take care of all these tasks for us. In this assignment, we use the package [Flask](https://flask.palletsprojects.com/en/1.1.x/).

#### Serve web page Python Syntax (Flask)

```python
# Create a webserver object and keep track of it in the variable server
server = Flask('My server name')
# Define an HTTP route /io
@server.route('/io')
# Define the function 'welcome_to_io()' and connect it to the route /io
def welcome_to_io()
    # Return a message 'Welcome to IO!' to the client
    return "Welcome to IO!"
# Start the webserver
server.run('0.0.0.0')
```

Note the at sign `@` in front of 'server'. This is a `decorator`. There is no need to understand this mechanism at this stage. Only remember that it allows to _connect_ the HTTP route to the following function definition. Thus, both definitions (route and function) must be written next to each other, without any line of code in between.

The web server starts with the argument `0.0.0.0`. It allows the webserver to be accessed from the network.