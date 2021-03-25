---
link-assignment: /assignments/02-vending-machine/step2/#task-22-chained-conditional
---

# Task 2.2 Chained conditional

So far, any choice that is not a coffee would lead to serving tea. To solve this problem, we need the ability to check the choice twice, for coffee and tea. Chained conditionals allow checking for multiple conditions, each leading to a different action. If the first condition is not met, then the following one is checked until a condition is True. If none of them are true, the default action (else) is used.

[TODO Flow chart]

In Python, the keyword `elif` is used for chaining additional conditions with respective actions.

```python
if condition:
    # action 1
elif condition2:
    # action 2
elif condition3:
    # action 3
else:
    # default action
```

Thus, we can add an alternative to check if the choice is `2` (for tea). We also adapt the default alternative to tell the user that this is not a valid option.

```markdown
...

If choice is equal to 1
    Then tell the user "Here is your coffee."
Else if choice is equal to 2
    Then tell the user "Here is your tea."
Else this is not a known choice
    Tell the user "Sorry, I do not know this choice."

Tell the user "Have a great day!"
```

In _Replit_, add the new lines of the algorithm to your project as comments, then add the Python translation for each line.

Execute the code to check that it behaves the way you expect.

[Check the code on Replit](https://repl.it/@IO1075/02-vending-machine-step2-2)