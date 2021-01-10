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

To create a branch, we need three elements:

* `condition` definition of what is true or false
* `action` what to do when the condition is true
* `alternative action` what to do when the condition is false

So the branching algorithm looks like this:

#### Branching algorithm

```markdown
If [condition] is true
then do [action];
otherwise do [alternative action]
```
{: .fs-5 .ls-10 .code-example }

The flow chart is also a convenient, graphical way to represent branches.

#### Branching flow chart

![Branching Flow Chart]({{site.baseurl}}/assets/flow_chart_branching.svg)

As branching is a key element of a flow chart, it has its specific shape, the diamond, representing a decision. When thinking or communicating about your algorithm, you might find it easier to start with such a flow chart.

In Python, the most common syntax:

#### Branching Python syntax

```python
if condition:
    # action
else:
    # alternative action
```

Let's pause on this syntax. This is the first expression we encounter that requires several lines of code. Call this a compound statement. This structure involves two important Python elements:

* The colons `:` at the end of the if and else lines tell the computer that the expression is not complete yet. It involves a sub-expression
* The indentation (4 spaces or a `TAB`) is required in front of each sub-expression.

Finally, the result of the condition is `True` or `False`. There is a data-type for this, `boolean`. Variable of type `boolean` can only take the value `True` or `False`. This adds to the data-types `int`, `float` and `char`.

# Task 2.1 Chose beverage

#### Choice Beverage Algorithm

[TODO intro task]

```markdown
Tell the user ‘Welcome to IO1075 Hot Beverage service!’
Tell the user ‘Here is what we offer:’
Tell the user ‘1) Coffee’
Tell the user ‘2) Tea’

Create a variable called choice of type number with the initial value 0
Ask the user ‘Type in your choice: ’ and store the answer in choice

Convert choice to integer and store in choice
If choice is equal to 1
    Then tell the user "Here is your coffee."
Else serve a tea by default
    Then tell the user "Here is your tea."

Tell the user "Have a great day!"
```

[Check the code on Replit](https://repl.it/@IO1075/02-vending-machine-step2-1)


# Task 2.2 Chained conditional

So far, any choice that is not a coffee would lead to serve a tea. Chained conditionals allow checking for multiple conditions, each leading to a different action. If the first condition is not met, then the following one is checked until a condition is True. If non are true, the default action (else) is used.

[TODO Flow chart]

In Python, the keyword `elif` is used for chaining additional conditions with respective actions.

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

Add an alternative to check if the choice is a tea. Adapt the default alternative to tell the user that this is not a valid option.

```markdown
Tell the user ‘Welcome to IO1075 Hot Beverage service!’
Tell the user ‘Here is what we offer:’
Tell the user ‘1) Coffee’
Tell the user ‘2) Tea’

Create a variable called choice of type number with the initial value 0
Ask the user ‘Type in your choice: ’ and store the answer in choice

Convert choice to integer and store in choice
If choice is equal to 1
    Then tell the user "Here is your coffee."
Else if choice is equal to 2
    Then tell the user "Here is your tea."
Else this is not a known choice
    Tell the user "Sorry, I do not know this choice."

Tell the user "Have a great day!"
```

[Check the code on Replit](https://repl.it/@IO1075/02-vending-machine-step2-2)

# Task 2.3 Chose Addons

We now want to ask the user if they want sugar or milk in their hot beverage. Then, we want to tune the final message accordingly. The algorithm could be complemented with the following lines:

#### Choice addons Algorithm

```
Ask the user "Sugar (0-5): " and store the answer in sugar
Ask the user "Milk (y/n): " and store the answer in sugar

...

Tell the user whether they take there beverage with or without sugar
Tell the user whether they take there beverage with or without milk
```

[Check the code on Replit](https://repl.it/@IO1075/02-vending-machine-step2-3)

[Next: Step 3 - Operator]({{site.baseurl}}/assignments/02-vending-machine/step3){: .btn .btn-purple }