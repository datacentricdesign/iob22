---
layout: default
title: Step 4 Output
parent: "01 Calculator"
grand_parent: "Computational Thinking"
---

# Step 4 Output
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## What is an Output?

Variables and inputs get us close to complete user interaction. To close the loop, we need to write back the result of the sum to the user: this is the concept of `output`. An Output is a data coming out of our programme. It has one element:

* `message` the text to write to the user

The algorithm for the output looks like this:

#### Output Algorithm

```markdown
Output the text [message]
```

To realise this in Python we can write:

#### Output Python Syntax

```python
print("message")
```

# Task 4.1 Make the Calculation

Now that we receive two numbers from the user, we can sum them. For this, Python follows the usual mathematical notation `x + y`. Thus, we want:

```mardown
Put x + y in sum
```

Add this line at end of the code as a comment and add the translation into Python. Note: Put -- assigning a value to an existing variable -- is the same in Python as creating a variable.

# Task 4.2 Tell the Result to the User

The final step is to output the result. For this, our algorithm looks as follows:

```mardown
Tell user "The answer is "
Tell user sum
```

Add these two lines at end of the code as a comment and use the above output syntax to add the translation into Python.

[Check the code on Replit](https://repl.it/@IO1075/01-calculator-step4)

Ask the computer to execute your instruction by clicking on the green arrow at the top of the page.

What happened? Did you get the correct answer? Something is wrong? Let's explore this in the next step.


[Next: Step 5 - Debug]({{site.baseurl}}/assignments/01-calculator/step5){: .btn .btn-purple }