---
link-assignment: /assignments/02-vending-machine/step3/#task-31-count-remaining-cups
---

# Task 3.4 Combine Conditions

In this final task on operators, we will tune our vending machine to detect when the user wants a black coffee: no sugar, no milk. In this case, we can use **logical operators** to combine multiple conditions. Such combination could look as follows

```markdown
If choice is coffee without sugar nor milk
    Add to message "Here is your black coffee."
Else if choice is equal to 1

...
```

In this algorithm, we want to check three variables: choice, sugar and milk. In Python, we can use `and` between each condition, enforcing that all conditions much be true. We can also use `or`, making sure that at least one of the condition is true.

In your _Replit_ project, you can transform your algorithm to add the black coffee branch.

Execute the code to check that it behaves the way you expect.

[Check the code on Replit](https://repl.it/@IO1075/02-vending-machine-step3-4)

This is it for our operator exploration. As mentioned in the introduction, there are many more which you can explore on the [W3School website](https://www.w3schools.com/python/python_operators.asp). However, the way to use them is the same, feel free to explore on your own.