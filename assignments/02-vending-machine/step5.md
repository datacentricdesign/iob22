---
layout: default
title: Step 5 File
parent: "02 Vending Machine"
---

# Step 5 File
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

- TOC
{:toc}

---

In Step 3 we played with different operators. For instance, we used assignments and conditions to decrease the number of remaining cups. You might have noticed that each time you execute the code, the number of cups is 10 (or the number that you set) and then it decreases by one. The computer 'forget' between each execution of the code. The variables that keep information during the execution of the code are only available during the execution. As soon as the program stop, all this information is wiped out.

In this step, we will explore how to use files to store and retrieve information at the beginning and the end of the program so that our program can 'remember' the number of remaining cups.

## What is a File?

A computer as two types of memory, short term that we often called RAM (for Random Access Memory) and long-term that we often call drive (e.g. HDD or SSD). On the former, the computer handles the variables of all program currently running while the latter is for everything to save for later use. Files is a common way to structure long-term memory. You certainly use files to store pictures and other documents. A file is characterised by a path (where to find it), a type of content (e.g. text, picture, video) and a size.


# Task 5.1 Save Remaining Cups

In our context, we want to save the number of remaining cups in a file. Thus, we will focus on text files. In order to write in a file, we need the following elements:

* `path` where to find the file
* `file variable` 
* `text` what we want to save in the file


#### Write in file Algorithm

```markdown
Open the file located at [path] in write mode and keep it in the [file variable]
Write [text] into the file
Close the file
```

We recognise the path that we mentioned and the text that we want to save into the file. We keep our access to the file in a variable, so that we can `write` text in it and `close` it at the end. The Python syntax would look as follows:

#### Write in File Python syntax

```python
file_variable = open("path", "w")
file_variable.write(text)
file_variable.close()
```

In this syntax we can recognise that the first line 'opens' a file, using the path. `w` stands for `writing` mode. Like a string, the file_variable is an `object`, a data structure that combines several data-types enabling us to easily manipulate a file. `write` and `close` are actions that we can perform on this file `object`. 


#### Save Remaining Cups Algorithm

With this new knowledge, we can save the number of remaining cups before the end of our program, for example:

```markdown
Open the file cups.txt in 'write' mode and keep it in the 'cup_file' variable
Convert number_remaining_cups into string
Write number_remaining_cups in cup_file
Close the file cup.txt
```

Note the conversion of the number into a string: we can only store a piece of text.

In your _Replit_ project, you can add this algorithm at the end of the code and translate each line into Python syntax. 

Execute the code to check that it behaves the way you expect.

When your program works properly, you should see a new file 'cups.txt' in the left panel of _Replit_. You can open it and check if it properly contains the number of remaining cups.

[Check the code on Replit](https://repl.it/@IO1075/02-vending-machine-step5-1)


# Task 5.2 Retrieve Remaining Cups

Once we saved information, we need to retrieve it at the beginning of our program so that we can use it. We want to read from the file.

#### Read from file Algorithm

```markdown
Open the file located at [path] in read mode and keep it in the [file variable]
Read from the file and keep it in [text variable]
Close the file
```

This algorithm is similar to the one writing into files. We note the `read` mode instead of write. We now keep information read from the file into a text variable.

#### Read from File Python syntax

```python
file_variable = open("path", "r")
text = file_variable.read()
file_variable.close()
```

We can use the read from file algorithm to retrieve the number of remaining cups that we saved in the file 'cups.txt'.

#### Retrieve Remaining Cups

```markdown
Open the file cups.txt in 'read' mode and keep it in the 'cup_file' variable
Read the number of remaining cup from cup_file as text
Convert number_remaining_cups into a number
Close the file cup.txt
```

Note the conversion again from string to integer, so that we can use the text from the file as a number.

In your _Replit_ project, you can add this algorithm at the beginning of the code and translate each line into Python syntax.

Execute the code to check that it behaves the way you expect.

[Check the code on Replit](https://repl.it/@IO1075/02-vending-machine-step5-2)


# Task 5.3 Deal with Missing Information

With this code, we do not need to initialise number_remaining_cups as it comes from the file. However, there is still one situation when we need to do so: when there is no existing file to tell us the number of remaining cups.

Let's test! Right-click on the file cups.txt and delete it. Then, execute the code again. An error fails the program because the file does not exist.

We can reuse the `Exception` mechanism we introduced in the previous step. In this case, we want to try to open and read the file. If this action fails, then we need to initialise the number of remaining cups. This would look like this:

```markdown
Try to do something
    Open the file cups.txt in 'read' mode and keep it in the 'cup_file' variable
    Read the number of remaining cup from cup_file as text
    Convert number_remaining_cups into a number
    Close the file cup.txt
If it fails
    Create a variable called number_remaining_cups of type int with the initial value 10
```

In your _Replit_ project, you can transform your algorithm to add the exception mechanism and translate each line into Python syntax.

Execute the code to check that it behaves the way you expect.

[Check the code on Replit](https://repl.it/@IO1075/02-vending-machine-step5-3)


[Next: Step 6 - Recap and More]({{site.baseurl}}/assignments/02-vending-machine/step6){: .btn .btn-purple }