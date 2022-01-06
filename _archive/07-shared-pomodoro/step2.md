---
layout: default
title: Step 2 State Machine
parent: "07 Shared Pomodoro"
grand_parent: "Computational Thinking"

---

# Step 2 State machine
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

To starts with let's look again at the state diagram.

![Assignment 7 - State Machine]({{site.baseurl}}/assets/images/assignment7-step1-state-machine.svg)

On this model, there are six states to transition to: `IDLE`, `WORK`, `BREAK_ALARM`, `SHORT_BREAK`, `WORK_ALARM`, `LONG_BREAK`

# Task 2.1 Define States

A state is a value. Any choice of six different values would work. To make it simple, we take the values 0 to 5. In `pomodoro.py`, define six constant variables for the six states at the top of the file. For example, this is how we define `IDLE`:

```python
IDLE = 0
```

Then, we need to initialise our state machine. On the diagram, there is the method `setup()`, which brings us to the initial state `IDLE` (in orange). In this method, initialise the attribute `currentState` to `IDLE`. As we need to apply this as soon as we construct the Pomodoro object, call `setup()` in the constructor.

Each time we transition from one state to another, we change the attribute `currentState` with the new state. Create a method `changeState`, which takes a parameter `state` (the new state). In this method, set the attribute `currentState` to the new state and log a message 'Transition to [NEW STATE]'. The log helps us to see what happens when running the programme.

Run the code to check what we have so far. We can see construction, setup and start appearing in the logs before endlessly checking the state.

[Check the code on Replit](https://replit.com/@IO1075/07-shared-pomodoro-step2-1)

# Task 2.2 Change State

For now, we have states and a looping state machine. However, it does not transition to any state yet. Because we haven't implemented it. So it is time to go back to the `checkState()` method, where we continuously start a new 1-second timer. Here, in addition to setting the timer, we want to check whether we should transition to a new state. We propose to build a long chain of condition in `checkState()`. Something like this:

```python
if self.currentState == IDLE:
    if self.isPressed():
        self.startWork()
```

The code above represent the transition from `IDLE` state to `WORK` state using `if` statement to check each state (e.g. `IDLE`), check the exit condition (e.g. `isPressed()`) and call the transition method (e.g. `startWork()`). You can extend this code uisng `elif` statement to check (e.g. `WORK`) state and the condition(e.g. isTimeOver()) and call the transition method (e.g. 'ringBreakAlarm()').

At the end, you can conclude with an `else` statement with a log message that says  "the state is unknown". In theory, we should never reach that stage, but it makes error easier to detect.

Run the code to see what we have. For this task, we wrote 20 lines of code, but the programme is not doing much more. The only difference is the message 'Is Pressed?' for every check. To transition from `IDLE` to `WORK`, we have to implement the function that changes the state when we press the device!

[Check the code on Replit](https://replit.com/@IO1075/07-shared-pomodoro-step2-2)

# Task 2.3 Define Press Event

To offer the ability to 'press' and change the state in the Pomodoro timer, we need to define what the device should do when pressing it.

To do this, we need three elements:

* First, we need an attribute `_pressStatus` to keep track of this status. In the constructor (`__init__`) initialise the attribute `_pressStatus` with its initial value `False` (e.g. not pressed);

* Second, we need the ability to change this status. To do this, define a method called `press()`. In this method, set the attribute `_pressStatus` to `True` and add a log 'Pomodoro pressed';

```python
def press(self):
    """
    Use _buttonStatus as a flag so that for the next check state the button is 'pressed'.
    """
    logging.debug("Pomodoro pressed")
    self._pressStatus = True
```

* Finally, we need the ability to switch back to `False`. We can do this in our `isPressed()` method that we created earlier. Here in `isPressed()`, each time we check whether the Pomodoro is pressed, we check `_pressStatus`. If it is `True`, switch back to `False` and return `True`, otherwise return `False`. This makes sure this method return true only once before switching back to `False`.

```python
def isPressed(self):
    logging.debug("Is Pressed?")
    if self._pressStatus:
        # Switch back button status to False, so that it is taken into account only once
        self._pressStatus = False
        return True
    return False
```

Back in `main.py`, we can check the press mechanism by calling the method `press()` after calling the method `start()`.

Run the code to see what happen. We can see the message 'Pomodoro pressed', which leads in the next check to 'Start work'. But then, it starts checking again for 'Is Pressed?'. Why?

Well, we are not changing the state so far. We call the method `startWork()` when we press the device, but we do nothing more than printing a log. Have a look at the `startWork()` method. In this method, add a call to the method `changeState()`. As an argument, give it the state we want to transition to: `WORK`.

Rerun the code. This time after 'Start work', we can see `1`, the value of the state `WORK`. Then, the question becomes: 'Is time over?'

Have a look at the state diagram again. Similarly to `startWork()`, for each transition method into a new state, add a call to `changeState` with the appropriate state.

[Check the code on Replit](https://replit.com/@IO1075/07-shared-pomodoro-step2-3)

Now that we have implemented an initial state machine for our code, we can connect this state machine to a web interface.

[Next: Step 3 - Web Socket ]({{site.baseurl}}/assignments/07-shared-pomodoro/step3){: .btn .btn-purple }