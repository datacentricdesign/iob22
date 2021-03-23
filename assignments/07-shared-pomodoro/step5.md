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

In this final step, we bring the state update to the user interface.


# Task 5.1 Update the User Interface

To minimise our work in Javascript in the web browser, we can start with a list of human-readable states. In `pomodoro.py`, above the class, create a list as follows:

```python
stateMessages = [
    "Press Me!", "Work", "Break time",
    "Short Break", "Back to work", "Long break time"]
```

The element 0 of this list match the state `IDLE`, which as the value 0, `WORK` with 1 and so on.

Next, we need to access the websocket inside the Pomodoro class. For this, we add a parameter `socketio` to the constructor. Inside the constructor, we use the attribute `_socketio` to keep track of the socket. Then, in `main.py`, we pass the variable `socketio` as argument of the Pomodoro constructor.

In `pomodoro.py` we can update `changeState`to emit a websocket message each time there is a new state. Note, we use the currentState as index in the list stateMessages to get the appropriate message.

```python
json = {
    'state': self.currentState,
    'message': stateMessages[self.currentState]
}
self._socketio.emit('json', json)
```

Finally, in `index.html`, we need to listen and handle the message coming from the server.


```json
socket.on('json', handleEvent);

function handleEvent(event) {
        console.log(event)
        const messageTag = document.getElementById("text-message")
        messageTag.innerHTML = event.message
    }
```

[Check the code on Replit](https://replit.com/@IO1075/07-shared-pomodoro-step5-1)


[Next: Step 6 - Recap and More]({{site.baseurl}}/assignments/07-shared-pomodoro/step6){: .btn .btn-purple }