---
link-assignment: /assignments/05-covid-dashboard/step2/#constant
---

# Constant

At this stage, we can make a couple of improvements to our code in `covid.py`.

First, we are duplicating the URL of the COVID19 API. As duplicating is never a good strategy, we suggest to create a constant variable `URL_API` at the top of the file, just after the `import` statement:

```python
# Create a constant 'URL_API' with the URL of the API
URL_API = "http://api.covid19api.com"
```

We can now replace this part of the URL in both functions with `{URL_API}` (using an f-string). This is always a good practice to place all repeating strings as constant at the top of the file.