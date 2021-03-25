---
link-assignment: /assignments/05-covid-dashboard/step2/#logging
---

# Logging

As your code is growing, it becomes hard to keep track of what is happening. It feels appropriate to introduce logs. Logging refers to keeping track of what the programme is doing with regular prompt updates. As we move our user interface from the Terminal to the web browser, the only information we want to show in the Terminal are, in fact, logs. While the function `print()` is good to start with, it has many shortcomings. It can only show information we insert in the Terminal. If we want any extra information, such as the time of incidence or line number from the code emitting this message, we would need to do that ourselves. When switching from debugging to regular execution, we would need to go through the code to remove/comment on all of the `print()` instances. Instead of showing this information in the Terminal, we also often want it in a file or somewhere else. A logger can provide all these functionalities.

- You can `format` the information you want to see for each log;
- You can change the `log level` to quickly switch from `DEBUG` logging (showing many details) to `ERROR` logging (only showing the explicit errors);
- You can change the logging output from the Terminal to a file, or maybe both at the same time.

![Assignment 5 - Netherlands]({{site.baseurl}}/assets/images/task 5-2-2 log.png)

In short, as soon as you start to code more complex programs, logging can save you hours of unnecessary work.