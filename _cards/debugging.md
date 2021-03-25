---
link-assignment: /assignments/01-calculator/step5/#what-is-debugging
---

## What is Debugging?

The code we wrote in the previous step leads to unexpected behaviour. We want the computer to sum up two numbers and we do not get the right answer. This is an opportunity to _debug_ our program, i.e. to investigate what is happening and why it is not working as expected.

You will soon realise that this is a big part of programming and being good at programming as a lot to do with the ability to investigate and fix code. This is why we start _debugging_ now.

Typically, the key questions are: did you tell the computer what to do incorrectly? Or did you tell it to do the wrong thing?

In our situation, the problem seems to revolve around the line that sums the `x` and `y`:

```python
sum = x + y
```
