---
layout: default
title: Step 4 Function
parent: "03 eReader"
grand_parent: "Computational Thinking"
---

# Step 4 Function
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---


Duplicating code is a potential source of error. When a change must be made or when the code is not behaving as expected, several places need to be checked and updated. `Functions` help us address this issue.


{% include function.md %}


# Task 4.1 Read a Page

Back to the eReader, we can extract the duplicated five lines of code. At the top of the file, define a function `show_book_page()`. This function has two parameters: `book` (file to read from) and `page_size` (how many lines to read). Copy the five duplicated lines into the function. Add a Docstring to describe the function and its parameters. Finally, add a `return` statement at the end of the function to return the action.

Once we defined the function `show_book_page()`, we can call it twice, in place of the five lines of code that are now perform by the function. Execute the program to see if it works as expected, make sure to store the return value of the function in the variable `action`. the behaviour should remain the same as before.

[Check the code on Replit](https://repl.it/@IO1075/03-ereader-step4-1)

# Task 4.2 Read a Book

We know how to define and call function. We can now anticipate and create function even before duplicating them. For instance, the eReader will be more useful if it can read different books. The code should be similar from one book to another.

Below the definition of the function `show_book_page()`, define a new function `read_book()`. This function has two parameters: `book_path` (path to the file containing the book) and `page_size` (how many lines to read per page).

Move the necessary code into the function definition and add a Docstring to describe the function and its parameters.

Finally, call the function `read_book()` at the bottom of the file. Execute the program to see if it works as expected, the behaviour should remain the same as before.

[Check the code on Replit](https://repl.it/@IO1075/03-ereader-step4-2)


[Next: Step 5 - String Methods]({{site.baseurl}}/computational-thinking/03-ereader/step5){: .btn .btn-purple }