---
link-assignment: /assignments/03-ereader/step3/
---

## What is a For-Loop

In contrast with the `While-Loop`, the `For-Loop` structure makes the boundaries of the loop explicit. This is the recommended way when we know how many loops are needed. The elements of the For-Loop look as follows:

- `i` integer variable that will control loop
- `start` integer value of `i` at the beginning
- `finish` integer value of `i` at the end
- `change` integer to add to `i` at each pass
- `action` the block of code to perform in each iteration

This time we define a variable as part of the structure, often named `i` for 'index', which keeps track of the iteration number. `start`, `finish` and `change` define the number of iterations.

#### For-loop algorithm

```markdown
Begin with [i] at the [start] and add [change] to [i] in each iteration until [i] is larger than or equal to [finish];
do [action] in each iteration
```

#### For-loop flow chart

![For loop - Flow Chart]({{site.baseurl}}/assets/flow_chart_for_loop.svg)

#### For-loop Python syntax

```python
for i in range(start, finish, change):
    # action
```