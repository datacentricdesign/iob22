---
link-assignment: /assignments/07-shared-pomodoro/step1/#what-is-a-handler
---

## What is a Handler?

A handler is a function that the programme calls in response to an any event occured user intervention or any error. In our case, we want to stop the Pomodoro state machine and exit the programme when the user presses `CTRL-C`.

Let's implement the our handler here by first defining a function `handle_control_c()` with two parameters 'signal' and 'frame'. In this function, call the Pomodoro method `stop()`, then call the function `exit()` (to close Python).

First we have to import `signal` file at the top of the `main.py`

```python
import the Python module `signal`
```

then we connect the event to the handler function. For this, add the following line at the bottom of the file:

```python
# Listen for a CTRL+C event and call the function handle_control_c for each occurence
signal.signal(signal.SIGINT, handle_control_c)
```

This line relies on the module `signal`, saying there is an event `SIGINT` (e.g. a SIGnal INTeruption such as `CTRL+C` pressed on the keyboard), then call the function `handle_control_c()`.

Note that the module `signal` imposes the parameters 'signal' and 'frame'. A function handler must have these two parameters to handle an event from the module `signal`. They provide information about the triggered event.