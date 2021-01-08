---
layout: default
title: Step 1 Review
parent: "03 eReader"

---

# Step 1 Review
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# Task 1.1 Find a Book to Read

Create a new Replit project. In the left panel, create a new file 'book.txt'.

Let's have a look to a book in the public domain such as [Les Misérables by Victor Hugo](http://www.gutenberg.org/files/135/135-0.txt). Open the link, skip the table of content and illustration, select the rest and copy. Then, paste the content in Replit, in the new file 'book.txt'.

# Task 1.2 Read the First Page

From the previous assignment, we have all the elements to read the first page of the book.

```markdown
Open the file book.txt in 'read' mode and store it in the 'book' variable
Create a variable called 'page_size' with the value 500 (we assume that a page is 500 characters)
Read the first page of the book and store it in the variable page_content
Show the user the first page of the book
Close the file book.txt
```

Back in the file `main.py` in `Replit`, write the four lines of code to implement this algorithm in Python. Note that this time we do not want to read the whole file but only the first page (here defined as the 500 first characters). To achieve this, use `read(page_size)`.

Execute your code to see if it works as expected.

[TODO Screenshot of the expected result]

[Check the code on Replit](https://repl.it/@IO1075/03-ereader-step1-2)

# Task 1.3 Go to the Second Page

The key functionality of an eReader is the ability to go to the next page. To do this, we can ask the user to press ENTER.

```markdown
Ask the user 'For the next page, press ENTER:' and store the answer in 'action'
If user pressed ENTER (empty string)
    Read the second page of the book and store it in the variable page_content
    Show the user the second page of the book
```

Write the four lines of code to implement this algorithm in Python. This code complements the previous task, so we will write it below our existing code, just before closing the file.

Execute your code to see if it works as expected.

[TODO Screenshot of the expected result]

[Check the code on Replit](https://repl.it/@IO1075/03-ereader-step1-3)

# Task 1.4 Clean the Screen between Pages

To resemble the behaviour of an eReader, we still miss the removing of the previous page before showing the following one. An easy way to mimic this behaviour is to show a series of empty lines. An empty line is a `String` with no character but `\n`: a special character which represents the and of a line. For each `\n`, Python will start writing on a new line. Thus, to clean the screen we could write:

```python
print("\n\n\n\n")
```

With many more `\n` to create empty lines. However, we so in the first assignment that operators work with String. It is particularly convenient in this case if, for example, we want to have 40 empty lines. We can multiple the `\n` time 40 as follows:

```python
# Show 40 empty lines
print("\n" * 40)
```

Add this line of code twice in your program: 1) before showing the first page and 2) before showing the second page.

Execute your code to see if it works as expected.

[Check the code on Replit](https://repl.it/@IO1075/03-ereader-step1-4)

We have now a program that read the two first pages of a book. We will not get far with two pages, but it will not make sense to repeat our code again and again for each of the thousand pages of the book. Instead, Step 2 will introduce the concept of **loops** to repeat an action as many time as it is needed. Then, in Step 2 we will see how to use **functions** to reuse blocks of code.