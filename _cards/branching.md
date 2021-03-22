---
layout: default
title: Branching
link-assignment: /assignments/02-vending-machine/step2/#what-is-branching
---

## What is Branching?

When the computer chose to do one of two actions, e.g. coffee or tea, we call this _branching_.

To create a branch, we need three elements:

* `condition` the definition of what is true or false
* `action` what to do when the condition is true
* `alternative action` what to do when the condition is false

So the branching algorithm looks like this:

#### Branching algorithm

```markdown
If [condition] is true
then do [action];
otherwise do [alternative action]
```
{: .fs-5 .ls-10 .code-example }

The flow chart is also a convenient, graphical way to represent branches. As branching is a key element of flow charts, it has its specific shape, the diamond, representing a decision.

#### Branching flow chart

![Branching Flow Chart]({{site.baseurl}}/assets/flow_chart_branching.svg)

In Python, the syntax for branches relies on the keywords `if` and `else` and looks as follows:

#### Branching Python syntax

```python
if condition:
    # then action
else:
    # otherwise alternative action
```

Let's pause on this syntax for a moment. This is the first Python syntax we encounter that requires several lines of code. We call this a compound statement. This structure involves two important Python elements:

* The colons `:` at the end of the `if` and `else` lines tell the computer that the expression is not yet complete. It involves a sub-expression; 
* The indentation -- 4 spaces or a `TAB` in front of the action and alternative action -- are required in front of each sub-expression.

Finally, the result of the condition is `True` or `False`. There is a data-type for this, `boolean`. Variable of type `boolean` can only take the value `True` or `False`. This adds to the data-types `int`, `float` and `char`.

[]({{site.baseurl}}{{page.url}})