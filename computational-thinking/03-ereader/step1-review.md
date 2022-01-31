---
layout: default
title: Step 1 Review
parent: '03 eReader'
grand_parent: "Computational Thinking"
---

# Step 1 Review

{: .no_toc }

## Table of contents

{: .no_toc .text-delta }

1. TOC
{:toc}

---

In the previous assignment, we explored reading from and writing into text files. In this first step, we will review this by reading the content of a book from a text file.

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/JOoQUh9IrcY" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

# Task 1.1 Find a Book to Read

Create a new _Replit_ project. Then, in the left panel, create a new file, 'book.txt'.

Let's look at a book in the public domain such as [Les Misérables by Victor Hugo](http://www.gutenberg.org/files/135/135-0.txt). First, open the link, skip the table of content and illustrations, select the rest and copy. Then, paste the content in _Replit_, in the new file 'book.txt'.

# Task 1.2 Read the First Page

From the previous assignment, we have all the elements to read the book's first page.

```markdown
Create a constant 'PAGE_SIZE' with the value 500 (we assume that a page is 500 characters)
Create a constant BOOK_PATH with the value 'book.txt'
Open the file BOOK_PATH in 'read' mode and keep it in the 'book' variable
Read the first page of the book and keep it in the variable page_content
Show the user the first page of the book
Close the file book.txt
```

Note that we create a `constant` PAGE_SIZE. A `constant` is a variable that does not change throughout the program. We use it to remember a value that we can use at multiple places in the code. Then, when we need to change it, there is only one place where we need to edit the code.

**By convention**, a `constant` is usually written all uppercase with underscore `_` between words. We place them at the top of the file, clearly identifiable to be changed if necessary.
{: .fs-5 .ls-10 .code-example .bg-green-000}

Back in the file `main.py` in _Replit_, write the five lines of code to implement this algorithm in Python. Note that we do not want to read the whole file at once. The principle of an eReader is to read one page after another. For now, we read the first page (here defined as the first 500 characters). We can achieve this with `read(PAGE_SIZE)`.

Execute the code to see if it works as expected.

![Animation Result Assignment 3 - Step 1]({{site.baseurl}}/assets/images/assignment3-step1-2.gif)

[Check the code on Replit](https://replit.com/@dcdlab/ereader-step1-2)

# Task 1.3 Go to the Second Page

The critical functionality of an eReader is its ability _to go to the next page_. We know how to ask users for input. In this case, we do not want text. We ask the users to press ENTER whenever they want to go to the next page.

```markdown
Ask the user 'For the next page, press ENTER:' and store the answer in 'action'
If the user pressed ENTER (empty string)
Read the second page of the book and store it in the variable page_content
Show the user the second page of the book
```

![Turn-page Flow Chart]({{site.baseurl}}/assets/flow_chart_next_page.svg)

Write the four lines of code to implement this algorithm in Python. This code complements the previous task, so we write it below the existing code, before closing the file.

Execute the code to see if it works as expected.

![Animation Result Assignment 3 - Step 3]({{site.baseurl}}/assets/images/assignment3-step1-3.gif)

[Check the code on Replit](https://replit.com/@dcdlab/ereader-step1-3)

# Task 1.4 Clean the Screen between Pages

To resemble the behaviour of an eReader, we still miss the removal of the previous page before showing the following one. Indeed, the text appears below the previous one. An easy way to mimic the eReader behaviour is to display empty lines.

## What is an Empty Line?

An empty line is a `string` with no character but `\n`: a special character representing the line's end. For each `\n`, Python starts writing on a new line. Thus, to clear the screen, we could write:

```python
print("\n\n\n\n")
```

We need many more `\n` to create enough empty lines and clear the screen. However, in the first assignment, we saw that operators also work on `strings`. It is particularly convenient when, for example, we want to have 40 empty lines. We can 'multiply' the `\n` by `40` as follows:

```python
# Show 40 empty lines
print("\n" * 40)
```

Add this line of code twice in the program: 1) before showing the first page and 2) before showing the second page.

Execute the code to see if it works as expected.

[Check the code on Replit](https://replit.com/@dcdlab/ereader-step1-4)

We have now a program that reads the two first pages of a book. It is limited, but it would not make sense to repeat our code for each of the thousand pages of this book. So instead, Steps 2 and 3 introduce the concept of **loops** to repeat an action as many times as needed. Then, Step 4 highlights how to define **functions** to reuse blocks of code.

[Next: Step 2 - While Loops]({{site.baseurl}}/computational-thinking/03-ereader/step2-while-loop/){: .btn .btn-purple }
