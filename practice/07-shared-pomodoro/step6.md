---
layout: default
title: Step 6 Recap and More
parent: "Shared Pomodoro"
grand_parent: "Practice"
---

# Step 6 Recap and More
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

So why do we call this assignment 'Shared' Pomodoro? We create only one Pomodoro object on the server that we make available on the network through the WebSocket protocol. Try to open several tabs in your web browser, loading the Pomodoro web page. You can also open it on your smartphone or several computers if you work in a pair programming fashion. What you should notice is that pressing the Pomodoro device or changing its settings and saving on one web page triggers all the other web pages to update, too. There is only one shared Pomodoro.

It illustrates how to reflect changes from the webserver onto web clients. In a production setting, we might augment this setting to involve users account with a Pomodoro object for each account.