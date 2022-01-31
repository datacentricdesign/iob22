---
layout: default
title: Step 4 Function
parent: "03 eReader"
grand_parent: "Computational Thinking"
---

# Step 4 Function
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---


Duplicating code is a potential source of error. You need to check several places and update them to make a change. In addition, when the code is not behaving as expected, you might fix only part of the issue because the duplicates remain. `Functions` help us address this issue.


## What is a Function?

We already used functions; here are some examples: `print()` to display a message, `input()` to prompt the user for information, `int()` to convert a variable into an Integer. These are 'built-in' _functions_, provided by the _Python_ language by default.

A function is a block of code that performs an action, identified by a name.

* `name` what do we call this thing that we want the computer to do?
* `action` what is to be done?
* `parameters` what information is needed to perform the action?
* `return value` what will it produce?

#### Function Definition Algorithm

```markdown
Create a function called [name] using [parameters] to do [action] and return [result].
```

We use the name to `call` the function, which means running the associated code block. When calling a function, we provide the values (or arguments) necessary for each function's parameter. So, functions are handy because it avoids duplicating code, making the development more efficient and robust. Let's take the example of the `print()` function.

* `name` print
* `action` figure out where to display the message, convert each character into a visual representation and display them.
* `parameters` the message to display
* `return value` none

When we call the `print()` function, we provide a `string`: the text we want to display. It is the _argument_ required by this function. Another example is the input() function:

* `name` input
* `action` figure out where to display the message, convert each character into a visual representation and display them, listen for the user to type in characters, stop listening when the user types in ENTER.
* `parameters` the message to display
* `return value` string typed in by the user

In this case, the `input()` requires a `string` argument to fulfil its parameters. It also returns a value: the user input. We are familiar with this construct. We keep the returned value in a variable when we call the `input()` function.

We can imagine that writing all these actions every time we want to tell the users or receive information from them would require us to duplicate many lines of code. Thus, it is what functions solve. They enable us to define a set of actions that can be called in a single line, everywhere in the code.

#### Function Definition Python Syntax

```python
def name(parameter1, parameter2):
    """This is an example of function definition.
    parameter1 -- a first example parameter
    parameter2 -- a second example parameter
    """

    # Action

    return result
```

It starts with the keyword `def` standing for _definition_: we define a new action. Then, the function's name follows with parentheses `()`, which include the list of the parameters. Finally, the function returns the result with the keyword `return`.

Note that the code inside the function is indented (e.g. shifted to the right), in the same fashion as if/else or loop structures.

In this example, we introduce the triple quotes `"""`. It is a form of comments for multiple lines.

**By convention**, function names are verbs, lower case, and with underscores `_` between elements. In addition, triple quotes are commonly used at the top of a function (so-called Docstring) to briefly describe the purpose of the function, its parameters and any helpful information for the developer using the function.
{: .fs-5 .ls-10 .code-example .bg-green-000}


# Task 4.1 Read a Page

Back to the eReader, we can extract the duplicated five lines of code. At the top of the file, define a function `show_book_page()`. This function has two parameters: `book` (file to read from) and `page_size` (how many lines to read). Copy the five duplicated lines into the function. Add a Docstring to describe the function and its parameters. Finally, add a `return` statement at the end of the function to return the action.

Once we defined the function `show_book_page()`, we can call it twice in place of the five lines of code that are now performed by the function.

Execute the program to see if it works as expected. Make sure to store the return value of the function in the variable `action`. The behaviour should remain the same as before.

[Check the code on Replit](https://replit.com/@dcdlab/ereader-step4-1)

# Task 4.2 Read a Book

We know how to define and call functions. We can now anticipate and create them even before duplicating them. For instance, the eReader will be more valuable if it can read different books. Therefore, the code should be similar from one book to another.

Below the definition of the function `show_book_page()`, define a new function `read_book()`. This function has two parameters: `book_path` (path to the file containing the book) and `page_size` (how many lines to read per page).

Move the necessary code into the function definition and add a Docstring to describe the function and its parameters. Finally, call the function `read_book()` at the bottom of the file. 

Execute the program to see if it works as expected. The behaviour should remain the same as before.

[Check the code on Replit](https://replit.com/@dcdlab/ereader-step4-2)


[Next: Step 5 - String Methods]({{site.baseurl}}/computational-thinking/03-ereader/step5-string){: .btn .btn-purple }