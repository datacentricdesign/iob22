---
link-assignment: /assignments/02-vending-machine/step4/#what-is-an-exception
---

## What is an Exception?

Exceptions give the computer the ability to _try_ executing a piece of code and deal with the error if any pops up.

It has the following elements:

* `action` what the computer try to do, which can potentially fail
* `error` the error that the computer runs into
* `fallback action` what the computer should do in case of an error
* `clean up action` what the computer should do in any case after the action or the fallback action

With these elements, we can describe the Exception algorithm as follows:

#### Exception Algorithm

```markdown
Try to do [action];
if it fails, keep a report of the [error] and do [fallback action];
in any case do [clean up action]
```

#### Exception Flow Chart

![Exception Flow Chart]({{site.baseurl}}/assets/flow_chart_exception.svg)

The Python syntax for `Exceptions` involves three keywords -- `try`, `except` and `finally` -- respectively matching the three steps of our algorithm.

#### Exception Python Syntax

```python
try:
    # action
except ErrorType as error:
    # fallbackAction
finally:
    # cleanUpAction
```