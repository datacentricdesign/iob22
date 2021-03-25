---
link-assignment: /assignments/07-shared-pomodoro/step1/#what-is-a-thread
---

## What is a Thread?

A thread is a set of instructions executed one after the other by the computer. A computer can run many `threads` in parallel. Thus, it can do multiple tasks at the same time. In contrast, a microcontroller such as an Arduino can only do one task at a time. We can look at our programme with the following diagram.

When we start the Python programme, it starts the main thread and calls the method `start()` on the Pomodoro object. In turn, it calls `checkState()`. This method creates a timer that starts a new thread. This new thread waits for one second and call `checkState()`, and so on. This entire process call threading.

![Assignment 7 - Thread]({{site.baseurl}}/assets/images/assignment7-step1-threads.svg)

You may have question that, Why cannot we create a `while-loop` in the main thread, which would call `checkState()`, then wait for one second and call it again? It would work, but we could not do anything else in our programme: it would be busy doing 1 single task (mostly waiting from one second to the next). This would prevent us from having a webserver receiving HTTP requests or any other task our programme should perform.

![Assignment 7 - While-loop]({{site.baseurl}}/assets/images/assignment7-step1-while.svg)