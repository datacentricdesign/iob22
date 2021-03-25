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

In `pomodoro.py`, let's create a method `shareSetup()` which emit the current Pomodoro setup (i.e. its state) on the WebSocket. This method is similar to `changeState()`. However, in this method  we do not _change the state_, we only emit the message on the WebSocket. The message could include a few extra information such as the `work_duration`, the `break_duration` and the `number_cycles`.

```python
    def shareSetup(self):
        """
        Emit a web socket event to share the current setup with all web clients.
        """
        self._socketio.emit(
            'json', {
                'state': self.currentState,
                'message': stateMessages[self.currentState],
                'work_duration': self.workDuration,
                'break_duration': self.breakDuration,
                'number_cycles': self.numberCycles
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

# Task 5.3 Time Setup

The final task of this assignment focus on adding the ability to control the time of work, time of short break and number of cycles. For this we propose to add three drop down menu on the web page. In `index.html`, add the following structure under the `<svg>` tag.

```html
  <div>Work
    <select id="work-duration">
      <option value="60">1 Minute</option>
    </select>
  </div>
  <div>Break
    <select id="break-duration">
      <option value="60">1 Minute</option>
    </select>
  </div>  
  <div>Cycles
    <select id="number-cycles">
      <option value="1">1</option>
    </select>
  </div>
  <button onclick="saveSetup()">Save</button
```

Feel free to add as the options that seem appropriate. Note that we show a time in minute as it feels natural for the user. However, the associated value is in second because our state machine on the server relies on seconds. At the bottom, the 'Save' button calls the function `saveSetup()` when clicked. Thus, we need to define this handler method. In the `<script>` tag, under the function `pressPomodoro()`, implment a function `saveSetup()`. This function get the selected value of the three drop down menu and place them in a JSON data structure  as `work_duration`, `break_duration` and `number_cycles`. Similarly to the `pressPomodoro()` function, we add a property 'action' with the value 'setup' and send it on the channel 'json'.

```js
    function saveSetup() {
        console.log("setup")
        socket.emit('json', {
          action: 'setup',
          work_duration: parseInt(document.getElementById('work-duration').value),
          break_duration: parseInt(document.getElementById('break-duration').value),
          number_cycles: parseInt(document.getElementById('number-cycles').value),
        });
    }
```

This action property is the data we use to distinguish between a `press` action and a `setup` action. Thus, in `main.py` in the function handler `handle_json_event()` we can chain an additional condition using `elif`. If the action is not `press`, then, is it `setup`. In that case, we need to extract from the data argument the three values provided by the web client: `work_duration`, `break_duration` and `number_cycles`. This looks as follows:

```python
        elif data["action"] == "setup":
            # call the method setup() of pomodoro with work_duration, break_duration and number_cycles from the data dictionary
            pomodoro.setup(data["work_duration"], data["break_duration"],
                           data["number_cycles"])
```

Finally, we need to update the method `setup()` in the Pomodoro class. First, it need to take three parameters (`work_duration`, `break_duration` and `number_cycles`) and set the three corresponding attribute that we already have in the class. Instead of setting directly the state, we can call the method `pause()` which already take care of the `IDLE` state. Finally, we call the method `shareSetup()` to ensure that all connected web client receive the new setup.

```python
    def setup(self, work_duration=300, break_duration=180, number_cycles=3):
        """
        Emit a web socket event to share the current setup with all web clients.

        Parameters
            work_duration:    Duration of work (in seconds, default: 300)
            break_duration:   Duration of breaks (in seconds, default: 180)
            number_cycles:    Number of cycles in a work series (Default: 3)
        """
        self.workDuration = work_duration
        self.breakDuration = break_duration
        self.numberCycles = number_cycles
        self.pause()
        self.shareSetup()
```

Closing the loop we can update the drop down menu (inside `index.html`) as soon as we receive an setup update from the server. For instance, in the function `handleEvent()` we can add the following:

```js
        if (event.work_duration !== undefined) {
          document.getElementById('work-duration').value = event.work_duration
          document.getElementById('break-duration').value = event.break_duration
          document.getElementById('number-cycles').value = event.number_cycles
        }
```

Rerun the code and refresh the page. We now can select the time duration of the work and break period as well as the number of cycles.

[Check the code on Replit](https://replit.com/@IO1075/07-shared-pomodoro-step5-3)

[Next: Step 6 - Recap and More]({{site.baseurl}}/assignments/07-shared-pomodoro/step6){: .btn .btn-purple }