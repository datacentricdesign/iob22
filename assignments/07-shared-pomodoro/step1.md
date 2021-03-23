---
layout: default
title: Step 1 Review
parent: "07 Shared Pomodoro"

---

# Step 1 Review
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

The core of this assignment is to develop a state machine. The following diagram presents how we propose to model the Pomodoro timer as a state machine.

![Assignment 7 - State Machine]({{site.baseurl}}/assets/images/assignment7-step1-state-machine.svg)

First let's try to understand this diagram:

In the diagram, each circle re-present individual state in the program. The `setup()` method (with two circles on the left) leads us to the starting point: the `IDLE` state. When the user 'press' the device it move to the `WORK`. This state remains until the time we set as work time is over. In this situation, the `BREAK_ALARM` start ringing (i.e. it is time for a break). There is only one good condition to leave this state: the user must press the device.

However, the Pomodoro timer can transition to a `SHORT_BREAK` or a `LONG_BREAK` state. This depends on how many work/short-break cycles we already completed. If we have to complete more cycles, we go for the `SHORT_BREAK` leading to a `WORK_ALARM`. Otherwise, it is time for a `LONG_BREAK`, which end whenever the user decides to press the device.

With this state-machine in mind we first start with creating a `Pomodoro` class with all the methods to perform the state checks (is something true) and transition (do something).

# Task 1.1 Define the Pomodoro class

Let's start with what we already know from the previous assignments. Go to _Replit_ and create a new project for this Python programming assignment. Create a file `pomodoro.py` with a class `Pomodoro` and define a constructor. Look at the state diagram and create a method for is check (e.g. `isTimeOver()`) and each transition (e.g. `ringBreakAlarm()`).

In this assignment, logs are handy to track what is happening in our state machine precisely. It also creates the 1-line that we need in each method to have a valid Python code (a Python method cannot be empty). Import the logging module in at the top of the `main.py`, setting up the level (`DEBUG` for now) and the format, and add a debug log in each method, for example:

```python
# Import and setup logging
import logging
log_format = "[%(levelname)s] %(asctime)s [%(module)s:%(lineno)d] %(message)s"
logging.basicConfig(format=log_format, level=logging.DEBUG)
```

Then, in `pomodoro.py`, import the logging module at the top of the file and add a debug log in each method. For example:

```python
def setup():
    logging.debug("Setup")
```

To use the Pomodoro class, import it in `main.py` and create a Pomodoro object.

Run the code. As our Pomodoro class is not yet doing much, only one log should appear: the one we put in the constructor.

[Check the code on Replit](https://replit.com/@IO1075/07-shared-pomodoro-step1-1)

# Task 1.2 Check the States

The next step is to regularly check the state of the state machine to decide whether it is time to transition towards a new state. For this, the Python's `threading` module has a helpful class called `Timer`. It runs a piece of code after a given period. We can use this class to check the state every second.

Let's implement this by importing the class `Timer` from the module `threading` at the top of `pomodoro.py`. Then, create a method `checkState()` with a log message 'Check state' and add the following lines to the method:

```python
    # Create an object Timer which wait 1 second before calling the method checkState and keep track of it in the attribute _nextCheck
    self._nextCheck = Timer(1, self.checkState)
    # Start the timer
    self._nextCheck.start()
```

With this code, each time we call the method `checkState()`, we define a new timer to call `checkState()` again one second later. Then, we start this timer.

**By convention**, the name of private attributes (which are not meant to be used outside the class) begin with an underscore `_`.
{: .fs-5 .ls-10 .code-example .bg-green-000}

To start the Pomodoro machine, we can add another method, `start()`, to the Pomodoro class. This method logs a message 'Start Pomodoro' and calls the method `checkStart()`. Back in `main.py`, add a line after creating the Pomodoro object to call the method `start()`.

Run the code and see what happens. Look what we achieved! The code is continuously printing a log 'Check state'. So in summary what we did here is that We created an infinite loop, `checkState()` calling itself every second, forever!

However, there is no 'Stop' button and even pressing `CTRL+C` does not stop the programme. Why?

It is because When we try to stop the programme, Python notices there are two `threads` running in parallel. Let's first understand the what is thread and the concept of threading.


## What is a Thread?

A thread is a set of instructions executed one after the other by the computer. A computer can run many `threads` in parallel. Thus, it can do multiple tasks at the same time. In contrast, a microcontroller such as an Arduino can only do one task at a time. We can look at our programme with the following diagram.

When we start the Python programme, it starts the main thread and calls the method `start()` on the Pomodoro object. In turn, it calls `checkState()`. This method creates a timer that starts a new thread. This new thread waits for one second and call `checkState()`, and so on. This entire process call threading.

![Assignment 7 - Thread]({{site.baseurl}}/assets/images/assignment7-step1-threads.svg)

You may have question that, Why cannot we create a `while-loop` in the main thread, which would call `checkState()`, then wait for one second and call it again? It would work, but we could not do anything else in our programme: it would be busy doing 1 single task (mostly waiting from one second to the next). This would prevent us from having a webserver receiving HTTP requests or any other task our programme should perform.

![Assignment 7 - While-loop]({{site.baseurl}}/assets/images/assignment7-step1-while.svg)

# Task 1.3 Stop the State Machine

With two threads running in parallel, we cannot exit the programme anymore and do any other things. We need to first cancel the Timer currently waiting for the next check. Here one thing to remember is that, we keep track of our Timer object in the attribute `_nextCheck`. A Timer object has a method `cancel()` to cancel the execution planned earlier. Thus, we need a method `stop()` which could look as follows:

```python
  def stop(self):
    logging.debug("Stop Pomodoro")
    # If a timer has been constructed and waiting for the next second
    if self._nextCheck is not None:
      # Cancel the timer
      self._nextCheck.cancel()
```

Now the question is When shall we call this method `stop()`? Well that is when we want to stop the programme, thus when we press `CTRL-C`. This leads us to a first handling our first `event`: we want to listen to the event 'user pressed `CTRL-C` on the keyboard' and react by stopping the Pomodoro machine. To do this we can use "Handler", that will close the programme when user press `CTRL-C`. Let's understand the concept of handler first.

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

Note that the parameters 'signal' and 'frame' are imposed by the signal module which emit relies on handler that must have these two parameters. They provide information about the triggered event.

Run the code. This time, pressing CTRL-C will stop the programme.

And we have a an initial state machine that we can start and stop, we are only missing states. Let'improvise this state machine in next step.

[Next: Step 2 - State Machine]({{site.baseurl}}/assignments/07-shared-pomodoro/step2){: .btn .btn-purple }