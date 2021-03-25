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

{% capture my_include %}{% include branching.md %}{% endcapture %}
{{ my_include | markdownify }}

# Task 2.1 Chose beverage

Going back to our vending machine, the branching algorithm gives us many possibilities to improve its functionalities. We can first tell the users what they selected, instead of repeating the number of there choice.

#### Choice Beverage Algorithm

```markdown
Tell the user 'Welcome to IO1075 Hot Beverage service!'
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
 
We can see that we have again a conversion similar to the first assignment so that we can compare the user input to a number. Then we recognise the `if` and `else` with there respective action and alternative action. In our case In the condition, to make this comparison `choice is equal to 1` in Python, you can use double-equal `==`.

Attention! The equal `=` assigns a value to a variable, it is not to be used to compare two values.
{: .fs-5 .ls-10 .code-example .bg-yellow-000}

In _Replit_, add the new lines of the algorithm to your project as comments, then add the Python translation for each line.

Execute the code to check that it behaves the way you expect.

[Check the code on Replit](https://repl.it/@IO1075/02-vending-machine-step2-1)


# Task 2.2 Chained conditional

So far, any choice that is not a coffee would lead to serving tea. To solve this problem, we need the ability to check the choice twice, for coffee and tea. Chained conditionals allow checking for multiple conditions, each leading to a different action. If the first condition is not met, then the following one is checked until a condition is True. If none of them are true, the default action (else) is used.

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

We now want to ask the user if they want sugar (on a scale of 0 to 5) or milk (y for yes and n for no) in their beverage. Then, we want to tune the final message accordingly. The algorithm could be complemented with the following lines:

#### Choice addons Algorithm

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


[Next: Step 3 - Operator]({{site.baseurl}}/assignments/02-vending-machine/step3){: .btn .btn-purple }