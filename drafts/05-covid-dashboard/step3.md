---
layout: default
title: Step 3 Chart
parent: "05 COVID Dashboard"

---

# Step 3 Chart
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

Vega

# Task 3.1 Specify Summary Chart

create templates folder with the summary.json:

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


# Task 3.2 Select Data

import json lib 

Access dictionary

Add to JSON in data.values

```
# Load json template from summary.json
  json_template = json.load(open("templates/summary.json"))
  # Download summary from the COVID API
  json_data = download_summary()
  # Add the data to the template
  json_template["data"]["values"] = json_data["Countries"]
  # Send the chart description to the client
  return json_template
```

# Task 3.3 Display data

index.html

serve static file

```
  # Return the static file 'index.html'
  return server.send_static_file('index.html')
```


add tooltip and sort -x