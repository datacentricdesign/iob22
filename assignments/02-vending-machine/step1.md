---
layout: default
title: Step 1 Review
parent: "02 Vending Machine"
---

# Step 1 Review
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

Let's start the development of our vending machine algorithm with the elements we used in the first assignment. For instance, we need to welcome the users and tell them what is available, ask them to chose a hot beverage and tell them their choice.

#### Hot beverage algorithm 1

```
Tell the user 'Welcome to IO1075 Hot Beverage service!'
Tell the user 'Here is what we offer:'
Tell the user '1) Coffee'
Tell the user '2) Tea'

Create a variable called choice of type number with the initial value 0
Ask the user 'Type in your choice: ' and store the answer in choice
Tell the user 'Here is your ' choice
Tell the user 'Have a great day!'
```

You will recognise the 'keep in memory', 'input' and 'output' algorithms. Feel free to tune the way you ask and tell the user, this is your vending machine.

Note that we now put `"Here is your"` and `choice` on the same line. We saw in the first assignment that we can 'add' strings (i.e. pieces of text) together with the plus `+`.

## Task 1.1: Create a project

Open _Replit_ in your web browser and create a new _Python_ project with the name '02-vending-machine' and write the _Hot beverage algorithm 1_ as comments (adding the hashtag `#` in front of each line).

## Task 1.2: Write the Python code

The next step is to write the Python code for each comment. Do not hesitate to revisit the first assignment if you forgot about the Python syntax.

## Task 1.3: Execute the code

The first version of your vending machine algorithm is ready. Execute the code to check that it behaves the way you expect.

![Animation Result Assignment 2 - Step 1]({{site.baseurl}}/assets/images/assignment2-step1.gif)

Once you achieve a similar behaviour, there are a few things that we can work on. Let's focus on the choice: the response we make to the user is directly what they typed in, such as `1` for coffee or `2` for tea. In the next step, we will use branches to do specific actions based on the users' choice such as providing a more comprehensive message.

[Check the code on Replit](https://repl.it/@IO1075/02-vending-machine-step1)


[Next: Step 2 - Branching]({{site.baseurl}}/assignments/02-vending-machine/step2){: .btn .btn-purple }