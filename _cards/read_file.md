---
link-assignment: /assignments/02-vending-machine/step5/#task-52-retrieve-remaining-cups
---

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