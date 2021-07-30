---
layout: default
title: Step 3 Web Server
parent: '04 Generative Art'
grand_parent: "Computational Thinking"
---

# Step 3 Web Server

{: .no_toc }

## Table of contents

{: .no_toc .text-delta }

1. TOC
{:toc}

---

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/O-GBEIW40vQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## What is Package?

In the previous step, we introduced `modules`. These are files with Python code that we can import and use in our code. While `modules` are files, `packages` are folders hierarchically structuring modules. You can install packages from other developers so that your code can rely on their code. `Packages` opens up whole new horizons: you are not coding everything by yourselves but reusing functions made available by others. We say that your code has 'dependencies', i.e. it depends on packages from other developers.

Installing a package means downloading a folder with subfolders and files (e.g. packages and modules) which contain functions that you can use in your code in the same way you use your modules. As each package can rely on its own set of dependencies, the installation becomes quickly complicated. No worries. `Package managers` are here to handle this process for us.

## What is a Web Server?

In this assignment, we want to move beyond the Terminal inputs and outputs. From this step, the output of the code will appear on a `web page`.

When you use your web browser to open a web page, you are requesting content from a network of computers. These computers are listening for requests and respond with the requested content. They _serve_ content on to _clients_ such as a web browser. We describe here the role of a `webserver`.

Serving the output of our code on a webpage has many advantages for designers. Software is increasingly accessible as web applications, and many devices can display web pages. These make web page an appropriate medium for prototyping, even though the final product or service might rely on different technologies.

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

# Task 3.1 Serve the Radial Lines Drawing

We have all the elements to serve our radial lines drawing on a web page. However, we first need to install the package `Flask` in the project.

On the left panel of _Replit_, click on the third icon (box icon). Type in `Flack` in the search bar, select the first result and click the plus sign `+` to install `Flask` in your project. You notice outputs in the Terminal. They reflect the process of downloading all necessary dependencies for `Flask`.

On the left panel, click on the first icon (file icon). It brings you back to the list of files in your project. The package manager created two new files (`poetry.lock` and `pyproject.toml`) which keep track of the dependencies.

Let's define the algorithm that serves the radial lines drawing.

#### Serving Radial Lines Algorithm

```markdown
Import relevant functions from the module 'drawing'
Import the object Flask from the flask module

Create constant COLOUR for the colour of the drawing
Create constant PATH for where to save the SVG drawing

Create a webserver object called 'Generative Art' and keep track of it in the variable server

Define an HTTP route /radial

Define the function 'serve_radial_lines()' and connect it to the route /radial
Make drawing radial lines and returns it to the client.

Start the webserver
```

In this algorithm, we already know:

- how to import elements from modules
- how to create constants
- how to make drawing radial lines
- how to serve a web page

Write the Python code for the 'Serving Radial Lines' algorithm into `main.py` and execute it.

The Terminal shows a couple of information about the webserver, telling us that it is _running..._. _Replit_ should open a web page above the Terminal.

![Animation Result Assignment 3 - Step 3]({{site.baseurl}}/assets/images/assignment4-step3-1-1.gif)

Ah! The page is not found! Indeed, by default the requested http route is '/' and the Python code only defines the route '/radial'.
Click on the 'extend' icon on the top-right corner of the web page to open the page in a new tab.

![Animation Result Assignment 3 - Step 3]({{site.baseurl}}/assets/images/assignment4-step3-1-3.gif)

You can now edit the URL to add '/radial'

![Animation Result Assignment 3 - Step 3]({{site.baseurl}}/assets/images/assignment4-step3-1-4.gif)

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step3-1)

# Task 3.2 Serve Drawing with Parameters

The next step is to make the HTTP route reusable for a larger set of requests. We want to map information from the URL into argumments for the function make_drawing_radial_lines(). Flask has a convenient way to do mapping. We can specify the parameters in the URL, wrapped between lower than `<` and greater than `>` signs. Then, we add these parameters to the connected function.

#### Serving Custom Radial Lines Algorithm

```markdown
Define an HTTP route /radial/<width>/<height> to serve custom radial lines drawings
Define the function 'serve_custom_radial_lines()' and connect it to the route /radial/<width>/<height>
Convert parameters width and height into integers
Make drawing radial lines with width and height, and return the result
```

The 'Custom Radial Lines' algorithm receives the request, for example, on the route `/radial/200/100`. `200` and `100` are are the arguments for the parameters `width` and `height`. Flask atomatically map them to the function `serve_custom_radial_lines(width, height)`.

Write the code for the route `/radial/<width>/<height>` connected to `serve_custom_radial_lines()`.

Execute the code and load the web page with the route, for example, `/radial/100/200`.

![Animation Result Assignment 3 - Step 2]({{site.baseurl}}/assets/images/task-4-3-3-blank.gif)

Oh, white page, nothing happens, no error!

Let's investigate. To make the radial lines drawing, we call the function `make_drawing_radial_lines(width, height)`, using the argument received from URL. However, if we look into the file `drawing.py`, we defined this function as follows:

```python
def make_drawing_radial_lines(colour="black",
                              width=100,
                              height=100,
                              granularity=5):
```

It starts with the parameter `colour`, and then the `width` and `height`. Thus, we currently call this function providing the argumment `width` to the parameter `colour` and the argument `height` to the parameter `width`. Python does not raise an error because all parameters have default values. However, the colour of value `100` does not represent any colour: nothing appears on the screen.

To solve this issue, there are three options:

- add the colour parameter in the URL so that we can provide this argument, i.e. `/radial/<colour>/<width>/<height>`
- add a default colour when we call the function, i.e. `make_drawing_radial_lines("red", width, height)`
- specify arguments with keywords

Keywords arguments? Indeed, we can explicitly specify the parameter to which each arguments refer. This approach remmove the need for a strict position of each argument. The call would look as follows:

```python
make_drawing_radial_lines(width=width, height=height)
```

Note the parameter is on the left (as specified in the function definition) and the argument is on the right (as received from the URL).

Update the code and execute the code. When refreshing the web page, you should see the radial lines drawing with the specified width and height.

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step3-2)

# Task 3.3 Serve Drawing with Optional Parameters

We avoided to specify the colour for each HTTP request. However, it would be convenient to change the colour of the drawing. To provide optional argument in the URL, we can use the following structure:

```
/radial/<width>/<height>?colour=yellow&granularity=10
```

The optional arguments start with a question mark `?`, then additional arguments are separated with an ampersand `&`. Each argument is provided with its `name` and its `value` connected by an equal sign `=`.

In Python, Flask enables to extract these optional arguments with the request module. Let's import request fromm flask at the top of `main.py`.

```python
# Import the object Flask and request from flask module
from flask import Flask, request
```

To extract an optional argument we can call the function `request.args.get()`. For the argument 'colour', the call would look as follows:

```python
# Check for optional parameter colour as string, otherwise set the colour as "black"
colour = request.args.get('colour', default = "black", type = str)
```

Write the code to extract the colour and granularity arguments from the URL and pass them to the function `make_drawing_radial_lines()`.

Execute the code and refresh, add request the web page with the optional arguments.

![Animation Result Assignment 3 - Step 3]({{site.baseurl}}/assets/images/task-4-3-4.gif)

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step3-3)

At this stage, we moved from the Terminal to a web page. It allows rich, graphical interactions and avoid saving results into files to visualise them.

[Next: Step 4 - Random]({{site.baseurl}}/assignments/04-generative-art/step4){: .btn .btn-purple }
