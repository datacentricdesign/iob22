---
layout: default
title: Step 4 Output
parent: "#01 User Interaction"
grand_parent: Code Practice
---

# Step 4 Output
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

In combination with variables and input, the final concept we need is output. An output is an information coming out of our programme. It has one element:

* _message_: text to write to the user

The algorithm for the output looks like this:

_Output the text message_
{: .fs-5 .ls-10 .code-example }

To realise this in Python we can write:

```python
print("message")
```

## Task 4.1: Write the Code

To complete the user interaction, write the two Python lines for the following comments.

>Note: Put -- assigning a value to an existing variable -- is the same in pYthon as creating a variable.

```python
# Put x + y in sum
# Tell user "The answer is " sum
```

You should obtain something like this:

```python
# Create a variable called x of type number that starters with the value 0
x = 0
# Create a variable called y of type number that starters with the value 0
y = 0
# Create a variable called sum of type number that starters with the value 0
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

What happened? Did you get the correct answer? Something is wrong?
