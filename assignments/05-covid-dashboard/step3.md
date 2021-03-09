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

So far, our web server is capable of collecting COVID-19 data from a web service and serves the data. The web server does not bring any additional value yet. There are many different tools, framework and libraries to visualise data. In this assignment, we introce [Vega](https://vega.github.io/vega/), trying to shift the focus on the visualisation rather than the code. This contrast with visualisation tools that constraints the visualisation by the way the code is structured.

# Vega - Vizualisation Grammar

As described from its website, _'Vega is a visualization grammar, a declarative language for creating, saving, and sharing interactive visualization designs. With Vega, you can describe the visual appearance and interactive behavior of a visualization in a JSON format, and generate web-based views using Canvas or SVG.'_ [Vega](https://vega.github.io/vega/)

We think that this approach might enables designers of visualisations to focus on visualisation concepts rather than the technical implementation.

# Task 3.1 Specify Summary Chart

With Vega, we build on a data structure that we already encountered: JSON. Instead of writing code, we describe the elements of the visualisation. Then, this description can be used in different programming languages to generate visualisations. Let's look at the dashboard that we envision, once again, so that we know what we are heading for.

![Assignment 5 - End Result]({{site.baseurl}}/assets/images/assignment5-end-result.png)

We start with the top right chart summarising the global COVID situation by listing all countries with cases. In _Replit_, create a folder `templates`. It will contain the templates of our three charts. Inside this folder, create a file `summary.json` and paste the following:

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

- The schema, like for SVG, is a link to the rule definitions of Vega - all element that we can put in this JSON structure to be considered as a valid Vega chart;
- The title of the chart;
- The data, an array of values to show on the chart. Here it is empty, each time we will show the chart, we will get the latest data and insert them here;
- The mark specifies the shape of the chart. For now we will leave Vega generate a default bar chart;
- The encoding is the place where we define what should go where. There is an `x` and `y` axes. Looking at the data extract below (from our own server), the total confirmed cases per country appears as the key `TotalConfirmed` in each country. We use this key for `x`, it is a number, we use the type `quantitative`. Similarly for the `y` axes, we use the key `Country` in each country, this time with a type `nominal` (not numbers, and no meaning out of a sorting). Note that the countries are on the `y` axis so that the long list of countries unfold vertical. The other way around would also work.

![Assignment 5 - Sample data total confirmed ]({{site.baseurl}}/assets/images/assignment5-step3-total-confirmed.png)

This is all the details needed for Vega to generate a bar chart. We now need to bring in the data.

# Dictionary

We briefly mentioned `dict` in the previous Step to wrap an list of data in a JSON data structure with key/value pair. A `dict` is the equivalent of JSON in Python. It is an object composed of key/value pairs which we can manipulate in Python. All JSON data structures are mapped into `dict` to be manipulated.

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

This is already enough about Dictionaries to manipulate our data. In the sample data from the previous task, we know that the data comes in a JSON object with the key `Countries` including the detailed list of all countries. So what we need to do is to get our Vega template, get fresh data from the API, extract the list of countries inside the key `Countries` and insert this list in the Vega template.

To load the Vega template from the JSON file, we use the `json` module at the top of `main.py`. Then we can focus on the function `serve_summary()` which currently contains only a call to the function `download_summary()`. The steps are the followings:

```python
  # Load json template from summary.json
  # Download summary from the COVID API
  # Add the data to the template
  # Send the chart description to the client
```

To load the JSON template, we use the json module. We use `open()` that we already used in the previous assignments to open a file. We give this file to the function `load()` from the json module. This bring our json template in Python, as `dict`.

```python
  # Load json template from summary.json
  json_template = json.load(open("templates/summary.json"))
```

Next, we download the data. Instead of returning this data directly, we keep it in a variable: another json structure in the form of a Python `dict`.

```python
  # Download summary from the COVID API
  json_data = download_summary()
```

Then comes the moment to transfer the data from the data `dict` to the template `dict`, so that we fill up our chart with data. As we just introduced, we access `dict` values with square brackets. Thus, we look for the key `Countries` which we assign to the key `values`, inside the key `data` of the Vega template (this is where Vega is expecting the data).

```python
  # Add the data to the template
  json_template["data"]["values"] = json_data["Countries"]
```

Finally, we are ready to return the Vega template containing the data.

```python
  # Send the chart description to the client
  return json_template
```

Run the code and trigger the route `/summary` to check if the result properly contains the Vega template with the data.

[Check the code on Replit](https://repl.it/@IO1075/step3-2)

# Task 3.3 Display data

We now have a description of visualisation along with the data. Still, the web browser is showing this as a raw JSON data structure. A web page for human (not JSON raw data) is structured with `HTML`. `HTML` stands for Hyper Text Markup Language and relies on XML data structure like SVG, with `<tag>` to open and `</tag>` to close an element.

Let's create a folder `static` and inside this folder create a file `index.html` with the following content. It starts with a special tag which indicate that we look at an `HTML` document. The whole document is included inside the tag `<html>` divided into two parts:

- the head for information that are not visible inside the page, setting up for instance the `title` showing up in the web browser tab, and importing the libraries that are needed: in our case we need Vega.
- the body describes the structure of the page. At this stage, we have just a tag `<div>` (for division), which represents an area in the document. It is important to note that this division has an `id` which we use to retrieve this area in the document. The last tag is `script` which defines one line of Javascript: the language that define the dynamic behaviour of the page. Here we use the Vega library to download the data from the route `/summay` and generate the chart in the area with the id `summary` (`#` indicate that we are looking for an id).

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

I here you! Many new things! Yes, the web is combining several languages together, each with a key responsibility. We will detail further on as we go. For now, just consider this HTML structured is downloaded by the web browser. From there, it knows which libraries it needs to download and from where, it knows how the page should be structured, and running the `vegaEmbed()` function it will download and display the chart on the page.

The final element is how do we get this HTML document into the web browser? Well, the web server needs to serve it, like it serves the JSON data structure. It is time to replace the sentence `"A nice COVID dashboard"` from the route `/` by the following line:

```python
  # Return the static file 'index.html'
  return server.send_static_file('index.html')
```

By default, the method `send_static_file()` from the flask serve is looking for files in the folder `index.html` and return them if they exists. Thus, this will serve the web page and should let the magic happen.

Run the code and trigger the route `/` to see the chart with the data.

TODO Screenshot of result


[Check the code on Replit](https://repl.it/@IO1075/step3-3)

Two small bonuses to quickly improve this chart. In the Vega template we can add the key `tooltip` with the value `true` in `mark` to make the chart reactive to the mouse cursor. We can also add the key `sort` with the value `"-x"` in `y` to sort the countries from most to least impacted. There are many options that you can explore from the Vega documentation.

[Next: Step 4 - HTML / CSS]({{site.baseurl}}/assignments/05-covid-dashboard/step4){: .btn .btn-purple }
