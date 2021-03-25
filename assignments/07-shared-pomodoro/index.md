---
layout: default
title: "07 Shared Pomodoro"
has_children: true
---

# 07 Shared Pomodoro

In the seventh Python programming assignment, you develop the state-machine algorithm of a Pomodoro time-tracker. You make your web application more dynamic with WebSocket and let your Python programme run several parallel processes using `threads`.

![Assignment 7 - Final Result]({{site.baseurl}}/assets/images/assignment7-final-result.png)

---

Through this assignment, we explore the following concepts:

Thread
{: .label .label-green }

Web Socket
{: .label .label-red }

State Machine
{: .label .label-yellow }

---

## Acknowledgement

Thanks [Aadjan van der Helm](mailto:A.J.C.vanderHelm@tudelft.nl) who inspired this assignment, and [Doreen Mulder](mailto:D.Mulder@student.tudelft.nl) who shared the code that we adapted for this assignment.

## ⏰  Time Management and Expectations

This assignment aims at 8 hours. However, it is easy to spend more time on each step. Keep in mind the following indications. It is crucial to practice your computational thinking by implementing the state machine's logic (Steps 2 and 4). We encourage you to copy and paste in Step 3 because setting up a web page is not the focus of this assignment.

* ✅ (1hr) Step 1 (class) revisits elements already covered through a class definition. It also introduces the concept of handlers;
* ⚠️ (2.5hr) Step 2 (states) is a critical step of this assignment, defining part of your state machine;
* 🏗 (1hrs) Step 3 (WebSocket) setups the web server;
* ⚠️(2.5hr) Step 4 (States) is a critical step of this assignment, finalising the definition of your state machine;
* ✅ (1hrs) Step 5 (WebSocket) uses WebSocket to send updates to clients;

## 👥 Pair Programming

Did you decide to work through this assignment in pair programming? Brilliant! Pair programming is an excellent opportunity to exchange end strengthen your knowledge.

* We suggest switching role for each Task, as the code gets executed and marks a clear transition.
* As you take the driver seat, remember to think aloud and ask questions to the navigator
* As you take on the navigator seat, help the driver answering his question. If you spot an error, let the driver finish his/her flow before communicating them

Remember that it is an exercise of courage, continuously admitting when you do not know. This way, the other get the opportunity to explain and, through this process, check whether they have themselves a clear understanding of the concept at hand.

Working at a distance adds a layer of complexity. With _Replit_, one person in the pair creates a project. Then, using the `share` button on the top right corner, you share an 'editable' link with your pair, which you can both edit.

![Pair Programming - Replit]({{site.baseurl}}/assets/images/replit-pair.gif)

We suggest using a communication tool such as MS Team to open a video channel, staying in constant video and voice interaction during the duration of the pair programming

Share your experience on Discourse with the tag `pair-programming`


## 🔗 Git and GitHub

Do you want to explore the Git/GitHub workflow? You need to create a free GitHub account if you do not have one yet. This flow works regardless of working solo or in pair.

Create a repository with an initial README.md file, then access this repository from _Replit_.

![GitHub create repository - Replit]({{site.baseurl}}/assets/images/git.gif)

We suggest:

* creating a commit and pushing on your GitHub repository at the end of each Task;
* creating a branch at the beginning of each step and merge it in the Master at the end of each step.

![GitHub create branch and commit - Replit]({{site.baseurl}}/assets/images/git_commit_push.gif)