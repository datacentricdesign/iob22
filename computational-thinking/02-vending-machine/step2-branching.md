---
layout: default
title: Step 2 Branching
parent: "02 Vending Machine"
grand_parent: "Computational Thinking"
---

# Step 2 Branching
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## What is Branching?

A core function of the vending machine is to select between the beverages to serve. The computer chooses to do one of two actions (e.g. coffee or tea). We call this behaviour _'branching'_.

To create a branch, we need three elements:

* `condition` the definition of what is true or false
* `action` what to do when the condition is true
* `alternative action` what to do when the condition is false

#### Branching algorithm

The _branching_ algorithm looks like this:

```markdown
If [condition] is true
then do [action];
otherwise do [alternative action]
```
{: .fs-5 .ls-10 .code-example }

#### Branching flow chart

The flow chart is also a convenient, graphical way to represent branches. As branching is a key element of flow charts, it has its specific shape, the diamond, representing a decision.

![Branching Flow Chart]({{site.baseurl}}/assets/flow_chart_branching.svg)

#### Branching Python syntax

In Python, the syntax for branches relies on the keywords `if` and `else` and looks as follows:

```python
if condition:
    # then action
else:
    # otherwise alternative action
```

Let's pause on this syntax for a moment. It is the first Python syntax we encounter that requires several lines of code. We call this a _compound statement_. This structure involves two essential Python elements:

* The colons `:` ending the `if` and `else` lines tells the computer that the expression is not yet complete. It involves a sub-expression;
* The indentation -- 4 spaces or a `TAB` in front of the action and alternative action -- are required in front of each sub-expression.

Finally, the result of the condition is `True` or `False`. There is a data type for this, `boolean`. The variable of type `boolean` can only take the value `True` or `False`. It adds to our collection of types including `int`, `float`, `char` and `string`.

# Task 2.1 Chose beverage

The branching algorithm gives us many possibilities to improve the functionalities of the vending machine. For instance, we can tell the users what they selected instead of repeating their selection number.

#### Choice Beverage Algorithm

```markdown
Tell the user 'Welcome to IDE Hot Beverage service!'
Tell the user 'Here is what we offer:'
Tell the user '1) Coffee'
Tell the user '2) Tea'

Create a variable called choice of type number with the initial value 0
Ask the user 'Type in your choice: ' and store the answer in choice

Convert choice to integer and store in choice
If choice is equal to 1
    Then tell the user "Here is your coffee."
Else serve a tea by default
    Otherwise tell the user "Here is your tea."

Tell the user "Have a great day!"
```

We can see that we have a conversion similar to the first assignment again to compare the user input to a number. Then, we recognise the `if` and `else` with their respective `action` and `alternative action`.

The text 'Here is your coffee.' appears for the following condition: `choice is equal to 1`. The Python syntax uses the double-equal `==` for this condition.

Attention! The (single) equal `=` assigns a value to a variable.
{: .fs-5 .ls-10 .code-example .bg-yellow-000}

In _Replit_, add the new lines of the algorithm to your project as comments. Then, add the Python translation for each line.

Execute the code to check that it behaves the way you expect.

[Check the code on Replit](https://repl.it/@IO1075/02-vending-machine-step2-1)


# Task 2.2 Chained conditional

So far, any choice that is not a coffee would lead to serving tea. Thus, we need to check the option twice for coffee and tea. Chained conditionals allow checking for multiple conditions, leading to a different action. If the first condition is `False`, the computer evaluates the following until a condition is `True`. If none are true, it uses the default action (else).

[TODO Flow chart]

In Python, the keyword `elif` is used for chaining additional conditions with their associated actions.

```python
if condition:
    # action 1
elif condition2:
    # action 2
elif condition3:
    # action 3
else:
    # default action
```

Thus, we can add an alternative to check if the choice is `2` (for tea). We also adapt the default alternative to tell the user that this is not a valid option.

```markdown
...

If choice is equal to 1
    Then tell the user "Here is your coffee."
Else if choice is equal to 2
    Then tell the user "Here is your tea."
Else this is not a known choice
    Tell the user "Sorry, I do not know this choice."

Tell the user "Have a great day!"
```

In _Replit_, add the new lines of the algorithm to your project as comments, then add the Python translation for each line.

Execute the code to check that it behaves the way you expect.

[Check the code on Replit](https://repl.it/@IO1075/02-vending-machine-step2-2)

# Task 2.3 Choose Addons

We now want to ask the user if they want sugar (on a scale of 0 to 5) or milk (y for yes and n for no) in their beverage. Then, we want to tune the final message accordingly.

#### Choice addons Algorithm

We could extend the algorithm with the following lines:

```
Ask the user "Sugar (0-5): " and store the answer in sugar
Ask the user "Milk (y/n): " and store the answer in sugar

...

Tell the user whether they take their beverage with or without sugar
Tell the user whether they take their beverage with or without milk
```

In _Replit_, add the new lines of the algorithm to your project as comments. Then, add the Python translation for each line. Note that there will be four lines of codes for each "Tell ... whether", as they involve a branch with `if` and `else`.

Execute the code to check that it behaves the way you expect.

[Check the code on Replit](https://repl.it/@IO1075/02-vending-machine-step2-3)


[Next: Step 3 - Operator]({{site.baseurl}}/computational-thinking/02-vending-machine/step3-operators/){: .btn .btn-purple }