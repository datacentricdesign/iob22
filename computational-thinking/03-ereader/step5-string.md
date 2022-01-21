---
layout: default
title: Step 5 String
parent: "03 eReader"
grand_parent: "Computational Thinking"
---

# Step 5 String
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## What Are Object's Methods?

In the first assignment, we learned about `strings` as _objects_: data structures that combines one or several values. In fact, `strings` combine characters (`char` data type) as a sequence. In the second assignment, we learned about files, another object combining all the necessary values to manage access to a file. We used the file object to read from (`file.read()`), write into (`file.write()`) and close (`file.close()`) the text file. 

These are `methods`: functions that act on an object. You can recognise the Python syntax of a function call with a name followed by parentheses that contain the parameters (if any required). The dot `.` is used to call the method, indicating that this is the method of a given object.

This step explores the concept of `method` with the `string` object. We have plenty of `string` objects at hand: each line of the book we read is a `string` that we can 'play' with. A list of `string` methods is available on [W3School website](https://www.w3schools.com/python/python_ref_string.asp)

# Task 5.1 Change Chapter Lines Into Titles

When reading a book, we want to ensure that the chapters' titles are properly written: each word starting with an upper case. That is a typical example of what we can do on a `string`.

We first need to check whether the line starts with "CHAPTER". Then, we want to apply the title capitalisation. We will perform this change when we read a new line from the file, in the function `show_book_page()`. The algorithm looks as follows:

```markdown
Read the next line from the book
If the line starts with "CHAPTER"
    Apply the title capitalisation
```

In Python, `strings` have a method `startswith()` that takes one parameter: the value to check if the `string` starts with. `Strings` also have a methods `title()` which returns a copy of the `string` where the first character in every word is upper case.

In _Replit_, change the code to show each chapter title in title capitalisation. Then, execute the program to see if it works as expected.

[Check the code on Replit](https://repl.it/@IO1075/03-ereader-step5-1)

# Task 5.2 Add a Line Number

After applying capitalisation, it would be an excellent place to add the line number. It is handy information when referencing a quote from the book. For this, use the variable 'i' from the For-Loop and concatenate it with the content of the line.

Add the new line and execute the code. The line numbers should appear on the left side of each line, from 1 to 15.

[Check the code on Replit](https://repl.it/@IO1075/03-ereader-step5-2)

# Task 5.3 Add a Page Header with Title and Page Number

Let's count and show the page number as a header of each page, along with the book title.

We start in the definition of the function `show_book_page()`. It is where we show the page, thus it is the place to show the header. However, we have neither the 'title' nor the page we are currently on. We need to bring in this information into the function.

Add a third and fourth parameters 'title' and 'page_count' to the function `show_book_page()`. Now that we have this information, we can add the header with the title and the page count.

```markdown
...
Show 40 empty lines
Show the page header "==== title -- Page page_count ===="
For the number of lines per page
...
```

As we added two parameters to the function `show_book_page()`, we need to update the calls to this function in `read_book()`. We still miss the title of the book, thus we add a third parameter, 'title', to the function `read_book()` so that we can pass it as an argument of `show_book_page()`.

However, we can count the pages inside `read_book()`. We can create a variable that we increment for each page read. It would look as follows: 

```markdown
Open the file book.txt in 'read' mode and store it in the 'book' variable
Create a variable page_count with the value 1
Show the next book page with page_size number of lines
Increment page count
While user pressed ENTER (empty string)
    Show the next book page with page_size number of lines
    Increment page count
Close the file book.txt
```

Note: we need to provide page_count as the fourth argument when calling `show_book_page()`.

Finally, we need to update the call to `read_book()`.

* Create a constant BOOK_TITLE at the top of the file with the value 'Les Misérables'
* Pass the argument BOOK_TITLE to the function call `read_book()`.

Execute the code to check the page's header with the book title and the page number.

[Check the code on Replit](https://repl.it/@IO1075/03-ereader-step5-3)

# Task 5.4 Add Some Color

In the previous Tasks, we combined numbers and strings with building a header and showing the line numbers. This concatenation requires converting each number into a `string` and connecting each `string` with plus signs `+`.

Python provides a simpler way to compose `string`, so called f-string. Taking the page header as an example, the f-string works as follows:

```python
print(f"==== {title} -- Page {page_count} ====")
```

Note the `f` at the front of the string, which indicates an f-string. It enables to integrate variables inside the `string`, using curly brackets `{}`. With this syntax, Python automatically converts numbers and other data types into a `string`.

Change the header, the footer prompting for the user input and the line numbers into f-strings.

As the syntax becomes more compact, we can add more, such as colour. Changing colour in the Terminal is similar to changing line with "\n": we need special characters. Here are three special characters to switch the colour to white, orange or blue. We place them at the top of the file as constant to use more straightforward names throughout the code.

```python
# Create 3 constants W, O and B for quick access to colour characters
W  = '\033[0m'  # white (normal)
O  = '\033[33m' # orange
B  = '\033[34m' # blue
```

If you want to learn more about possible characters and colours, have a look at the [Wikipedia page on ANSI Escape Code](https://en.wikipedia.org/wiki/ANSI_escape_code#Colors). Following up on the header, we can make it orange as follows:

```python
print(f"{O}==== {title} -- Page {page_count} ===={W}")
```

Note the `{W}` at the end, switching back the colour to white. Otherwise, it will print all the following characters in orange.

Change the colour of the header and footer to orange. Then, change the colour of the line number to blue. Finally, execute the code to check the colour of the header, footer and line numbers.

[Check the code on Replit](https://repl.it/@IO1075/03-ereader-step5-4)

[Next: Step 6 - Assert]({{site.baseurl}}/computational-thinking/03-ereader/step6-assert){: .btn .btn-purple }