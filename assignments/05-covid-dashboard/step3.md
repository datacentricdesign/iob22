---
layout: default
title: Step 3 Chart
parent: '05 COVID Dashboard'
---

# Step 3 Chart

{: .no_toc }

## Table of contents

{: .no_toc .text-delta }

1. TOC
{:toc}

---

<iframe width="560" height="315" src="https://www.youtube.com/embed/1lPOiUwgpwI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

So far, our web server is capable of collecting COVID-19 data from a web service and serving it to the browser. The web server does not bring any additional value yet. There are many different tools, frameworks and libraries to visualise data. In this assignment, we introduce [Vega](https://vega.github.io/vega/), which tries to focus on the visualisation aspect of development rather than the code. This contrasts with visualisation tools that constraint the easability of developing visualisations by the way the code is structured.

# Vega - Vizualisation Grammar

As described from its website, _'Vega is a visualization grammar, a declarative language for creating, saving, and sharing interactive visualization designs. With Vega, you can describe the visual appearance and interactive behavior of a visualization in a JSON format, and generate web-based views using Canvas or SVG'._ [Vega](https://vega.github.io/vega/)

We think that this approach might enable designers of visualisations to focus on graphic concepts rather than the technical implementation.

# Task 3.1 Specify Summary Chart

With Vega, we build on a data structure that we have already encountered: JSON. Instead of writing code, we describe the elements of the visualisation. Then, this description can be used in different programming languages to generate visualisations. Let's look at the dashboard that we are envisioning, once again, so that we know what we are heading for.

![Assignment 5 - End Result]({{site.baseurl}}/assets/images/assignment5-end-result.png)

We start with the top right chart summarising the global COVID situation by listing all case counts per country. In _Replit_, create a folder `templates`. It will contain the templates of our three charts. Inside this folder, create a file `summary.json` and paste the following:

```json
{
  "$schema": "https://vega.github.io/schema/vega-lite/v4.json",
  "title": "Total per Country",
  "data": {
    "values": []
  },
  "mark": {
    "type": "bar"
  },
  "encoding": {
    "x": {
      "field": "TotalConfirmed",
      "type": "quantitative"
    },
    "y": {
      "field": "Country",
      "type": "nominal"
    }
  }
}
```

This is all we need to describe the chart.


- The schema, like for SVG, is a link to the rule definitions of Vega - all the elements that we can put in this JSON structure to render a valid Vega chart;
- The title of the chart;
- The data, an array of values to show on the chart. Here it starts empty, as each time we show the chart, we will get the latest data and update the array;
- The mark specifies the "idiom" of the chart. For now we will leave Vega generate a default bar chart;
- The encoding is the place where we define what should go where. There are `x` and  `y` axes. Looking at the data extracted below (from our own server), the total confirmed cases per country appears associated with the key `TotalConfirmed` in each country. We use this key for `x`, it is a number, it is of the type `quantitative`. Similarly for the `y` axis, we use the key `Country` to hold the ID of each country, this time the type will be  `nominal` (not a quantitive value, and also not ordered - it cannot be sorted). Note that the countries are on the `y` axis so that the long list of countries unfolds vertically. The other way around would also work.

![Assignment 5 - Sample data total confirmed ]({{site.baseurl}}/assets/images/assignment5-step3-total-confirmed.png)

These are all the details needed for Vega to generate a bar chart. We now need to bring in the data.

# Dictionary

We briefly mentioned `dict` in the previous Step to wrap an list of data in a JSON data structure with key/value pair. A `dict` can be seen as an equivalent of a JSON object in Python. It is an object composed of key/value pairs which we can manipulate in Python. All JSON data structures are mapped into `dict` to be manipulated.

We define a `dict` with curly brackets as mentioned in the previous step.

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

# Task 3.2 Select Data

This is already enough information about how to use Dictionaries to manipulate our data. In the sample data from the previous task, we know that the data comes in a JSON object with the key `Countries` including the detailed list of all countries. So what we need to do is to get our Vega template, get fresh data from the API, extract the list of countries with the key `Countries`  from our object, and insert this list in the Vega template.

To load the Vega template from the JSON file, we use the `json` module at the top of `main.py`. Then we can focus on the function `serve_summary()` which currently contains only a call to the function `download_summary()`. The steps are the following:

```python
  # Load json template from summary.json
  # Download summary from the COVID API
  # Add the data to the template
  # Send the chart description to the client
```

To load the JSON template, we use the json module. We use `open()` that we have already used in the previous assignments to open a file. We give this file to the function `load()` from the json module. This brings in our json template in Python, as a `dict`.

```python
  # Load json template from summary.json
  json_template = json.load(open("templates/summary.json"))
```

Next, we download the API data. Instead of returning this data directly, we keep it in a variable: another json structure in the form of a Python `dict`.

```python
  # Download summary from the COVID API
  json_data = download_summary()
```

Then comes the moment to fill the data from the API `dict`  into the chart template `dict`, so that we have an updated chart with each fresh request. As we just introduced, we access `dict` values with square brackets. Thus, we look for the key `Countries` which we assign to the key `values`, inside the key `data` of the Vega template (this is where Vega is expecting that data).

```python
  # Add the data to the template
  json_template["data"]["values"] = json_data["Countries"]
```

Finally, we are ready to return the "filled" Vega json template containing the updated data.

```python
  # Send the chart description to the client
  return json_template
```

Run the code and trigger the route `/summary` to check if the result properly contains the Vega template with the data.
![Assignment 5 - Summary]({{site.baseurl}}/assets/images/task 5-3-2.gif)

[Check the code on Replit](https://repl.it/@IO1075/step3-2)

# Task 3.3 Display data


We now have a description of visualisation along with the data. Still, the web browser is showing this as a raw JSON data structure. A web page for human (not JSON raw data) is structured with `HTML`. `HTML` stands for Hyper Text Markup Language and relies on XML data structure (like SVG), with `<tag>` to open and `</tag>` to close an element.

Let's create a folder `static` and inside this folder create a file `index.html` with the following content. It starts with a special tag which indicates that we are looking at an `HTML` document. The whole document is included inside the tag `<html>` and is divided in two parts:

- _the head_ for information that is not directly visible in the browser page, setting up for instance the `title` showing up in the web browser tab, and importing the libraries that are needed: in our case we need Vega.
- _the body_ describes the structure of the page. At this stage, we just have a tag `<div>` (for division), which represents an area/visual element in the document. It is important to note that this division has an `id` which we use to retrieve/reference this particular area in the document. The last tag is `script` which defines one line of Javascript: the language that defines the dynamic behaviour of the page (like animations). Here we use the Vega library to download the data from the route `/summary` and generate the chart in the area with the id `summary` (`#` indicates that we are looking for an element/area id).


```html
<!DOCTYPE html>
<html>
  <head>
    <title>COVID Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="https://cdn.jsdelivr.net/npm/vega@5"></script>
    <script src="https://cdn.jsdelivr.net/npm/vega-lite@4"></script>
    <script src="https://cdn.jsdelivr.net/npm/vega-embed@6"></script>
  </head>
  <body>
    <!-- Where to draw the summary for all countries (Bar chart) -->
    <div id="summary"></div>

    <script type="text/javascript">
      vegaEmbed('#summary', '/summary');
    </script>
  </body>
</html>
```


Yes, many new things have happened! The modern web is a combination of several languages, frameworks, and APIs, each with key responsibilities. We will delve into further detail as we go. For now, just consider this HTML structure (the backbone - skeleton - of your webpage) is downloaded by the web browser. From there, it knows which libraries it needs to download and once it has done that, it knows how the page should be structured, and that, through javascript, it needs to run the `vegaEmbed()` function that will download and display the chart on the page.

The final element is how do we get this HTML document into the web browser? Well, the web server needs to serve it, like it serves the JSON data structure. It is time to replace the sentence `"A nice COVID dashboard"` from the route `/` by the following line:

```python
  # Return the static file 'index.html'
  return server.send_static_file('index.html')
```

By default, the method `send_static_file()` from the flask serve is looking for files in the folder `static` and returns them if they exist. Thus, this will serve the web page and let the magic happen.

Run the code and trigger the route `/` to see the chart with the data.

![Assignment 5 - Vega]({{site.baseurl}}/assets/images/task 5-3-3.gif)

[Check the code on Replit](https://repl.it/@IO1075/step3-3)

Two small tips to quickly improve this chart. In the Vega template we can add the key `tooltip` with the value `true` in `mark` to make the chart reactive to the mouse cursor. We can also add the key `sort` with the value `"-x"` in `y` to sort the countries from most to least impacted. There are many options that you can explore from the Vega documentation.

[Next: Step 4 - HTML / CSS]({{site.baseurl}}/assignments/05-covid-dashboard/step4){: .btn .btn-purple }
