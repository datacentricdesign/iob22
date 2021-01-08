---
layout: default
title: Step 4 Output
parent: "01 Calculator"
---

# Step 4 Output
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

Variables and inputs get us close to a user interaction. To close the loop, we need to write back to the user: this is the concept of `output`.

An output is information coming out of our programme. It has one element:

* `message` text to write to the user

The algorithm for the output looks like this:

_Output the text `message`_
{: .fs-5 .ls-10 .code-example }

To realise this in Python we can write:

```python
print("message")
```

## Task 4.1: Write the Code

To complete the user interaction, write the two Python lines for the following comments.

>Note: Put -- assigning a value to an existing variable -- is the same in python as creating a variable.

```python
# Put x + y in sum
# Tell user "The answer is " sum
```

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
# Put x + y in sum
sum = x + y
# Tell user "The answer is " sum
print("The answer is ")
print(sum)
```

## Task 4.2: Execute the code

Ask the computer to execute your instruction by clicking on the green arrow at the top of the page.

What happened? Did you get the correct answer? Something is wrong? Let's explore this in the next step.


[TODO link to replit solution]