---
layout: default
title: Step 1 Review
parent: "05 COVID Dashboard"

---

# Step 1 Review
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---


# Task 1.1 Set Up a Web Server

Install Flask

```python
# Import the object Flask and request from flask module

# Create a webserver object called 'COVID Dashboard' and keep track of it in the variable server

# Define an HTTP route / to serve the dashboard home web page
# Define the function 'index()' and connect it to the route /
  # Return the string "A nice COVID dashboard"

# Define an HTTP route /summary to serve the summary chart
# Define the function 'serve_summary()' and connect it to the route /summary
  # Return the string "Bar chart summary of COVID cases per country"

# Define an HTTP route /new to serve the new count worldwide chart
# Define the function 'serve_summary_new()' and connect it to the route /new
  # Return the string "Pie chart summary of new COVID cases globally"

# Define an HTTP route /netherlands to serve the chart of the netherlands
# Define the function 'serve_netherlands_history()' and connect it to the route /netherlands
  # Return the string "Area chart of COVID cases over time in the Netherlands."

# Start the web server
```

# Task 1.2 Explore COVID-19 API


# Task 1.3 Trigger API from web browser
