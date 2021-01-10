---
layout: default
title: Step 3 Input
parent: "01 Calculator"
---

# Step 3 Input
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

With variables, we provide memory for our programme. Our next step is to let the user provide two numbers so that the computer can sum them and show the result. Thus, we need to introduce the concept of `input`. Input is data received by the computer. In our case, it will receive numbers from the user. It has two elements:

* `variable` where the answer from the user will be kept in memory
* `message` the question being asked to the user

Our input algorithm looks like this: 

#### Input algorithm

```markdown
Ask the user [message] and store the answer in [variable]
```

In Python, this would look like this:

#### Input Python Syntax

```python
variable = input("message")
```

# Task 3.1 Ask Users for two numbers

To ask the user for two numbers to sum up, we can repeat the input algorithm twice. This would look as follows:

#### Ask Users for two numbers Algorithm

```markdown
Ask the user ‘Type in x: ’ and store the answer in x
Ask the user ‘Type in y: ’ and store the answer in y
```

Add these to lines as comments (starting with `#`) at the end of your code. Then, use the Python syntax introduced above for translate them into Python.

[Check the code on Replit](https://repl.it/@IO1075/01-calculator-step3)

Ask the computer to execute your instruction by clicking on the green arrow at the top of the page.

This time ‘Type in x:’ should appear in the Terminal window (black one on the right). Type a number and press ENTER. Then, a second message should appear for the value of y. Once again, enter a value and press enter. Finally, the program ends because we do not tell the computer to do anything else.


[Next: Step 4 - Output]({{site.baseurl}}/assignments/01-calculator/step4){: .btn .btn-purple }