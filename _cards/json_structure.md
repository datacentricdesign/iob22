---
link-assignment: /assignments/05-covid-dashboard/step5/#task-51-display-netherlands-history
---

# Task 5.1 Display Netherlands History

This time we want an area chart mapping the case history in the Netherlands. First, we have the template, which includes the same elements as the previous chart. This time we look for an area chart. We can copy and paste this template in `templates/history.json`.

```json
{
  "$schema": "https://vega.github.io/schema/vega-lite/v5.json",
  "width": "container",
  "title": "Confirmed Cases",
  "data": {
    "values": []
  },
  "mark": {
    "type": "area",
    "tooltip": true
  },
  "encoding": {
    "x": {
      "field": "Date",
      "type": "temporal"
    },
    "y": {
      "field": "Cases",
      "type": "quantitative"
    },
    "color": {
      "field": "Province"
    }
  }
}
```

Similarly to Step 3, we need to combine this template with the data. However, we select the template 'history.json' and take the data from the function `download_confirmed_per_country()`.

```python
    # Load JSON template from history.json
    # Download the confirmed cases of the Netherlands from the COVID API
    # Add the data (key "data") to the template (key "data" > "values")
    # Send the chart description to the client
```

Run the code and trigger the route `/netherlands` to see the template together with the data.

[Check the code on Replit](https://repl.it/@IO1075/05-covid-dashboard-step5-1)

In `static/index.html`, we can add the call to `vegaEmbed` at the bottom, next to the existing `vegaEmbed` from the first chart.

```js
vegaEmbed('#netherlands', '/netherlands');
```

Let's fix a layout styling detail. As the chart is wide, it would fit better on the full length of the page. We could add an `id` property to the second section to apply some _CSS_ on that specific element. Another strategy is to add the class property. While an `id` must be unique, we can use a class in many elements. As we might want to create several charts for other countries to compare, the class seems an appropriate choice. Add property `class="country"` to the second section. Then, in the _CSS_, add the following to increase the grid's size for this particular section. Note the dot `.` in contrast with the hashtag `#` to target the name of a `class` instead of an `id`.

```css
.country {
  grid-template-columns: repeat(auto-fill, minmax(600px, 1fr));
  text-align: center;
}
```

![Assignment 5 - End Result]({{site.baseurl}}/assets/images/assignment5-step5-1.png)