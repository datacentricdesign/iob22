---
layout: default
title: Algorithm
link-assignment: /assignments/01-calculator/step1/#what-is-an-algorithm
---

## What is an algorithm?

We mentioned in the introduction that computational thinking is about decomposition, pattern recognition, generalisation/abstraction and algorithm design. Working on these concepts throughout the assignments, we will express the algorithm of the solution we want to design in different forms. Here, we take the definition of an algorithm in a broad sense: _a set of instructions that tells the computer what to do_.

We will start with a list of elements and connect them in plain English. We will also think about the algorithm in graphical forms such as flow chart of state diagrams. Finally, we will translate these algorithms in Python so that we can test them.


# Elements and Plain English Algorithm

When we decompose a problem, we aim to identify its elements: what characterises the problem? What plays a role? We will make a list of those elements.

Let's think about our calculator. We just start so we will scope down the problem to _adding two numbers_. What we want is a user interaction in which the user provides two numbers and the computer sends back the result. For this, the following list of elements are probably useful:

* `memory` The computer needs to keep those number in memory
* `number` The computer needs to ask the user for two numbers
* `calculation` The computer needs to sum the two numbers
* `result` The computer needs to tell the user what is the result

Why memory? Anything the computer manipulates needs to be in its memory.

With the key ingredients of our Then, we want to connect these elements. Let's try with plain English:

[]({{site.baseurl}}{{page.url}})