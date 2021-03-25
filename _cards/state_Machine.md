---
link-assignment: /assignments/07-shared-pomodoro/step1/
---

## What is State Machine?

The following diagram presents how we propose to model the Pomodoro timer as a state machine.

![Assignment 7 - State Machine]({{site.baseurl}}/assets/images/assignment7-step1-state-machine.svg)

First let's try to understand this diagram:

In the diagram, each circle re-present individual state in the program (we will will discuss what is state in Step 2). The `setup()` method (with two circles on the left) leads us to the starting point: the `IDLE` state. When the user 'press' the device it move to the `WORK`. This state remains until the time we set as work time is over. In this situation, the `BREAK_ALARM` start ringing (i.e. it is time for a break). There is only one good condition to leave this state: the user must press the device.

However, the Pomodoro timer can transition to a `SHORT_BREAK` or a `LONG_BREAK` state. This depends on how many work/short-break cycles we already completed. If we have to complete more cycles, we go for the `SHORT_BREAK` leading to a `WORK_ALARM`. Otherwise, it is time for a `LONG_BREAK`, which end whenever the user decides to press the device.

With this state-machine in mind we first start with creating a `Pomodoro` class with all the methods to perform the state checks (is something true) and transition (do something).