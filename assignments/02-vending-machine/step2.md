---
layout: default
title: Step 2 Branching
parent: "02 Vending Machine"
---

# Step 2 Branching
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

When the computer chose to do one of two actions, e.g. coffee or tea, this is called branching.

[TODO introduce type boolean]


To create a branch, we need three elements:

* `condition` definition what is true or false
* `action` what to do when the condition is true
* `alternativeAction` what to do when the condition is false

So the branching algorithm looks like this:

#### Branching algorithm
_If **condition** is true, then do **action**; otherwise do **alternative action**_
{: .fs-5 .ls-10 .code-example }

The flow chart is also a convenient, graphical way to represent branches.

#### Branching flow chart
![Branching Flow Chart]({{site.baseurl}}/assets/flow_chart_branching.svg)

We read a flow chart from top to bottom, from _start_ to _end_ in oval shapes. Each shape is connected to another via an arrow and rectangle represents a process (i.e. an action to perform). As branching is a key element of a flow chart, it has its specific shape, the diamond, representing a decision. When thinking or communicating about your algorithm, you might find it easier to start with such a flow chart.

In Python, the most common syntax:

#### Branching Python syntax

```python
if condition:
    action
else:
    alternative action
```

Let’s pause on this syntax. This is the first expression we encounter that requires several lines of code. Call this a compound statement. This structure involves two important Python elements:

* The colons `:` at the end of the if and else lines tell the computer that the expression is not complete yet. It involves a sub-expression
* The indentation (4 spaces or a `TAB`) is required in front of each sub-expression.


# Task 2.1 Chose beverage

#### Choice Beverage Algorithm
```
Create a variable called choice of type number with the initial value 0
Ask the user ‘Type in your choice: ’ and store the answer in choice
Convert choice to integer and store in choice
If choice is equal to 1
Then tell the user "Here is your coffee."
Otherwise tell the user "Here is your " choice
Tell the user "Have a great day!"
```


[TODO link to replit solution]

# Task 2.2 Chose Addons

#### Choice addons Algorithm

Ask the user if they want sugar or milk and tune the final message accordingly

```

```


[TODO link to replit solution]

