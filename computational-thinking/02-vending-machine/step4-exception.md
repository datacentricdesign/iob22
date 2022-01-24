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

When executing your vending machine algorithm, you might have already encountered issues while entering unexpected values. In this step, we will explore how to deal with this issue.

# Task 4.1 Test incorrect values

What if something goes wrong, such as the user entering an unexpected value?

Let's take the latest version of our program in _Replit_ (from the previous step). Execute the code and enter a beverage option that is not a number. What happens?

Our program fails with the following:

![Assignment 2 Step 4 - Value Error]({{site.baseurl}}/assets/images/assignment2-step4.png)

Indeed, there is a `ValueError`: the computer failed to convert the user input into an integer. Indeed, we entered a value that does not represent a number. This event makes the program fail, but the code is nothing wrong.

We call these _Runtime Errors_: errors that occur during the program's execution.

We could prevent the user from entering anything else but a number by designing a numeric keypad, thus providing only keys for digits. Another solution is to protect our program against these errors. For this, there is the concept of `Exception`.

## What is an Exception?

Exceptions allow the computer to _try_ executing a piece of code and deal with the error if any pops up.

It has the following elements:

* `action` what the computer try to do, which can potentially fail
* `error` the error that the computer runs into
* `fallback action` what the computer should do in case of an error
* `clean up action` what the computer should do in any case after the action or the fallback action

#### Exception Algorithm

With these elements, we can describe the Exception algorithm as follows:

```markdown
Try to do [action];
if it fails, keep a report of the [error] and do [fallback action];
in any case do [clean up action]
```

#### Exception Flow Chart

![Exception Flow Chart]({{site.baseurl}}/assets/flow_chart_exception.svg)

The Python syntax for `Exceptions` involves three keywords -- `try`, `except` and `finally` -- respectively, matching the three steps of our algorithm.

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

We now have enough to deal with invalid user inputs. So, in the following update of the vending machine algorithm, we propose to _try_ converting the user's choice. If it fails, we leave a message for the developer and the user. We will also set the selection to 0 so that the rest of our program does not fail. In any case, we inform developers and users about what was done.

Of course, we are making an example here. There are many other ways our algorithm could deal with this error. For instance, we could

* stop the program with a message
* ask the user to type in their selection again
* serve a black coffee to anyone typing in a wrong input.

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

Note that we now distinguish between developers and users. There are essential pieces of information for the developer which are of no use or even confusing for the user. We will see in the coming assignment how to deal with the developer information so that it is not coming to confuse the user.

In your _Replit_ project, you can transform your algorithm to add the exception mechanism. 

Execute the code to check that it behaves the way you expect.

[Check the code on Replit](https://replit.com/@dcdlab/vending-machine-step4-2)


[Next: Step 5 - File]({{site.baseurl}}/computational-thinking/02-vending-machine/step5-file){: .btn .btn-purple }