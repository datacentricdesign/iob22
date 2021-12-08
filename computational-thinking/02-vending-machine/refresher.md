---
layout: default
title: Refresher
parent: "02 Vending Machine"
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

## Algorithm
In this course and the assignments we take the definition of an algorithm in a broad sense: _a set of instructions that tells the computer what to do_.

## What is a Variable?

For the computer to learn, it needs the ability to memorise information. This is the role of the **variables**. In programming, a variable is a storage location in the computer's memory, paired with a name. This name will enable us to retrieve the information to use in our programme.

To create a new variable, we need three elements:

* `name` what do we call this thing that we want the computer to remember?
* `type` what type of data does it contain?
* `initial value` What is it's starting value?

The computer classifies the data it handles by types. This enables it to know what is meaningful to do with this data. Here are three examples of data types:

* a variable of type `int` can keep integer numbers in memory, these are values such as `12` or `-134`
* a variable of type `float` can keep decimal numbers in memory, these are values such as `12.0` or `-134.3`
* a variable of type `char` can keep a single character in memory, these are values such as `A`, `b`, `1` or `!`

We will complete this list as we progress through the assignments.

## What is Debugging?

Sometimes the code we write might lead to unexpected behaviour. 
For example: 
```python
sum = x + y
```
We want the computer to sum up two numbers and we do not get the right answer. This is an opportunity to _debug_ our program, i.e. to investigate what is happening and why it is not working as expected.

You will soon realise that this is a big part of programming and being good at programming as a lot to do with the ability to investigate and fix code. This is why we start _debugging_ now.

Typically, the key questions are: did you tell the computer what to do incorrectly? Or did you tell it to do the wrong thing?

In our example, the problem seems to revolve around the line that sums the `x` and `y`. 

[Next: Step 1 - Review]({{site.baseurl}}/computational-thinking/02-vending-machine/step1/){: .btn .btn-purple }
