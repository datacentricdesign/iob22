---
link-assignment: /assignments/02-vending-machine/step5/#task-51-save-remaining-cups
---

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

In this syntax, we can recognise that the first line 'opens' a file, using the path. `w` stands for `writing` mode. Like a string, the file_variable is an `object`, a data structure that combines several data-types enabling us to easily manipulate a file. `write` and `close` are actions that we can perform on this file `object`.


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