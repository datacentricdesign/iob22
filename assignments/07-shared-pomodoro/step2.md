---
layout: default
title: Step 2 State Machine
parent: "07 Shared Pomodoro"

---

# Step 2 State machine
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

Let's bring back the state diagram.

![Assignment 7 - State Machine]({{site.baseurl}}/assets/images/assignment7-step1-state-machine.svg)

On this model, there are six states to transition to: `IDLE`, `WORK`, `BREAK_ALARM`, `SHORT_BREAK`, `WORK_ALARM`, `LONG_BREAK`

# Task 2.1 Define States

A state is a value. Any choice of six different value would work. To make it simple, we take the values 0 to 5. In `pomodoro.py`, define six constant variables for the six states at the top of the file. For example, this is how we define `IDLE`:

```python
IDLE = 0
```

Then, we need to initialise our state machine. On the diagram, there is the method `setup()` which brings us to the initial state `IDLE`. In this method, initialise the attribute `currentState` to `IDLE`. As we need to apply this as soon as we construct the Pomodoro object, call `setup()` in the constructor.

Each time we transition from one state to another, we change the attribute `currentState` with the new state. Create a method `changeState` which takes a parameter `state` (the new state). In this method, set `currentState` to the new state and log a message 'Transition to [NEW STATE]' so that we can see what happens.

Run the code to check we have so far. We can see Construction, setup and start appearing in the logs before endlessly check the state.

[Check the code on Replit](https://replit.com/@IO1075/07-shared-pomodoro-step2-1)

# Task 2.2 Change State

We have states and a looping state machine. However, it does not transition to any state yet. It is time to go back to the `checkState()` method, where we continuously start a new 1-second timer. In addition to setting the timer, we want to check whether we should transition to a new state. We propose to build a long chain of condition. This is how we start completing `checkState()`:

```python
if self.currentState == IDLE:
    if self.isPressed():
        self.startWork()
```

Reading the state machine diagram, continue with `elif` statement to check each state (e.g. `IDLE`), check the exit condition (e.g. `isPressed()`) and call the transition method (e.g. `startWork()`).

Conclude with a `else` statement with a log message to show that the state is unknown. In theory we should never reach that stage, but it makes error easier to detect.

Run the code to see what we have. For this tasks we wrote 20 lines of code, but the programme is not doing much more. The only difference is the message 'Is Pressed?' for every check. To transition from `IDLE` to `WORK`, we have to... press the device!

[Check the code on Replit](https://replit.com/@IO1075/07-shared-pomodoro-step2-2)

# Task 2.3 Define Press Event

To offer the ability to 'press' the pomodoro timer, we will need to define what the button should do when it pressed.

To do this sofasticatedly, we need three elements:

* First, we need an attribute `_pressStatus` to keep track of this status. In the constructor initialise the attribute `_pressStatus` to `False` (e.g. not pressed);
* Second, we need the ability to change this status. Define a method `press()`. In this method, set the attribute `_pressStatus` to `True` and add a log 'Pomodoro pressed';
* Finally, we need the ability to switch back to `False`. We can do this in `isPressed()`. Each time we check whether the pomodoro is pressed, we check `_pressStatus`. If it is `True`, switch back `False` and return `True`, otherwise return `False`. This make sure this method return true only once before swtching back to `False`.

Back in `main.py`, we can check the press mechanism by calling the method `press()` after calling the method `start()`.

Run the code to see what happen. We can see the message 'Pomodoro pressed', which lead in the next check to 'Start work'. But then, it starts checking again for 'Is Pressed?'. Why?

Well, we are not changing state so far. We call the method `startWork()` when the device is pressed, but we do nothing more than printing a log. Have a look at the `startWork()` method. In this method, add a call to the method `changeState()`. Has argument, give it the state we want to transition to: `WORK`.

Rerun the code. This time after 'Start work' we can see '1', the value of the state `WORK`. Then, the question become 'Is time over?'

Have a look at the state diagram again. Similarly to `startWork()`, for each transition method into a new state, add a call to `changeState` with the appropriate state.

[Check the code on Replit](https://replit.com/@IO1075/07-shared-pomodoro-step2-3)

Now that we have state machine have implemented for our code, We are ready to connect this state machine to a web interface.

[Next: Step 3 - Web Socket ]({{site.baseurl}}/assignments/07-shared-pomodoro/step3){: .btn .btn-purple }