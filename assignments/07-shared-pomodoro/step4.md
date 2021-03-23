---
layout: default
title: Step 4 Time
parent: "07 Shared Pomodoro"

---

# Step 4 Time
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

At this stage we have the structure of a state machine in the class `Pomodoro` and a basic user interface to trigger 'press' event. Let's complete our state machine.


# Task 4.1 Track Work Time

With the 'press' event, our state machine reaches the state `WORK`. To leave this state, the work period must be over. So we need to define the duration of the work period and track time during that period. Let' go back to the constructor of the Pomodoro object.

* Define an attribute `workDuration` which represents the duration of a work period in seconds. For testing purpose, we can initialise it to 10 seconds;
* Define an attribute `_timerDuration` which represents the duration of the period we are tracking. We will set this attribute each time we start a new period, so for now we initialise it to 0;
* Define an attribute `_timerStart` which represents the start time of the period we are tracking. We will use this as the reference to check how much time we spent so far in the current period.

These three attributes will help us define the method `startWork()`. In this method we already change the state to `WORK`. In addition, set `_timerDuration` to `workDuration` so that we know which duration which should refer to. Then, we need to check what is the current time so that we can use it later as a reference point. The time module as a convenient function `monotonic()` for that. Import the module `time` at the top of the file and set `_timeStart` to `monotonic()`.

We can move on `isTimeOver()`. As we checked the time when switching to `WORK` (using monotonic), we can use this as a reference time. Thus, the condition to decide whether the is over looks as follows:

```python
monotonic() - self._timerStart > self.timerDuration
```

We use again `monotonic()` to check the current time, and we substract the start time. This gives us the number of seconds since we switched to `WORK`. We compare this value to `timerDuration` to know if we reached the end of the period.

Run the code to check. At this stage, the state machine count the work duration and 'ring' the break alarm. If we press again, it switch to break and right after 'ring' the work alarm.

[Check the code on Replit](https://replit.com/@IO1075/07-shared-pomodoro-step4-1)

# Task 4.2 Track Short Break Time

Using the previous task as an example, add the attribute `breakDuration` to the constructor and use it in `startShortBreak()` to have the same control over time.

Run the code to check. At this stage we have an infite loop of work and short breaks.

[Check the code on Replit](https://replit.com/@IO1075/07-shared-pomodoro-step4-2)

# Task 4.3 Count Cycle

To complete the state machine, we need to count the cylces of work and short break so that we can reach the long break. We suggest the following path:

* In the constructor, we suggest to have an attribute `numberCycles` to set the number of cycles (work/short break) and an attribute `cycleCounter` to keep track of these cycle;
* In `startShortBreak()` we need to add a new cycle;
* In `startLongBreak()` we need to reset the number of cycles;
* In `isTimeForLongBreak()` we need to compare the `numberCycles` to `_cycleCounter` to return True or False;

Run the code to check. At this stage the state machine should be complete.

[Check the code on Replit](https://replit.com/@IO1075/07-shared-pomodoro-step4-3)

[Next: Step 5 - Websocket]({{site.baseurl}}/assignments/07-shared-pomodoro/step5){: .btn .btn-purple }