---
link-assignment: /assignments/05-covid-dashboard/step3/#dictionary
---

# Dictionary

We briefly mentioned `dict` in the previous Step to wrap a list of data in a JSON data structure with key/value pair. A `dict` can be seen as an equivalent of a JSON object in Python. It is an object composed of key/value pairs that we can manipulate in Python. All JSON data structures are mapped into `dict` to be manipulated.

We define a `dict` with curly brackets, as mentioned in the previous Step.

```python
my_data_dictionary = {
  "Country": "Netherlands",
  "TotalConfirmed": 1234
}
```

To access the value associated with a key, we state the name of your `dict` variable and specify the key between square brackets.

```python
country = my_data_dictionary["Country"]
```

To assign the value to a specific key, we turn the expression around.

```python
my_data_dictionary["Country"] = "Netherlands"
```