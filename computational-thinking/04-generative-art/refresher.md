---
layout: default
title: Refresher
parent: '04 Generative Art'
grand_parent: "Computational Thinking"
---

# Refresher
{: .no_toc }

Here is a quick refresher of the topics that were covered in previous assignments that might be useful to remember before starting the next assignment. 
Feel free to skip this refresher and start with step 1.

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc} 

# What is a While-Loop?

For our eReader to read not only the two first pages but the whole book, we need to continuously read and ask the reader to press `ENTER` for the next page. This is a typical case of `while-loop`, a structure that repeats a block of code _while_ a condition is `true`. It involves the following elements:

`Initialisation code` the block of code that set the initial condition
`Condition` the condition to continue iterating as long as it is `true`
`Change code` the block of code to change the condition

## While-Loop Algorithm

```markdown
Set the initial condition with [initialisation code];
then, iterate as long as the [condition] is true;
In each iteration, change the parameter of the condition with [change code]
```

## While-Loop flow chart

![While loop flow-chart]({{site.baseurl}}/assets/flow_chart_next_page.svg)

## While-Loop Python syntax

```python
# initialisation code
while (condition):
    # change code
```

# What is a For-Loop

In contrast with the `While-Loop`, the `For-Loop` structure makes the boundaries of the loop explicit. This is the recommended way when we know how many loops are needed. The elements of the For-Loop look as follows:

- `i` integer variable that will control loop
- `start` integer value of `i` at the beginning
- `finish` integer value of `i` at the end
- `change` integer to add to `i` at each pass
- `action` the block of code to perform in each iteration

This time we define a variable as part of the structure, often named `i` for 'index', which keeps track of the iteration number. `start`, `finish` and `change` define the number of iterations.

## For-loop algorithm

```markdown
Begin with [i] at the [start] and add [change] to [i] in each iteration until [i] is larger than or equal to [finish];
do [action] in each iteration
```

## For-loop flow chart

![For loop - Flow Chart]({{site.baseurl}}/assets/flow_chart_for_loop.svg)

## For-loop Python syntax

```python
for i in range(start, finish, change):
    # action
```

[Next: Step 1 - Review]({{site.baseurl}}/computational-thinking/04-generative-art/step1){: .btn .btn-purple }
