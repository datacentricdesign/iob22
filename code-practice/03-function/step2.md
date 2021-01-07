---
layout: default
title: Step 2 Function
parent: "03 Function"

---

# Step 2 Function
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---


A function performs a set of actions.

* name: what do we call this thing that we want the computer to do? 
* action: what is to be done?
* parameters: what is needed to do it?
* result: what will it produce?

The algorithm to teach the computer something to do:

_Create a function called **name** using **parameters** to do **action** and return **result**._
{: .fs-5 .ls-10 .code-example }

Functions are handy because it avoids us to rewrite code again and again. Let’s take the example of the print() function.

* name: print
* action: figure out where to display the message, convert each character into a visual representation and display them.
* parameters: the message to display
* result: none

And for the input() function:

* name: input
* action: figure out where to display the message, convert each character into a visual representation and display them, listen for the * user to type in characters, stop listening when the user types in ENTER.
* parameters: the message to display
* result: string typed in by the user

We can imagine that writing all these actions every time we want to tell something to the users or receive information from them would require us to repeat a lot of code again and again. This is what functions solve. They enable us to define a set of actions once and for all, that we can be called in a single line.

Here is how it looks like in Python


def name(parameters):
    action
    return result

It starts with the keyword ‘def’ standing for definition: we define a new thing to do.

The result of the function is returned with the keyword ‘return’