---
link-assignment: /assignments/01-calculator/step5/#task-53-convert-text-to-numbers
---

## Task 5.3 Convert text to numbers

How do we fix this issue? We need an algorithm to convert the input from `string` to an `integer`. We need two elements:


* `old variable` in a non-integer format
* `int variable` integer to hold results

With these, the integer conversion algorithm would look as follows:

#### Integer conversion algorithm

```mardown
Convert [old variable] to integer and store in [int variable]
```

To realise this in Python we can write:

```python
int_variable = int(old_variable)
```

OK, let's start fresh. Create a new `Replit` project and bring back only the comments without code. Note the two new lines `Convert ...`.

```markdown
Create a variable called x of type number that starts with the value 0
Create a variable called y of type number that starts with the value 0
Create a variable called sum of type number that starts with the value 0
Ask the user 'Type in x: ' and store the answer in x
Convert x to integer
Ask the user 'Type in y: ' and store the answer in y
Convert y to integer
Put x + y in sum
Tell user "The answer is "
Tell user sum
```

Translate each line into Python. Then, ask the computer to execute your instruction by clicking on the green arrow at the top of the page.