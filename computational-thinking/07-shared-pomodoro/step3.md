---
layout: default
title: Step 3 Interaction
parent: "07 Shared Pomodoro"
grand_parent: "Computational Thinking"

---

# Step 3 Web User Interaction
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

In this step, we create a webserver like in the previous assignments. However, the server needs the ability to communicate with the web browser so that it can share updates of the state machine. For this, we need a web socket.

## What is WebSocket?

WebSocket is a network protocol of the application layer (in the Internet stack) like HTTP (You know what is HTTP by now!). Web socket often used above HTTP to ensure compatibility with the web protocols. While HTTP only enables clients (e.g. web browsers) to communicate with the server, WebSocket enables a bi-directional communication. The server can push data to all connected clients in a more efficient way, whenever it needs to, without the clients having to pull for an update.

# Task 3.1 Setup the Webserver

To create a webserver that support websockets, we can use again use `Flask` library here, together with the extension `SocketIO`. The `SocketIO` package will enable us to implement the websocket for bi-rectional communication.

First let's import these two packages to `main.py`

```python
# Import the package for the web server
from flask import Flask
# Import the package SocketIO for the WebSocket
from flask_socketio import SocketIO
```

Now, we construct both a Flask object and a SocketIO object. Note that we pass the server as an argument of the socketio. SocketIO builds on top of the webserver, taking all it functionalities and adding the ability to handle websockets.

```python
# Create a webserver object called 'Shared Pomodoro' and keep track of it in the variable called server
server = Flask("Shared Pomodoro")
# Create a socketio object to handle web sockets
socketio = SocketIO(server, cors_allowed_origins="*")
```

In your _Replit_ project, create a folder 'static' with a file 'index.html'. To serve this file, we need the (usual) HTTP route '/'.

```python
# Define an HTTP route / to serve the pomodoro page
@server.route('/')
# Define the function 'serve_index_page()' and connect it to the route /
def serve_index_page():
    # Return the static file 'index.html'
    return server.send_static_file('index.html')
```

Finally, we start the server. Once again, we use SocketIO and pass the server as an argument.

```python
# Start the webserver
socketio.run(server, host="0.0.0.0")
```

At this stage, running the code gives us an empty webpage along with the state machine as we have it from Step 2.

[Check the code on Replit](https://replit.com/@IO1075/07-shared-pomodoro-step3-1)

# Task 3.2 Define the webpage

In `index.html` we create the user interface of our Shared Pomodoro. We first need an `HTML` structure with `<html>`, `<head>` and `<body>`. We use `title` to set the name of the web browser tab, and `<h1>` for the heading on the page. Finally, we had the Javascript library `socket.io` which gives the ability to our page to communicate with the server over websocket.

```html
<!DOCTYPE html>
<html>

<head>
  <title>Shared Pomodoro</title>
	<script src="https://cdn.socket.io/socket.io-3.0.1.min.js">
	</script>
</head>

<body>
  <h1>Shared Pomodoro</h1>
</body>

</html>
```

Feel free to add some style (tag `<style>` in the `<head>`) to customise the page. This is the style we use in the example, applied to `<body>`:

```css
body {
    padding:30px;
    text-align:center;
    background-color: #f2be8a;
    max-width: 400px;
    margin:auto;
    font-family: "Ranchers";
}
```

Note: for the sake of customisation, we changed the font to 'Ranchers'. To make this font available we need to had the following tag inside `<head>`:

```html
<link href="https://fonts.googleapis.com/css2?family=Ranchers&display=swap" rel="stylesheet"> 
```

We can pick a font for example from [Google Fonts](https://fonts.google.com/)

Finally, we had the SVG drawing of the 'pomodoro' below the `<h1>`

```xml
	<svg
	 xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" width="400" height="400" viewBox="0 0 120 120" version="1.1">
   <ellipse onclick="pressPomodoro()" style="fill:#800000;cursor:pointer" cx="60" cy="60" rx="50" ry="40">
    </ellipse>
		<path style="fill:#008000;" d="m 60,20 c 0,0 -18,-6 -27,7 -9,14 23,-2 23,-2 0,0 -4,5 3,15 12,16 12,-3 2,-19 0,0 30,20 36,16 5,-4 -21,-26 -37,-17 z" />
		<path style="fill:#008000;" d="m 60,20 -3,-9 2,-2 z" />
		<text onclick="pressPomodoro()" text-anchor="middle" style="cursor:pointer;" x="60" y="70" id="text-message"></text>
	</svg>
```

This is a beautiful drawing of course! In this SVG structure the `<ellipse>` tag for the body of the tomato while the two `<path>` compose the leaf.

<svg
	 xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" width="400" height="400" viewBox="0 0 120 120" version="1.1">
<ellipse onclick="pressPomodoro()" style="fill:#800000;cursor:pointer" cx="60" cy="60" rx="50" ry="40">
</ellipse>
    <path style="fill:#008000;" d="m 60,20 c 0,0 -18,-6 -27,7 -9,14 23,-2 23,-2 0,0 -4,5 3,15 12,16 12,-3 2,-19 0,0 30,20 36,16 5,-4 -21,-26 -37,-17 z" />
    <path style="fill:#008000;" d="m 60,20 -3,-9 2,-2 z" />
    <text onclick="pressPomodoro()" text-anchor="middle" style="cursor:pointer;" x="60" y="70" id="text-message"></text>
</svg>

The `<text>` tag sits empty in the middle. This is where we will display the Pomodoro state. Note that SVG support CSS styling like HTML with the attribute 'style'. In this drawing, we added two element to make it interactive.

* `<text>` has a attribute 'id' which we can use to set the text as the pomodoro state change.
* Both `<ellipse>` and `<text>` have an 'onclick' attribute which define a handler. As we saw in Step 1 to handle in Python a `CTRL-C` event, here we handle the click of the mouse as an event. Each time we click on the text or the red ellipse, it triggers the function `pressPomodoro()`.

[Check the code on Replit](https://replit.com/@IO1075/07-shared-pomodoro-step3-2)

# Task 3.3 Send Press Event

As we mentioned in the previous assignments, JavaScript is the language to handle the web page behaviour. When we click on the Pomodoro, the function `pressPomodoro()` is a Javascript function. The code to handle the event looks as follows. We first create a weksocket connection, and then we define the function `pressPomodoro()` which use the websocket to 'emit' (e.g. send) a message to the server. This message is emitted on the channel 'json' and is structured as a JSON data structure with a value 'press' attached to the key 'action'.

```html
<script>
    const socket = io();
    function pressPomodoro() {
        socket.emit('json', {action: 'press'});
    }
</script>
```

Add this script inside the `<head>` tag of `index.html`. This is all we need to do to capture a 'click' event and send a message via the websocket to the Python webserver.

Back in `main.py`, we want to receive the message emitted by the web page. The following snippet of code give an example of how to achieve this. Similarly to an HTTP route, we first 'listen' to event on the 'json' channel. We define a handler, a function which is trigger when a new message arrive on the 'json' channel. This function as one parameter 'data': the data received from the web page. As all JSON data-structure in Python, the data we received here is also in `Dictionary` format. We check if the key 'action' exists in this dictionary and if this action is 'press'. In that case, we can call the method `press()` of the Pomodoro object.

```python
# Define a Websocket event 'json'
@socketio.on('json')
# Define the function 'handle_json_event()' with a parameter 'data' (dictionary) and connect it to the event 'json'
def handle_json_event(data):
    # Log all event data with he debug level 'debug'
    logging.debug('received message: ' + str(data))
    # if there is a key 'action' in the dictionary 'data'
    if "action" in data:
        # if the action is 'press'
        if data["action"] == "press":
            # call the method pressButton() of pomodoro
            pomodoro.press()
```

Remove the `pomodoro.press()` that we used so far to simulate a 'press' event. Then, add the above code right after constructing the object 'socketio'.

Run the code and trigger the HTTP route '/'. When clicking on the Pomodoro drawing, the server logs should indicate a change of state to `WORK`, and then continuously asking 'Is time over?'

[Check the code on Replit](https://replit.com/@IO1075/07-shared-pomodoro-step3-3)

We deliberately went fast through this step, with explanation and copy paste. The core of this assignment is to practice Python rather than web technologies. However, it gives a concrete example of Websocket enabled user interface that we will build upon in the next steps.

[Next: Step 4 - Time]({{site.baseurl}}/assignments/07-shared-pomodoro/step4){: .btn .btn-purple }
