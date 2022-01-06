---
layout: default
title: Step 6 Logging
parent: "02 Vending Machine"
grand_parent: "Computational Thinking"
---

# Step 6 Logging
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

- TOC
{:toc}

---

In step 5 from the first assignment, we covered the concept and importance of Debugging. 

Logging while writing code helps us understand when events have happened when executing our code, which is useful for us to understand what went wrong when our code resulted in unexpected behaviour. 

In this step, we explore the use of logging and how that relates to writing and debugging code.

# What is logging

Logging is a way to show messages when the code is running. It helps keep track of what the programme is doing with regular prompt updates. In a way, we were already logging using the `print()` function. However, the print function is limited to outputting text to the console.

If we want any extra information, such as the time of incidence or line number from the code emitting this message, we would need to do that ourselves. When switching from debugging to regular execution, we would need to go through the code to remove/comment on all of the `print()` instances. Instead of showing this information in the Terminal, we also often want it in a file or somewhere else. A logger can provide all these functionalities.

As your code is growing, it becomes hard to keep track of what is happening. When debugging, more info helps us determine what the code is doing, what went wrong, and where the unexpected behaviour occurs. As we move our user interface from the Terminal to the web browser, the only information we want to show in the Terminal are, in fact, logs.

Python has a built-in module (more about modules later) for logging. This modules allows us to log events, assign importance to these events, and attach extra information to the logged event.

With proper logging, we can create code that is not only easier to debug, but also easier to understand.

- You can `format` the information you want to see for each log;
- You can change the `log level` to quickly switch from `DEBUG` logging (showing many details) to `ERROR` logging (only showing the explicit errors);
- You can change the logging output from the Terminal to a file, or maybe both at the same time.

![Assignment 5 - Netherlands]({{site.baseurl}}/assets/images/task 5-2-2 log.png)

In short, as soon as you start to code more complex programs, logging can save you hours of unnecessary work.

## Logging example

Let's take the same example from the debugging step of first assignment, where the code is meant to ask the user for two numbers and then print out the sum.
```python
# Import the built-in logging module
import logging

# Create a variable called x of type number that starts with the value 0
x = 0
# Create a variable called y of type number that starts with the value 0
y = 0
# Create a variable called sum of type number that starts with the value 0
sum = 0
# Ask the user ‘Type in x: ’ and store the answer in x
x = input('Type in x: ')
# Ask the user ‘Type in y: ’ and store the answer in y
y = input('Type in y: ')
# Print out the datatypes of the variables using the logger
logging.warning("Data type of x = %s", type(x))
logging.warning("Data type of y = %s", type(y))
# Put x + y in sum
sum = x + y
# Print out the datatypes of the sum variable using the logger
logging.warning("Data type of sum = %s", type(sum))
# Tell user "The answer is " sum
print('The answer is ')
# Tell user sum
print(sum)
```

In this example we see that the printed result is the concatenated string of the numbers instead of the sum of the numbers. With the logging module we can log the type of the input and output variables and understand why the code resulted in unexpected behaviour.

At the top of the example code there is the `import logging`, which is nessecary to use the built-in logging module. Modules will be covered in a later assignment.
On lines 15, 16, and 20 in the example the logging module is called with the warning function which outputs a string. From this we can see that x, y and sum are type `str`.

[Check the code on Replit](https://replit.com/@cvdvalk/SophisticatedBustlingGigahertz)

There are different logging functions that are named after the level or severity of the event they are used track.
The logging levels are `DEBUG`, `INFO`, `WARNING`, `ERROR`, and `CRITICAL`. With `DEBUG` being the lowest level and `CRITICAL` the highest level.
The `WARNING` level and is the default level for logging and prints out the log message in the console.
We can use these logging levels to assign importance to events, which makes a more organised and clear log for us to read.

# Task 6.1 Logging to a file
We can also log to a file, which can be useful in many cases. 
In order to log to a file we need to configure the logger. 
With the `basicConfig` fuction we can specify the filename and the level of the logger.
Anything lower that the given logger level will not be written to the log file.

In the following example the level is set to lowest level `DEBUG`, so everything should go into the log file.

```python
import logging
logging.basicConfig(filename='example.log', level=logging.DEBUG)
logging.debug('This message should go to the log file')
logging.info('So should this')
logging.warning('And this, too')
logging.error('And non-ASCII stuff, too, like Øresund and Malmö')
```

When you run this code, a file called `example.log` will be created that will contain the log messages. Also notice that the log messages are not displayed on the console. 

[Check the code on Replit](https://replit.com/@cvdvalk/GrowlingCrazyInstances)

# Task 6.2 Format log messages
We can also format the log message to showing info in a different way, or show other info.

This can also be done with the `basicConfig` function and providing the format parameter.

This format parameter takes a string that may contain some built-in attributes within that string.

For example the string `%(lineno)d %(levelname)s:%(message)s` would format the logger to output the line number (`%(lineno)d`), the logger level (`%(levelname)s`), and the logger message (`%(message)s`)

See the following example:

```python
import logging
logging.basicConfig(format='%(lineno)d %(levelname)s:%(message)s', level=logging.DEBUG)
logging.debug('This message should appear on the console')
logging.info('So should this')
logging.warning('And this, too')
```

[Check the code on Replit](https://replit.com/@cvdvalk/FarCreepyBracket)

[Next: Step 7 - Recap and More]({{site.baseurl}}/computational-thinking/02-vending-machine/step7){: .btn .btn-purple }