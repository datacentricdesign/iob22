---
layout: default
title: "Web Application"
parent: "Communication"
grand_parent: "Prototyping"
has_children: false
---

The purpose of this tutorial is to explore the basics of web servers and REST API.

# Flask

[Flask](https://palletsprojects.com/p/flask/) is a python Web server.

Like other Python library, you can install it using pip. In your Atom Terminal, 
type in:

```bash
python3 -m pip install Flask
```

In Atom, create a new folder 'web' in your project. Then, create a file server.py
and insert the following.

```python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run()
```

This code import the flask library and create an 'app', a typical name to refer
to the web application you start building.

The line starting with '@' is an annotation, used to complement the code. In this
context, we specify a web path, the root '/', to trigger the function hello_world()
right bellow.

Finally, the script define the 'main', where the programme start. In this case 'run'
our app, meaning we start the web server.

In the terminal, execute the Python file to start the web server:

```bash
python3 web/server.py
```

![Flask Start]({{site.baseurl}}/assets/images/flask_start.png)

Open a web browser and type in: http://localhost:5000/

You should see appear a 'Hello world' on the web page. This is the result of the
hello_world function. In Atom, in the hello_world function, you can change the 
message. Then, in the terminal, stop the server (Ctrl+C) and execute your script
again (Arrow up + Enter). Back in the web browser, refreshing the page should display
your new message.

## External Access

For now, this web page is only accessible from your computer. In your Python code,
at the bottom, you can provide a parameter host='0.0.0.0' to the run function to
remove this constraint:

```python
if __name__ == '__main__':
    app.run(host='0.0.0.0')
```

This means that your server will accept incoming request from any source.

Note: on some platform you might also need to disable/create a rule for your Firewall.

Look up your ip address with the command ifconfig (Mac/Linux) or ipconfig (Windows).

Once you have rerun the script, use a phone or the computer of a peer to look at
your web page with this IP address.

For information, [Fullstack](https://www.fullstackpython.com/flask.html) provides
some useful information to go further.

# REST API

So far we created GET HTTP requests, the default action. However, a RESTFul API
can include more than that. Here is an informative link:
[REST API](https://restapitutorial.com/).

Let's create a sensor API to read, list and create sensors. You can notice the path
variable 'sensor_id' becoming a variable in the method. Do not forget to import
request (at the top of the file) to import the body of the POST request.

```python
from flask import Flask, request

app = Flask(__name__)

sensors = ['sensor1', 'sensor2', 'sensor3']

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/api/sensors', methods = ['GET'])
def list():
    return str(sensors)

@app.route('/api/sensors/<path:sensor_id>', methods = ['GET'])
def read(sensor_id):
    global sensors
    return sensors[sensor_id]

@app.route('/api/sensors', methods = ['POST'])
def create():
    sensors.append(request.json["sensorName"])
    return 'Added sensor!'


if __name__ == '__main__':
    app.run(host='0.0.0.0')
```

The web browser's url bar is limited as it works only for 'GET' requests. To explore
other HTTP verbs and possibilities, Postman is a convenient tool:
[Postman](https://www.getpostman.com/downloads/).

Once you installed and open Postman, you can create any type of HTTP requests to
be executed.

The following screens shows the List and Create in Postman:

![Postman List]({{site.baseurl}}/assets/images/postman_list.png)

![Postman Create]({{site.baseurl}}/assets/images/postman_create.png)

# Web page

Web development is a whole world of dedicated languages and technologies. Here we
will just scratch the surface. The key principle:

* There is code running on the server side. This is the piece of code we have 
been writing so far, our REST API;
* There is code running on the client side. This code runs is your web 
browser (the client).

The client side first download the files it needs from the server, and execute them.

Simplifying, the client runs three type of files.

* html: the structure of the web page
* js: the execution
* css: the style

In your web folder, create a 'static' and 'templates'. In templates, create a file
'index.html' with the following:

![html base]({{site.baseurl}}/assets/images/html_base.png)

The double curly bracket signs represents template element to be replace. In this case, Flask will
replace with the full path of the css file.

In the static folder, create a sub folder css with the file style.css:

```css
body {
    background-color: #DFDFDF;
}
h1 {
    font-family: Helvetica,serif;
    font-weight: bold;
}
```

Back to your Python script, add the following endpoint. You can notice we need 
to add 'render_template' at the top of the file.

```python
from flask import Flask, request, render_template

@app.route('/home')
def home():
    return render_template('index.html')
```

Rerunning the script, at the url localhost:5000/home the web browser should show
the following result:

![Html]({{site.baseurl}}/assets/images/html_example.png)

# Visualisation

In this step, we propose to create a basic visualisation with the library
[D3js](https://d3js.org/). This library has the advantage to have an extensive 
gallery of examples to adapt to our needs.

Here is one Gauge example: [Gauge](http://bl.ocks.org/brattonc/5e5ce9beee483220e2f6)

Copy the code in your an file gauge.html, next to the index.html. You will notice
in the <head> tag, there is a dependency to liquidFillGauge.js

```html
<script src="liquidFillGauge.js" language="JavaScript"></script>
```

This does not start with http://..., thus it is a local file. We need to get this file
and store it in our project. The easier way is to right-click on the example web page,
then 'inspect'. In the inspection tool, select the tab 'Network' and reload the page.
Look in the list for the liquidFillGauge.js, right-click > Copy > Copy Response.
Finally, paste the content in your project, in static/js/liquidFillGauge.js

![Retrieve local dependencies]({{site.baseurl}}/assets/images/html_gauge_example.png)

In gauge.html, replaced the mentioned tag by:

![html_template]({{site.baseurl}}/assets/images/html_template.png)

# Web socket

Web sockets enables low latency bi-directional communications between the
clients and the server. With Flask, Socketio is a library to do that:
[Flask-socketio](https://flask-socketio.readthedocs.io/en/latest/)

In this example, we want to have all open web pages to receive updated values
in real time.

Install with pip

```bash
python3 -m pip install flask-socketio
```

At the top of the Python file

```python
from flask import Flask, render_template, request
from flask_socketio import SocketIO, emit

app = Flask(__name__)

app.config['SECRET_KEY'] = 'secret!'
socketio = SocketIO(app)
```

We add a socket handler JSON after our sensors' endpoints:

```python
@socketio.on('json')
def handle_json(json):
    print('received json: ' + str(json))
    emit('json', json, broadcast=True)
```

At the bottom of the Python script, we replace the Flask app by the one from
SocketIO.

```python
if __name__ == '__main__':
    # app.run(host='0.0.0.0')
    socketio.run(app, host='0.0.0.0')
```

Inside the <head> tag of gauge.html:

```html
<head>
    ...

    <script src="//cdnjs.cloudflare.com/ajax/libs/socket.io/2.2.0/socket.io.js"
                integrity="sha256-yr4fRk/GU1ehYJPAs8P4JlTgu0Hdsp4ZKrx8bDEDC3I="
                crossorigin="anonymous"></script>
    <script type="text/javascript" charset="utf-8">
      var socket = io();
      socket.on('connect', function() {
        // socket.emit('json', {data: 'I\'m connected!'});
      });
    
      socket.on('json', function(msg, cb) {
        if (msg.data !== undefined) {
          gauge1.update(msg.data)
        }
      });
    
    
      function sendMessage(message) {
        socket.emit('json', {data: NewValue()});
      }
    </script>

    ...
</head>
```

At the top of the <body> tag, we can add a button to trigger the sendMessage
function:

```html
<body>
    <button onclick="sendMessage('click!')">Click!</button>
    ...
</body>
```

You can rerun the script and load the page in multiple web browser / devices. When
you click on the 'click' button, it should update the top gauge in all web browsers.
