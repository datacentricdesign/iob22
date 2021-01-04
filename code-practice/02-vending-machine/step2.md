---
layout: default
title: Step 2 Branching
parent: "#02 Vending Machine"
grand_parent: Code Practice
---

# Step 2 Branching
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

When the computer makes a choice to do one of two actions, e.g. coffee or tea, this is called branching. To create a branch, we need three elements:
* condition
* action
* alternative action

So the branching algorithm looks like this:
‘If condition is true, then do action; otherwise do alternative action.’

Flow chart

In Python, the most common syntax:

if condition:
    action
else:
    alternative action

Let’s pause on this syntax. This is the first expression that requires several lines of code, a so-called compound statement. This structure involves two important Python elements:

* The colons : at the end of the if and else lines tell the computer that the expression is not complete yet. It involves a sub-expression
* The indentation (4 spaces or a TAB) is required in front of each sub-expression.


Create a variable called choice of type number with the initial value 0
Ask the user ‘Type in your choice: ’ and store the answer in choice
Convert choice to integer and store in choice
If choice is equal to 1
Then tell the user "Here is your coffee."
Otherwise tell the user "Here is your " choice
Tell the user "Have a great day!"