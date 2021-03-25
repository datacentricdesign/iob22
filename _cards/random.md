---
link-assignment: /assignments/04-generative-art/step4/#task-41-random-choice
---

Making art can benefit from a salt of randomness. For this, let's explore the Python module `random`. However, keep in mind that it is not trivial to generate truly random numbers. Beyond the scope of this assignment, we encourage you to search the Internet for the complexity behind teaching randomness to a computer.

 Note we do not need to install this module as it is provided with Python. We call these 'standard libraries'. Common function of the random module are explain [on the W3School website](https://www.w3schools.com/python/module_random.asp)

# Task 4.1 Random Choice

We will first let the computer randomly decide to draw a line of the radial or to skip it.

At the top of `drawing.py`, import the function 'choice' from the module 'random'. `choice()` takes one parameter: a list of values to choose from.

A list? A list is an object (or data structure) representing a sequence of items. We will explore this further in the next step. For now, we just need to know that to define a list in Python we use the square brackets `[` and `]`, separating each item with a comma `,`. To choose between drawing and not drawing, we need a list with to items: `[True, False]`. We can use the `choice()` function as follos:

```python
# Randomly choose to draw or skip the line
if (choice([True, False])):
    # Draw a line tilting y and y2 with +/- i
```

Duplicate the function `make_drawing_radial_lines()` into `make_drawing_random_radial_lines()`.

Then, update the two for-loops to randomly choose to draw or skip the line.

Finally, create a new HTTP route `/random` in `main.py` which connects to a function `serve_random_radial_lines()`. This function will return the result of `make_drawing_random_radial_lines()`. Note that you will need to import this function from `drawing.py`.

Execute the code and go to the HTTP route `/random` to check the result.

![Animation Result Assignment 4 - Step 4]({{site.baseurl}}/assets/images/task-4-4-1.gif)

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step4-1)