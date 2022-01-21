---
layout: default
title: Step 3 For Loops
parent: '03 eReader'
grand_parent: "Computational Thinking"
---

# Step 3 For Loops

{: .no_toc }

## Table of contents

{: .no_toc .text-delta }

1. TOC
{:toc}

---

You may have noticed that reading 500 characters at a time (or any other number of characters) is not ideal. Indeed, it cuts words and shows a variable number of lines from one page to another. To address these issues, we can read the file line-by-line instead of blocks of characters at a time.

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/nqp_ZIFulXM" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## What is a For-Loop

In contrast with the `While-Loop`, the `For-Loop` structure makes the boundaries of the loop explicit. It is the recommended way when we know how many loops are needed. The elements of the For-Loop look as follows:

- `i` integer variable that will control loop
- `start` integer value of `i` at the beginning
- `finish` integer value of `i` at the end
- `change` integer to add to `i` at each pass
- `action` the block of code to perform in each iteration

This time we define a variable as part of the structure, often named `i` for 'index', which keeps track of the iteration number. `start`, `finish`, and `change` define the number of iterations.

#### For-loop algorithm

```markdown
Begin with [i] at the [start] and add [change] to [i] in each iteration until [i] is larger than or equal to [finish];
do [action] in each iteration
```

#### For-loop flow chart

![For loop - Flow Chart]({{site.baseurl}}/assets/flow_chart_for_loop.svg)

#### For-loop Python syntax

```python
for i in range(start, finish, change):
    # action
```

# Task 3.1 Read Line by Line

Back to the eReader, the For-Loops can help us read a fixed number of lines for each page. It could look as follows:

```mardown
For the number of lines per page
    Read the next line from the book
    Show the user the next line of the book
```

Previously we used the `read` and `write` methods to change the value for number_remaining_cups in a separate file. However, we are now dealing with more than one text line; a full book! There are several methods to be used on a file variable, and in this case, the `readline` method seems to best fit our needs. In python syntax:

```python
file_variable = open("path", "r")
file_variable.readline()
file_variable.close()
```

We need to define the number of lines we want per page. Let's assume we want 15 lines. So, twice in the algorithm, we want to replace the line _Read first/second page of the book..._ with a `For-Loop`. It is a case for a constant to avoid repeating information.

```markdown
Create a constant called 'PAGE_SIZE' with the value 15 (we assume that a page is 15-line long)
Open the file book.txt in 'read' mode and store it in the 'book' variable

Show 40 empty lines
For the number of lines per page
Read the next line from the book
Show the user the next line of the book
Ask the user 'For the next page, press ENTER:' and store the answer in 'action'

While user pressed ENTER (empty string)

    Show 40 empty lines
    For the number of lines per page
        Read the next line from the book
        Show the user the next line of the book
    Ask the user 'For the next page, press ENTER:' and store the answer in 'action'

Close the file book.txt
```

Make the two changes to the Python code and execute the program to see if it works as expected. The amount of text on each page should be more consistent with a constant number of lines.

[Check the code on Replit](https://repl.it/@IO1075/03-ereader-step3-1)

At this stage, we achieved the objective to read all book pages with consistency. Identifying patterns helped us repeat blocks of code instead of duplicating them indefinitely. However, when looking at the code closely, a group of five lines is still duplicated. Can you see it? In the next step, we introduce the concept of `Function` to avoid this issue.

[Next: Step 4 - String]({{site.baseurl}}/computational-thinking/03-ereader/step4-function){: .btn .btn-purple }
