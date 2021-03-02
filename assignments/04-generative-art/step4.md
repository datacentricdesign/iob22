---
layout: default
title: Step 4 Random
parent: "04 Generative Art"

---

# Step 4 Random
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

Making art can benefit from a salt of randomness. For this, let's explore the Python module `random`. However, keep in mind that it is not trivial to generate truly random numbers. Beyond the scope of this assignment, we encourage you to search the Internet for the complexity behind teaching randomness to a computer.

 Note we do not need to install this module as it is provided with Python. We call these 'standard libraries'. Common function of the random module are explain [on the W3School website](https://www.w3schools.com/python/module_random.asp)

# Task 4.1 Random Choice

We will first let the computer randomly decide to draw a line of the radial or to skip it.

At the top of `drawing.py`, import the function 'choice' from the module 'random'. `choice()` takes one parameter: a list of values to choose from.

A list? A list is an object (or data structure) representing a sequence of items. We will explore this further in the next step. For now, we just need to know that to define a list in Python we use the square brackets `[` and `]`, separating each item with a comma `,`. To choose between drawing and not drawing, we need a list with to items: `[True, False]`. We can use the `choice()` function as follos:

```python
# Randomly choose to draw or skip the line
if (choice([True, False])):
    # Draw a line tilting y and y2 with +/- i
```

Duplicate the function `make_drawing_radial_lines()` into `make_drawing_random_radial_lines()`.

Then, update the two for-loops to randomly choose to draw or skip the line.

Finally, create a new HTTP route `/random` in `main.py` which connects to a function `serve_random_radial_lines()`. This function will return the result of `make_drawing_random_radial_lines()`. Note that you will need to import this function from `drawing.py`.

Execute the code and go to the HTTP route `/random` to check the result.

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step4-1)

# Task 4.2 Random Length and Position

We can further randomise the drawing by changing the length and positions of each line. To generate a value within a range, we can use the function `randrange()` from the random module. It takes two arguments: a start value and an end value. We could generate two random number for each line, which could influence its start position and end position. For example:

```markdown
Randomly choose to draw or skip the line
Generate 2 random numbers between 0 and width/2
Draw a line tilting y and y2 with +/- i
```

Import `randrange()` at the top of `drawing.py` and write the code to generate two numbers for each line and influence their positions. Feel free to example the range of random values and the way you influence the lines.

Execute the code and go to the HTTP route `/random` to check the result. If you are already on the web page you will need to refresh.

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step4-2)

# Task 4.3 Random Colour

Let's play with colour as a third way of randomising the the drawings.

SVG support a series of [colour names](https://www.w3.org/TR/css-color-3/#valuea-def-color) as well as the different cubic representations such as RGB (for Red Green Blue) or HSL (Hue Saturation Lightness). The RGB representation looks as follows: `#RRGGBB`, involving a hashtag `#` and an hexadecimal encoding of two digits for each colour component red, green and blue.

Hexadecimal encoding? It means that each digit goes from 0 to 15 (16 values). To represent these values, we use the 10 decimal digits and the six first alphabet letters.

Thus, to generate a random colour in hexadecimal, we need to pick six times a value among these sixteen possibilities.

#### Random Hexadecimal Colour Algorithm

```markdown
Create a string variable hexadecimal_characters with of hexadecimal values '0123456789ABCDEF'
Extract six random values from the hexadecimal_characters and keep it in the variable random_value_list
Join the list of six values into one string with the prefix '#'
```

For picking six values, we can use the function `sample()` from the random module. It takes two arguments:
* the list of possible values: the variable `hexadecimal_characters`
* the number of sample to pick: 6

Once we have a list of six values, we want to _join_ them together as a string. We already explored some of the string methods  such as `title()` or `startswith()`. `join()` is another string method that joins a list of items into a `string`. In this case, the initial string is used as a separator. For example, the following code calls `join` on the string `','`, which will result in the string: `'value1,value2,value3'`

```Python
comma_separated_values = ','.join(['value1','value2','value3'])
```

In our case we do not want any separator, so we can use an empty string such as: `''.join()`.

In `drawing.py`, write a function `generate_random_hexadecimal_colour()` which return an hexadecimal colour code based on six random values.

Then, call this function in `make_drawing_random_radial_lines()` to randomly colour the radial lines.

Execute the code and go to the HTTP route `/random` to check the result.

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step4-3)

As we mentioned at the beginning of this step, randomness is not an easy task for computer, and to some extend for humans. In the next step we rely on data instead of randomness.

[Next: Step 5 - Generative Art]({{site.baseurl}}/assignments/04-generative-art/step4){: .btn .btn-purple }