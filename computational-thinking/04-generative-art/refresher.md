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

# What is a Function?

We already used functions, here are some examples: `print()` to display a message, `input()` to prompt the user for information, `int()` to convert a variable into an Integer. These are 'built-in' _function_, provided by the _Python_ language by default.

A function is a block of code that performs an action, identified by a name.

* `name` what do we call this thing that we want the computer to do?
* `action` what is to be done?
* `parameters` what information is needed to perform the action?
* `return value` what will it produce?

## Function Definition Algorithm

```markdown
Create a function called [name] using [parameters] to do [action] and return [result].
```

We use the name to `call` the function, which means running the associated block of code. When calling a function, we provide the values (or arguments) necessary for each of the function's parameters. So, functions are handy because it avoids duplicating code, making the development more efficient and robust. Let's take the example of the `print()` function.

* `name` print
* `action` figure out where to display the message, convert each character into a visual representation and display them.
* `parameters` the message to display
* `return value` none

When we call the `print()` function, we provide a `string`, the text we want to display. This is the _argument_ required by this function. Another example is the input() function:

* `name` input
* `action` figure out where to display the message, convert each character into a visual representation and display them, listen for the user to type in characters, stop listening when the user types in ENTER.
* `parameters` the message to display
* `return value` string typed in by the user

In this case, the `input()` requires a `string` argument to fulfil its parameters. It also returns a value: the user input. We are familiar with this construct. When we call the `input()` function, we keep the returned value in a variable.

We can imagine that writing all these actions every time we want to tell something to the users or receive information from them would require us to duplicate many lines of code. This is what functions solve. They enable us to define a set of actions once and for all, that can be called in a single line, everywhere in the code.

## Function Definition Python Syntax

```python
def name(parameter1, parameter2):
    """This is an example of function definition.
    parameter1 -- a first example parameter
    parameter2 -- a second example parameter
    """

    # Action

    return result
```

It starts with the keyword `def` standing for _definition_: we define a new action. The function's name is followed by parenthesis `()` which include the list of the parameters. The result of the function is returned with the keyword `return`.

Note that the code inside the function is indented (e.g. shifted to the right).

In this example, the triple quotes `"""` is a form of comments for multiple lines.

**By convention**, function names are verbs, lower case, and with underscores `_` between elements. Triple quotes are commonly used at the top of a function (so-called Docstring) to briefly describe the purpose of the function, its parameters and any helpful information for the developer using the function.
{: .fs-5 .ls-10 .code-example .bg-green-000}

[Next: Step 1 - Review]({{site.baseurl}}/computational-thinking/04-generative-art/step1){: .btn .btn-purple }
