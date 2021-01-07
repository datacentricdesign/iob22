---
layout: default
title: Step 4 Exception
parent: "02 Vending Machine"
---

# Step 4 Exception
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# Task 2.1 Test incorrect values

What if something goes wrong? The user enters a value that 

Let's try to enter a beverage option that is not a number and see what happens.

Our program fails with the following:

[TODO screenshot value error]

Indeed, there is a value error. The user provided a value that cannot be converted into a number. This event makes the program fail while there is nothing wrong in the code. We call these 'Runtime Error', errors that occur during the execution of the program.

To protect our program against these errors, there is the concept of Exception. It has the following elements:

* `action` what the computer try to do
* `error` the error that the computer runs into
* `fallbackAction` what the computer should do in case of an error
* `cleanUpAction` what the computer should do in any case after the action or the fallback action

#### Exception algorithm
_Try to do **action**; if it fails, store the **error** and do **fallbackAction**; in any case do **cleanUpAction**_
{: .fs-5 .ls-10 .code-example }

#### Exception flow chart
![Exception Flow Chart]({{site.baseurl}}/assets/flow_chart_exception.svg)


#### Exception Python Syntax

```python
try:
    # action
except ErrorType as error
    # fallbackAction
finally:
    # cleanUpAction
```

# Task 4.2 Prevent ValueError

[implement exception to catch ValueError]