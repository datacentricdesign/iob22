---
layout: default
title: Step 3 Function
parent: "03 eReader"

---

# Step 3 Function
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---


We already used functions, here are some examples: `print()` to display a message, `input()` to prompt the user for information, `int()` to convert a variable into an Integer. These are 'built-in' _function_, provided by _Python_.

A function performs a set of actions.

* `name` what do we call this thing that we want the computer to do? 
* `action` what is to be done?
* `parameters` what is needed to do it?
* `result` what will it produce?

The algorithm to teach the computer something to do:

```markdown
Create a function called [name] using [parameters] to do [action] and return [result].
```

Functions are handy because it avoids us to rewrite code again and again. Let’s take the example of the print() function.

* `name` print
* `action` figure out where to display the message, convert each character into a visual representation and display them.
* `parameters` the message to display
* `result` none

And for the input() function:

* `name` input
* `action` figure out where to display the message, convert each character into a visual representation and display them, listen for the user to type in characters, stop listening when the user types in ENTER.
* `parameters` the message to display
* `result` string typed in by the user

We can imagine that writing all these actions every time we want to tell something to the users or receive information from them would require us to repeat a lot of code again and again. This is what functions solve. They enable us to define a set of actions once and for all, that we can be called in a single line.

Here is how it looks like in Python

```python
def name(parameters):
    # Action
    return result
```

It starts with the keyword `def` standing for _definition_: we define a new action to perform.

The result of the function is returned with the keyword `return`


# Task 3.1 Read a Page

[TODO explaination]

[Check the code on Replit](https://repl.it/@IO1075/03-ereader-step3-1)


# Task 3.2 Read a Book

[TODO explaination]

[Check the code on Replit](https://repl.it/@IO1075/03-ereader-step3-2)


[Next: Step 4 - String]({{site.baseurl}}/assignments/03-ereader/step4){: .btn .btn-purple }