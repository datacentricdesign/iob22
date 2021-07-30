---
layout: default
title: Step 1 Algorithm
parent: "01 Calculator"
grand_parent: "Computational Thinking"
---

# Algorithm
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

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

#### Calculator Algorithm

```markdown
Reserve [memory] for three numbers
Ask the user two [numbers]
Make the [calculation]
Tell the [result] to the user
```

Why three numbers? There are two numbers to add, and the result.

# Flow Chart

Along with plain English, it is often helpful to make a graphical representation of our algorithm. A flow chart is particularly suitable as it represents a sequence of steps and decisions. When thinking or communicating about your algorithm, you might find it easier to start with such a flow chart.

Let's see how the _Calculator Algorithm_ could look like:

![Flow Chart Calculator Algorithm]({{site.baseurl}}/assets/flow_chart_calculator.svg)

We read a flow chart from _start_ to _end_ in oval/rounded shapes. Each shape is connected to another via an arrow and rectangles represent a process (i.e. an action to perform). As our algorithms get more complicated throughout the assignments, we will introduce a few more shapes in due time.

# Python syntax

As a final step, you will translate each assignment step into Python so that you can test your algorithm. At this stage, we will introduce new Python-related syntax when necessary. We will distinguish between:

* what you have to write for the code to work: these are the keywords and code structure that defines Python in the same way grammar and punctuation defines English. Introducing typos in these syntaxes will lead to unexpected output or simply your program not starting.
* what is conventional, what developers in Python are used to see: we will use green boxes to indicate these conventions.

Let's start with the first Python Syntax: comments.

In programming, a **comment** is a plain English explanation of what you want to do. It is ignored by the computer and serve the developers of the code themselves as well as anyone reading the code.

In Python, a comment starts with a hashtag `#`. Anything after a `#` (on the same line) is considered as a comment, thus it is ignored by the computer. Here is an example of our calculator algorithm (we simply add a `#` at the beginning of each line):

#### Python Syntax -- Comments

```python
# Reserve [memory] for three numbers
# Ask the user two [numbers]
# Make the [calculation]
# Tell the [result] to the user
```

And an example of conventions:

**By convention**, comments explain _what_ to do and not _how_ to do it. The how comes from the code.
{: .fs-5 .ls-10 .code-example .bg-green-000}

In the next step, we will deal with memory as the first element of our algorithm.

[Next: Step 2 - Variable]({{site.baseurl}}/assignments/01-calculator/step2){: .btn .btn-purple }