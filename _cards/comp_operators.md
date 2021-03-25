---
link-assignment: /assignments/02-vending-machine/step3/#task-33-shame-greedy-users
---

# Task 3.3 Shame greedy users

Our vending machine could be a bit bias and tune its message to promote healthy habit such as reducing sugar. Of course, the best option would be not offer sugar, but it gives us a nice opportunity to explore **comparison operators**. We have seen equal to `==` earlier which works with both numbers and string. Additionally, in Python you can use:

* `>` and `<` for _greater than_ and _lower than_, as in mathematics
* `>=` and `<=` for _greater or equal to_ and _lower or equal to_
* `!=` for _not equal to_

For our bias vending machine, we could check whether the user takes 3/5 or more of sugar. In this case, we would add to the final message

#### Two much Sugar algorithm

```markdown
Add to message whether the user take their beverage with or without sugar

Convert sugar into integer
If sugar greater or equal to 3
    Add to message a 'healthy' comment
```

Note that we now convert the sugar input into an integer, so that we can compare as a number. Otherwise, we would compare whether a string is greater or equal to another which could lead to different behaviour.

You are convinced that we should reward good behaviour instead of shaming bad behaviour? Tweak the algorithm to make it the way you want: you are the designer!

In your _Replit_ project, you can transform your algorithm to add the biased message.

Execute the code to check that it behaves the way you expect.

[Check the code on Replit](https://repl.it/@IO1075/02-vending-machine-step3-3)