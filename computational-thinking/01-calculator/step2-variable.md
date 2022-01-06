---
layout: default
title: Step 2 Variable
parent: "01 Calculator"
grand_parent: "Computational Thinking"
---

# Step 2 Variable
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## What is a Variable?

For the computer to learn, it needs the ability to memorise information. It is the role of the **variables**. In programming, a variable is a storage location in the computer's memory, paired with a name. This name will enable us to retrieve the information in our programme.

To create a new variable, we need three elements:

* `name` what do we call this thing that we want the computer to remember?
* `type` what type of data does it contain?
* `initial value` What is its starting value?

The computer classifies the data it handles by type. It enables it to know what is meaningful to do with this data. Here are three examples of data types:

* a variable of type `int` can keep integer numbers in memory; these are values such as `12` or `-134`;
* a variable of type `float` can keep decimal numbers in memory; these are values such as `12.0` or `-134.3`;
* a variable of type `char` can keep a single character in memory; these are values such as `A`, `b`, `1` or `!`.

We will complete this list as we progress through the assignments.

So here is in plain English the algorithm that teaches the computer how to remember information:

#### Keep in Memory Algorithm

"`markdown
Create a variable called [name] of type [type] that starts with the value [initial value]
```

Now that we know what we want to do, we need to express it in Python syntax. It looks like this:

#### Keep in Memory Python Syntax

```python
name = initial_value
```

**Attention!** Unlike in mathematics in which the equal sign `=` means that the expressions on both sides are equal, in programming, `=` means that the right part is 'assigned' to the left part.
{: .fs-5 .ls-10 .code-example .bg-yellow-000}

For the name of your variables, you can use all alpha-numerical combinations except the `keywords` of the Python language, which are reserved. You can find the all list of `keywords` to avoid on the [W3Schools website](https://www.w3schools.com/python/python_ref_keywords.asp)

**By convention**, variable names are nouns with lowercases and underscores `_` between elements.
{: .fs-5 .ls-10 .code-example .bg-green-000}

# Task 2.1 Reserve Memory for Three Numbers

Going back to our calculator algorithm, we have everything we need for the first action _Reserve memory for three numbers_. In plain English, it could look as follows:

```markdown
Create a variable called x of type number that starts with the value 0
Create a variable called y of type number that starts with the value 0
Create a variable called sum of type number that starts with the value 0
```

Create a new project in Replit, select the language 'Python' and name it '01-calculator' [See Environment page]({{site.baseurl}}/environment). In the text editor (middle part), type in the three lines of the algorithm. Start each line with a hashtag `#`. The hashtag signal a comment: plain English explanation of what you want to do.

# Task 2.2 From English to Python

The next task is to translate each line from English to Python. Using the Python syntax introduced above, write the three lines of code corresponding to the three comments.

Feeling lost or in need of a double-check? The solution is never far away!

[Check the code on Replit](https://repl.it/@IO1075/01-calculator-step2)

# Task 2.3 Execute the code

Finally, ask the computer to execute your instructions by clicking on the green arrow at the top of the page.

Nothing happens. Indeed, we are storing the value `0` in three variables without asking the computer to show anything. So let's see how we can address the second step of our calculator algorithm: asking the users for two numbers.


[Next: Step 3 - Input]({{site.baseurl}}/computational-thinking/01-calculator/step3-input){: .btn .btn-purple }