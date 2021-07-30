---
layout: default
title: Step 4 Exception
parent: "02 Vending Machine"
grand_parent: "Computational Thinking"
---

# Step 4 Exception
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

When executing your vending machine algorithm, you might have already run into issues while entering unexpected values. In this step, we will explore how to deal with this issue.

# Task 4.1 Test incorrect values

What if something goes wrong, such as the user enters a value that is not expected?

Let's take the latest version of our program in _Replit_ (from the previous step), execute the code and try to enter a beverage option that is not a number. What happens?

Our program fails with the following:

![Assignment 2 Step 4 - Value Error]({{site.baseurl}}/assets/images/assignment2-step4.png)

Indeed, there is a `ValueError`. The user provides a string that cannot be converted into an integer. Of course, we entered a value that does not represent a number. This event makes the program fails, but there is nothing wrong in the code. We call these _Runtime Errors_: errors that occur during the execution of the program.

We could prevent the user from entering anything else but a number by designing a numeric keypad, thus providing only keys for digits. Another solution is to protect our program against these errors. For this, there is the concept of `Exception`.

## What is an Exception?

Exceptions give the computer the ability to _try_ executing a piece of code and deal with the error if any pops up.

It has the following elements:

* `action` what the computer try to do, which can potentially fail
* `error` the error that the computer runs into
* `fallback action` what the computer should do in case of an error
* `clean up action` what the computer should do in any case after the action or the fallback action

With these elements, we can describe the Exception algorithm as follows:

#### Exception Algorithm

```markdown
Try to do [action];
if it fails, keep a report of the [error] and do [fallback action];
in any case do [clean up action]
```

#### Exception Flow Chart

![Exception Flow Chart]({{site.baseurl}}/assets/flow_chart_exception.svg)

The Python syntax for `Exceptions` involves three keywords -- `try`, `except` and `finally` -- respectively matching the three steps of our algorithm.

#### Exception Python Syntax

```python
try:
    # action
except ErrorType as error:
    # fallbackAction
finally:
    # cleanUpAction
```

# Task 4.2 Deal with ValueError

We now have enough to deal with wrong values typed in by the user. What we propose in the following update of the vending machine algorithm, is to _try_ converting the user's choice. If it fails, we will leave a message for the developer and a message for the user. We will also set the choice to 0 so that the rest of our program does not fail. In any case, we will inform developers and users about what has been done.

Of course, we are making an example here. There are many other ways our algorithm could deal with this error: we could stop the program with a message, we could ask the user to type in their selection again, we could serve a black coffee to anyone typing in a wrong input.

```markdown
...

Create a variable called choice of type number with the initial value 0
Ask the user "Type in your choice: " and store the answer in choice
Try to do something
    Convert choice to integer and store in choice
If it fails for a ValueError
    Tell the developer what happenned
    Tell the user what happenned
    Put a 0 in choice, an option the is not available but valid
In any case
    Tell both users and developer what was done

...
```

Note that we now distinguish between developers and users. There are important pieces of information for the developer which are of no use or even confusing for the user. We will see in the coming assignment how to deal with the developer information so that it is not coming to confuse the user.

In your _Replit_ project, you can transform your algorithm to add the exception mechanism. 

Execute the code to check that it behaves the way you expect.

[Check the code on Replit](https://repl.it/@IO1075/02-vending-machine-step4-2)


[Next: Step 5 - File]({{site.baseurl}}/assignments/02-vending-machine/step5){: .btn .btn-purple }