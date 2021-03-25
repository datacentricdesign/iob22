---
layout: default
title: Syntax
link-assignment: /assignments/01-calculator/step1/#python-syntax
---

# Python syntax

As a final step, you will translate each assignment step into Python so that you can test your algorithm. At this stage, we will introduce new Python-related syntax when necessary. We will distinguish between:

* what you have to write for the code to work: these are the keywords and code structure that defines Python in the same way grammar and punctuation defines English. Introducing typos in these syntaxes will lead to unexpected output or simply your program not starting.
* what is conventional, what developers in Python are used to see: we will use green boxes to indicate these conventions.

Let's start with the first Python Syntax: comments.

In programming, a **comment** is a plain English explanation of what you want to do. It is ignored by the computer and serve the developers of the code themselves as well as anyone reading the code.

In Python, a comment starts with a hashtag `#`. Anything after a `#` (on the same line) is considered as a comment, thus it is ignored by the computer. Here is an example of our calculator algorithm (we simply add a `#` at the beginning of each line):

#### Python Syntax -- Comments

```python
# Reserve [memory] for three numbers
# Ask the user two [numbers]
# Make the [calculation]
# Tell the [result] to the user
```

And an example of conventions:

**By convention**, comments explain _what_ to do and not _how_ to do it. The how comes from the code.
{: .fs-5 .ls-10 .code-example .bg-green-000}

({{site.baseurl}}{{page.url}})