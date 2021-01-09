---
layout: default
title: Step 3 Input
parent: "01 Calculator"
---

# Step 3 Input
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

With variables, we provide memory for our programme. We can now start thinking about what we want to teach the computer. Our goal is to interact with the user to sum two numbers. We want the computer to ask the user for two numbers, add them up and show the answer to the user.

Thus, we need to introduce the concept of input. An input is an information received by the computer. In our case, it will receive numbers from the user. It has two elements:

* `variable` where the answer from the user will be stored
* `message` the question being asked to the user

Our input algorithm looks like this: 

_Ask the user `message` and store the answer in `variable`_
{: .fs-5 .ls-10 .code-example }

In Python, this would look like this:

```python
variable = input("message")
```

## Task 3.1: Write the code

Write two comments and two Python lines to let the user enter the numbers to sum up.

You should obtain something like this:

```python
# Create a variable called x of type number that starts with the value 0
x = 0
# Create a variable called y of type number that starts with the value 0
y = 0
# Create a variable called sum of type number that starts with the value 0
sum = 0
# Ask the user ‘Type in x: ’ and store the answer in x
x = input("Type in x: ")
# Ask the user ‘Type in y: ’ and store the answer in y
y = input("Type in y: ")
```

## Task 3.2: Execute the code

Ask the computer to execute your instruction by clicking on the green arrow at the top of the page.

This time ‘Type in x:’ should appear in the Terminal window (black one on the right). Type a number and press ENTER. A second message should appear for the value of y. Once again, enter a value and press enter. The programme ends, as we do not do anything else.


[TODO link to replit solution]