---
layout: default
title: Step 5 WebSocket
parent: "07 Shared Pomodoro"

---

# Step 5 WebSocket
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

In this final step, we bring the state update to the user interface. As we mentioned in Step 3, we use the WebSocket protocol to allow the server to push updates to the client. This is time to put this into practice. We want to establish the following sequence:

![Assignment 7 - WebSocket Sequence]({{site.baseurl}}/assets/images/assignment7-step5-sequence.svg)

# Task 5.1 Update the User Interface

To minimise our work in Javascript in the web browser, we can start with a list of _human-readable_ states. In `pomodoro.py`, above the class, create a list as follows:

```python
stateMessages = [
    "Press Me!", "Work", "Break time",
    "Short Break", "Back to work", "Long break time"]
```

In this list, the element at index `0` matches the state `IDLE`, which has the value `0`. Then, `WORK` matches the second value with 1 and so on. For example:

```
print(stateMessages[WORK_ALARM])
```

This example prints the value "Back to work", using the constant value WORK_ALARM as the index to select an element in the list. 

Next, we need to access the WebSocket connection from inside the Pomodoro class. This enables any method in the class to send messages through WebSocket to the web client. For this, we add the parameter `socketio` to the constructor. Inside the constructor, we use the attribute `_socketio` to keep track of the socket.

Then, in `main.py`, we pass the variable `socketio` as an argument of the Pomodoro constructor.

In `pomodoro.py`, we can update `changeState` so that it emits a WebSocket message for each state change. Note, we use the `currentState` as index in the list `stateMessages` to get the appropriate message.

```python
json = {
    'state': self.currentState,
    'message': stateMessages[self.currentState]
}
self._socketio.emit('json', json)
```

Finally, in `index.html`, we need to listen for WebSocket messages coming from the webserver. We define a Javascript function `handleEvent()` which is called for each incoming messages. This looks as follows. Paste this code in `index.html` below the function `pressPomodoro()`.

```js
// Listen for WebSocket message on the `json` channel
socket.on('json', handleEvent);

function handleEvent(event) {
    console.log(event)
    const messageTag = document.getElementById("text-message")
    messageTag.innerHTML = event.message
}
```

In this function, the parameter content the event -- the JSON message sent by the webserver. We look for the tag `<text>` in the drawing, locating it by its id `text-message`. We inject inside this tag the message from the event.

Rerun the code. When clicking (pressing) on the Pomodoro, the state machine switch to work, leading to a message sent to the webclient, and 'Work' should appear on the drawing.

[Check the code on Replit](https://replit.com/@IO1075/07-shared-pomodoro-step5-1)

# Task 5.2 Share Current Setup

The web page is now receiving all state change from the server, showing the receive message on the Pomodoro. However, when we load the page, there is no message: we need to wait the next state change to receive an update and show the message. We can improve this by sending the setup as soon as the web client connect to the WebSocket.

In `pomodoro.py`, let's create a method `shareSetup()` which emit the current Pomodoro setup (i.e. its state) on the WebSocket. This method is the same as the method `changeState()`. The only difference is that we do not _change the state_, we only emit the message on the WebSocket.

```python
    def shareSetup(self):
        """
        Emit a web socket event to share the current setup with all web clients.
        """
        self._socketio.emit(
            'json', {
                'state': self.currentState,
                'message': stateMessages[self.currentState]
            })
```

Now, when is the right moment to call this method? We could for instance call it each time a web client is connecting to the server. In `main.py`, this would look as follows: 

```python
# Define a Websocket event 'connect'
@socketio.on('connect')
# Define the function 'handle_connect_event()' and connect it to the event 'connect'
def handle_connect_event():
    # call the method shareSetup() of pomodoro
    pomodoro.shareSetup()
```

You can recognise the say syntax as for receiving messages on the channel `json`. Instead we use the channel `connect`. The handler calls the method `shareSetup()` that we just defined in the Pomodoro class.

Rerun the code. This time, the message 'Press Me!' (for the `IDLE` state) should appear on the Pomodoro device.

[Check the code on Replit](https://replit.com/@IO1075/07-shared-pomodoro-step5-2)

[Next: Step 6 - Recap and More]({{site.baseurl}}/assignments/07-shared-pomodoro/step6){: .btn .btn-purple }