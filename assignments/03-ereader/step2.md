---
layout: default
title: Step 2 Loops
parent: "03 eReader"

---

# Step 2 Loops
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## What is a While-Loop?

For our eReader to read not only read the two first pages but the whole book, we need to continuously read and ask the reader to press enter for the next page. This is a typical case of `while-loop`, a structure that repeats a piece of code 'while' a condition is true. It involves the following elements:

`Initialisation code` code that set the initial condition
`Condition` loop repeats if the condition is true
`Change code` code to change sentry so the condition can be triggered


#### While-Loop Algorithm

```markdown
Set the initial condition with [initialisation code]
then continue loop as long as the [condition] is true;
    Inside the loop, change the parameter of the condition with [change code]
```

#### While-Loop flow chart

[TODO flow chart]


#### While-Loop Python syntax

```python
# initialisation code
while (condition):
    # change code
```


# Task 2.1 Move from If to While

Looking back to our eReader, we will notice that the `while-loop` is only a step away from the `if`.

* what is the **initialisation code**? The line that comes before the if-statement: _Ask the user 'For the next page, press ENTER:' and store the answer in 'action'_. This line set the 'action', which drives the condition that tells the computer to continue or to stop.
* What is the **change code**? It is not there yet. Once we showed the next page,  we need to ask the again, whether they want to go to the next page or quit.

Integrating the `while-loop`, our eReader algorithm looks as follows. Note that we skip the elements that remain unchanged before and after. 

```markdown
...

Ask the user 'For the next page, press ENTER:' and store the answer in 'action'
While user pressed ENTER (empty string)
    Read the second page of the book and store it in the variable page_content
    Show the user the second page of the book
    Ask the user 'For the next page, press ENTER:' and store the answer in 'action'

...
```

Make the two changes to your Python code and execute the program to see if it works as expected. As long as you press ENTER, the program should show the next page. To stop the program, type any character before pressing ENTER. The input will no longer equal 'ENTER', thus leaving the `while-loop` and ending the programme.

[Check the code on Replit](https://repl.it/@IO1075/03-ereader-step2-1)

While-loops are well suited **when we do not know when to stop**. This case is a good example, as we cannot know when the user will decide to continue or stop reading.

You may have noticed that reading 500 characters at a time (or any other number of characters) is not ideal. It cuts words and shows various numbers of lines from one 'page' to another. To address these issues, we can read the file line-by-line, instead of blocks of characters at a time.

## What is a For-Loop

In contrast with the `While-Loop`, the `For-Loop` structure includes clearly defined the boundaries of the loop. This is the recommended way if we know how many loops we need. The elements of the For-Loop look as follows:


* `i` integer variable that will control loop
* `start` integer value of `i` at the beginning
* `finish` integer value of `i` at the end
* `change` integer to add to `i` at each pass
* `action` to perform in each iteration

This time we define a variable as part of the structure, often named `i` for 'index', which keeps track of the loops. `start`, `finish` and `change` define the number of loops.

#### For-loop algorithm

```markdown
Begin with [i] at the [start] and add [change] to [i] in each iteration until [i] is larger than or equal to [finish];
do [action] in each iteration
```

#### For-loop flow chart

[TODO flow chart]

#### For-loop Python syntax

```python
for i in range(start, finish, change):
    # action
```


# Task 2.2 Read Line by Line

Going back to our eReader, the For-Loops will help us reading a fixed number of lines for each page. We need to define 

```markdown
Create a variable called 'page_size' with the value 20 (we assume that a page is 15-line long)
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




[Check the code on Replit](https://repl.it/@IO1075/03-ereader-step2-2)

[Next: Step 3 - Function]({{site.baseurl}}/assignments/03-ereader/step3){: .btn .btn-purple }