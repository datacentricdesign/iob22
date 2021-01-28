---
layout: default
title: Step 3 Web Server
parent: "04 Generative Art"
---

# Step 3 Web Server
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## What is Package?

In the previous step, we introduced the concept of module: code in a different file that we can import and use in our code. While `modules` are files,  `packages` are folders hiearchicaly structuring modules. You can install packages from other developers so that your code can rely on their code. This opens up whole new horizon: you are not coding everything by yourselves but reuse functions made available by others. We say that your code has 'dependencies', i.e. it depends on packages from other developers.

Installing a package means downloading a folder with subfolders and files (e.g. packages and modules) which contain functions that you can use in your code in the same way you use your own functions. As each package can relies on its own set of dependencies, the installation is becoming quickly complex.

No worries. `Package managers` are here to handle this process for us.


## What is a Web Server?

In this assignment, we want to move beyond the Terminal inputs and outputs. From this point, we will rely on showing the output of the code on a web page. When you use your web browser to load a web page, you are requesting content from a network of computers which are listenning for requests are respond with the requested content: they serve content on the web. We describe here the role of a `web server`.

Serving the output of our code on a webpage as many advantages for designers: software are increasingly web application and web pages display on a vast number of devices. This makes them a good medium for a prototype, even though the final product or service might be build with different technologies.

## What is a Endpoint?

Then, we have the definition of an HTTP route. This means that we connect the url of our web page to our python code. For instance, on the TU Delft web site, the route below would define the behaviour of `https://tudelft.nl/`. Here, the important element is the final slash `/`. To attach this route to a block of Python code, we simply define a function

Elements

* HTTP route
* `function_name` The name 
* `response` 

#### Endpoint Algorithm

```markdown
When you receive a request from a web client on the route `/`;
Call function_name;
Send response to the web client
```

#### Endpoint Python Syntax

```python
@server.route('/')
def function_name()
    return response
```

Note the at sign `@` which is called a decorator. 

# Task 3.1 Serve the Radial Lines Drawing

When we can use code from other developers, it becomes easier to setup a web server. From this assignment, we will use the package `Flask`. This is a common package to setup a web server in Python.

In _Replit_, on the left panel, click on the third icon (box icon). Type in `Flack` in the search bar, select the first result and click the plus sign `+` to install `Flask` in your project. You will notice some output in the Terminal, reflecting the process of downloading all dependencies necessary for using the `Flask`.

On the left panel, click on the first icon (file icon) to go back to the list of files in your project. You will notice two new files which are keeping track of the dependencies for your project.


#### Serving Radial Lines Algorithm

```markdown
Import relevant functions from the module 'drawing'
Import the object Flask from the flask module

Create constant COLOUR for the colour of the drawing
Create constant PATH for where to save the SVG drawing

Create a Flask web server and keep track of it in the variable server

Define an HTTP route
Attach the route to the function serve_radial_lines()
    Make drawing radial lines and return it to the web client

Start the web server
```

In this algorithm, we know how to import elements from modules, how to create constant and how to make drawing radial lines. Creating a Flask web server is similar to creating a file. It requires an `string` argument which will be the name of the web server.

```python
server = Flask('Drawing some Art!')
```


```python
server.run('0.0.0.0')
```

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step3-1)


# Task 3.2 Serve Drawing with Parameters

[TODO endpoint with parameters, passed as function arguments]

Mapping argument fromm the route `<value>`

Keywords arguments, so that we can skip some parameters (which have default values)

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step3-2)

# Task 3.3 Serve Drawing with Optional Parameters

[TODO endpoint with optional parameters]

need to import requests from flask

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step3-3)

At this stage we moved from the Terminal to a web page. This allows richer, more graphical interactions and avoid saving results into files to visualise them.

[Next: Step 3 - Web Server]({{site.baseurl}}/assignments/04-generative-art/step4){: .btn .btn-purple }