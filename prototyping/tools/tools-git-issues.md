---
layout: default
title: "Issue Tracking and Flagging"
parent: "Tools"
grand_parent: "Prototyping"
has_children: false
---

Whenever there is a problem with the code in the repository, it is customary to raise an issue in Github. This will not only allow other contributors to verify this error, but also for them to possibly fix them, and then, tag them as fixed. We will also use this workflow when there is a problem with the code and you want to get some non-presential help from the course instructors.

## Issue basics
Once again, this workflow is available on the Github website.
Let's begin by going to the _Issues_ tab of your repository:

![]({{site.baseurl}}/assets/images/git_1.png)

Once we're in this tab, we can see the different options available to us:

![]({{site.baseurl}}/assets/images/git_2.png)

* In red, is the search box, where we can search for issues, with or without filters (by default, we'll search only open issues);
* In blue, we can find the label and Milestones subtabs (we'll go into more detail on this later);
* In yellow, we find the button for creating new issues in the repo.

## Labels and Milestones

Github provides these extra organizational tools so the repository can be more efficient. Issues are used for general things to keep in mind for the project collaborators, such as bugs, needed features, etc.

### Labels

We use labels to be able to compartmentalize these different types of Issues in an efficient manner. This way, we can see easily the type of any issue. By default your repository has some predefined labels, but we can create our own:

![]({{site.baseurl}}/assets/images/git_3.png)

In the label tab, we can create a new one by using the _New Label_ button circled in red. After clicking, we'll see a wizard, where we can name the new label, give it a description, and choose a color (pressing the refresh button will randomly generate one).

![]({{site.baseurl}}/assets/images/git_6.png)

After creating the label by pressing the button circled in red, we should see it now in the labels subtab:

![]({{site.baseurl}}/assets/images/git_7.png)

### Milestones
Milestones are a tool to help with organizing big levels in your project. It is customary to create these _Milestones_, and fill them with issues that need to be accomplished/solved to reach the Milestone.

Any contributor can then open the milestone, and assign themselves to solve a particular issue in it, create more issues, or comment on the ones already there. As the Milestone issues are closed (we will talk more on this later), Github will provide a progress bar for that particular milestone.

You can create a milestone, by going to the milestones tab, and clicking the button circled in red:
![]({{site.baseurl}}/assets/images/git_14.png)

And then completing the wizard that shows up. After that your Milestone should appear in the Milestone tab:
![]({{site.baseurl}}/assets/images/git_12.png)

After this you can create the issues (more on this later) necessary for the completion of the Milestone. As these issues are closed, you can see the progress of the Milestone:
![]({{site.baseurl}}/assets/images/git_13.png)


## Issues
Issues are set in a repo (repository) for all kinds of different reasons. They can be just reminders of what needs to be done in a Milestone, they can be bugs found in code, aswell as feature requests for the repo, among others. Once an Issue is created, it is flagged as "open". Once it is solved, will be flagged as closed.

### Creating and Closing Issues in your repo
We can create an issue in the general _Issue_ tab, or inside a milestone (however general issues can be attributed to a milestone, so the second option is only there for convenience).

Since we can make a general issue part of a milestone, we will create a general one, by clicking the button circled in red:

![]({{site.baseurl}}/assets/images/git_9.png)

In the following wizard, you can add a title and description to the issue, assign it to collaborators, give it one or more labels, and make it part of a Milestone (you can do this with the gear icons).

![]({{site.baseurl}}/assets/images/git_8.png)
You can then submit it with the button circled in red. Afterwards, your new issue should appear in your _Issues_ tab as an open issue. contributors and people who have access to the repo can open these Issues, and then comment on them:

![]({{site.baseurl}}/assets/images/git_10.png)

After a contributor to the project has implemented/fixed an issue of the repo, they can close it. In Github, you can do this by opening an open issue, and choosing the button circled in red. You can also comment, perhaps to explain  why/how you closed it or what you did:

![]({{site.baseurl}}/assets/images/git_11.png)


We are now prepared to use Github as an efficient platform for collaboration!
