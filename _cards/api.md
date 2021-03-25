---
link-assignment: /assignments/05-covid-dashboard/step1/#task-12-explore-the-covid-19-api
---

# Task 1.2 Explore the COVID-19 API

Now there is only so much we can do for a COVID dashboard without actual data. Let's look at a `web service` that can provide us with the latest data. For this assignment, we rely on the API [covid19api.com](http://covid19api.com). Have a look around and see for yourself what this service is promising.

Why this choice? It is a free, registration free and easy to use API which enables our dashboard to show the latest COVID data. It would not work for a product because there are limitations to the free service, such as how many times we can request the data within one day. However, it fits perfectly for our prototyping needs.

How to get started? On the front page towards the bottom, there is a [documentation](https://documenter.getpostman.com/view/10808728/SzS8rjbc) link. It looks like an excellent place to start. We land on a page of `Postman`, a tool for developing and documenting APIs.

This assignment focuses on two APIs: the `/summary` and the `/countries`. From the `/summary` API, we can extract the total number of cases per country up to now (the bar chart of our dashboard on the right) and the total of new cases in the last 24 hours (the doughnut chart on the left).

![Assignment 5 - API Summary]({{site.baseurl}}/assets/images/assignment5-step1-countries.png)

From the `/countries` API, we can extract the historical data for a specific country, such as the Netherlands (the area chart of our dashboard at the bottom).

![Assignment 5 - API Countries]({{site.baseurl}}/assets/images/assignment5-step1-summary.png)