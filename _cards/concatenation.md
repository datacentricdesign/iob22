---
link-assignment: /assignments/01-calculator/step5/#task-52-can-we-add-text
---

## Task 5.2 Can we add text?

The difference between our two programs (one giving the wrong sum result and one giving the correct one) lie in the input: the second version is not asking for the input, but directly taking two numbers `2` and `5`. Thus, the computer is not understanding our input the way we want. But if `2` and `5` are not numbers, what are they and why is the computer even answering? Hmm.

Let's erase our previous test and try the following:

```python
print("python" + "text")
```

Hmmm. We can add text? Yes, it is called `concatenation`. Could it be that the computer thinks our variable `x` and `y` are text instead of a number?

Let's pause for a moment and expand our understanding of data types. We saw in Step 1 that variables have data types. Numbers such as `2` or `5` can be kept in memory as int (for integer) but also as char (for character). Indeed, `2` is a text character as `A` or `!`.

So what is Text? Text is a sequence of characters. It is an _object_ (or data structure) which combines one or several values of type `char` in a sequence. This object is commonly called `string`. In Python, we represent a string with double quotes `"` such as `"2"`. We already saw examples with inputs messages such as `"Type in x: "`.

Going back to our debug session, how do we check the type of a variable? If you _Google_ _'Python find out the type of a variable'_, you will find `type`. Note how to search: first the language (Python) and then what you are looking for.

Then, erase our previous test and ask the user for input so that you can check its type.

```python
# Create a variable called x of type number that starts with the value 0
x = 0
# Ask the user ‘Type in x: ’ and store the answer in x
x = input("Type in x: ")
# Tell user the type of x
print(type(x))
```

Ask the computer to execute your instruction by clicking on the green arrow at the top of the page.

If you run this program several times with a number or a word as input, you will notice that in any case, the type of `x` becomes `str`.
In Python, `str` stands for `string`, as we just explained, a chain of characters, or in other words text.

Note: the exact result is `<class 'str'>`. We will introduce what a class is later in the assignments.

It looks like we touch on the problem. We want to sum two numbers but instead, we concatenate (e.g. join together) two strings. This explains why `2 + 5` provide `25` as a result. Here, we highlight the influence of data type on the computer's behaviour.