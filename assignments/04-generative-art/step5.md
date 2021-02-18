---
layout: default
title: Step 5 List
parent: "04 Generative Art"

---

# Step 5 List
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/Sfa4Fk6yg2c" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

In this step we use text to generate an abstract visualisation. We extract the text of a book and split it into a list of sentences using the Natural Language Toolkit `nltk`. Then, we split the sentence into a list of words and count its number. This count of words drive the length of each path segment on the drawing to generate an abstract visualisation as follows.

#### Based on Oliver Twist by Charles Dickens

![Abstract Sentences]({{site.baseurl}}/assets/images/assignment4-sentences.png)

So far we used the SVG line element, defined by the position of two points. The `path` is another common SVG element. It allows to definea sequence of position together with an action. Among the actions, `M` stands from move to and `L` for line to. Here is an example in which we _move to_ the position `500 500` (reaching the point without drawing), then we _line to_ `700 500` (drawing a line), then again we _line to_ `700 700` (drawing a line)

```xml
<path stroke-width="5" stroke="red" fill="none" d="M500 500 L700 500 L700 700" />
```

<svg viewBox="0 0 2000 700">
    <path stroke-width="5" stroke="red" fill="none" d="M500 500 L700 500 L700 700" />
</svg>

More actions are available for an [SVG path](https://www.w3schools.com/graphics/svg_path.asp)

# Task 5.1 Serve a Path

Let's start the abstract sentence drawing by creating the function and the HTTP route to serve it. For this task, will we aim to draw the path shown above. In the file `drawing.py`, define a new function `make_drawing_abstract_sentences()` with the following algorithm.

```markdown
Initiate the drawing of size 2000 x 3000 with the SVG tag
Draw a test path
Close the drawing with the SVG tag
Return the drawing
```

Then, import this function at the top of the file `main.py`.

Finally, create a new HTTP route '/sentences' which connects to a new function `serve_abstract_sentences()` to return the result of `make_drawing_abstract_sentences()`.

Execute the code, and check the web page on `/sentence` to see the result.

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step5-1)

# Task 5.2 Draw Abstract Sentences

We have an HTTP route and a function which draws a path. We can bring in some text.

On the left panel of _Replit_, create a new file 'book.txt'. Open [Oliver Twist by Charles Dickens](https://www.gutenberg.org/files/730/730-0.txt) from the Gutenberg project. Copy and paste the whole text in the file 'book.txt'.

To create the visualisation, we want to split the text into sentences. The Natural Language Toolkit `nltk` comes handy for such task.

On the left panel of _Replit_, click on the third icon for the package manager. Search for `nltk` and click on the plus sign `+` to install the package.

In the file `drawing.py`, import the functions `sent_tokenizer()` and `download()` from the module `nltk`.

We have now all the ingredients for our algorithm. We extract the text of a book and split it into a list of sentences. We split each sentence into a list of words and count its number. We use this count as length of next path segment, always turning clockwise.

#### Make Drawing Abstract Sentences Algorithm

```markdown
Open the file book.txt in 'read' mode and keep it in the 'book' variable
Read the whole book and keep the text in the 'text' variable
Download Natural Language model 'punkt'
Split text into a list of sentences
Initiate the drawing of size 2000 x 3000 with the SVG tag
Initialise turn counter
Initialise the x position to 1000
Initialise the y position to 1500
Start building the path with the stroke attributes, no filling 
Start d attribute with M (Move to) at x and y position
For each sentence in the sentence_list
    Count number of words in the sentence
    If turn_counter = 0, go right
        Add number_words to x
    If turn_counter = 1, go down
        Add number_words to y
    If turn_counter = 2, go left
        Substract number_words to x
    Else we go up
        Substract number_words to y
    Add space (after previous value) and attribute L (Line to) with updated x and y
    Increment the turn_counter
    Apply modulo 4 to keep the counter between 0 and 3
Close the path and the drawing with the SVG tag
Return the drawing
```

Copy all the algorithm as comments in the function `make_drawing_abstract_sentences()` and write the code for the two first line: open and read the book.

Then, you can use the nltk toolkit: first call `download()` to get a model that recognise sentences based on full stops. second, call sent_tokenize with the text of the book to get a list of sentences.

```python
# Download Natural Language model 'punkt'
download('punkt')
# Split text into a list of sentences
sentence_list = sent_tokenize(text)
```

The next challenge is the `for-loop`. We already encountered `for-loops`. However, this time we want to iterate directly on the list of sentences. This can be achieve like this:

```python
# For each sentence in the sentence_list
for sentence in sentence_list:
    # Do something with the sentence
```

To count the number of words in the sentence, we suggest the following operations on each sentence. We use the string method `replace()` to replace all the new line characters `\n` by a space ` `. Thus, we obtain the sentence on a single line. On this new string, we apply the string method `split()` which will cut the sentence at each `space`, making a list of words. Finally, we use the function `len()` to count the number of item in the list of words (`len` standing for _length_ of the list).

```python
number_words = len(sentence.replace('\n', ' ').split(' '))
```

Finally, throughout the iterations we keep track of the last turn by counting from 0 to 3. In each iteration we apply a modulo 4 on the turn_counter to ensure that the counter never exceed 3. In Python, the modulo operator is the percent symbole `%`. You can use the assignment `turn_counter %= 4`.

Execute the code and refresh the web page `/sentences` to check the results.

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step5-2)


[Next: Step 6 - Recap and More]({{site.baseurl}}/assignments/04-generative-art/step5){: .btn .btn-purple }