---
layout: default
title: "Git and GitHub"
parent: "Tools"
grand_parent: "Prototyping"
has_children: false
---

In this post we introduce Git and how it can help you managing your project.

Git is a version control system (VCS). It helps to keep track of all the  changes
in your project and sharing these. While it is heavily used by software developers to
track and share code, it is also useful to track and share the progress of any
design or research process. The principle is as follows: you share a remote
repository, you 'pull' the latest changes (any files, code, doc...) from your
peers from this repository, you make changes on your machine, and you 'push' your
changes on the remote repository, making them available to your peers.

Here are four short videos with more details:

* <a href="https://git-scm.com/video/what-is-version-control" target="_blank">What is version control</a>
* <a href="https://git-scm.com/video/what-is-git" target="_blank">What is git</a>
* <a href="https://git-scm.com/video/get-going" target="_blank">Get Going</a>
* <a href="https://git-scm.com/video/quick-wins" target="_blank">Quick wins</a>

In this page:

* [Setup](#setup)
* [Repository](#repository)
* [Git Flow](#git-flow)
* [Pull Requests](#pull-requests)
* [Issue Tracking and Flagging](#issue-tracking-and-flagging)

## Setup

### Install Git

Download and install Git from <a href="https://git-scm.com/download" target="_blank">here</a>.

### Sign up on GitHub

GitHub is a popular online platform that hosts remote Git repositories.

If you do not have GitHub account, sign up
<a href="https://github.com/" target="_blank">here</a>.

## Repository

### Create Repository

Once you signed up on GitHub, we want to create a repository for your code.
Click on the tab 'Repositories', then on the green button 'New'.

You provide a name and a description for your repository. This repository will be
public, you will need to pay for a private repository on GitHub. Then, tick the box 
'Initialize this repository with a README' so that your repository contains an
inital file. The 'README' file is a common place for developers to write relevant
information for visitors to get started with their project. You can select
a .gitignore 'Python', so that git ignores all the Python files that are not necessary
to store on your repository. Finally, you can select a License for your project, we
 use MIT (very open) as an example.

![Git Create Repository]({{site.baseurl}}/assets/images/git-create.png)

### Clone repository

*'When you create a repository on GitHub, it exists as a remote repository. You
can clone your repository to create a local copy on your computer and sync
between the two locations.'*
<a href="https://help.github.com/articles/cloning-a-repository/" target="_blank">(GitHub Help)</a>

On GitHub, at the top of your created repository, click on the green button 'Clone or
download' and copy the provided link.

![Git Link Clone]({{site.baseurl}}/assets/images/git-link-clone.png)

Go back to the Atom terminal, and type 'git clone' followed by the link you copied.
For example:

```bash
git clone https://github.com/example/prototype.git
```

![Git Clone]({{site.baseurl}}/assets/images/git-clone.png)

Let's tell Git who we are, by typing the following commands (enter these commands one after the other):

```bash
git config --global user.email "YOUR EMAIL ADDRESS"
git config --global user.name "YOUR NAME"
```


### 3 Open Project in Atom

To open the project you cloned, click on 'File' > 'Open Folder' on the top menu and
select the folder you cloned. On the left panel, you can see the files of your
project.


## Git Flow

To experience the flow of Git, of updating and sharing progress, let's update the
 project documentation.


### Step 1: Edit (a) File(s)

When developing, it is common to document the project using Markdown. In Markdown,
we use '#' for titles and '*' for bullet points. More formatting can be found
[here](https://guides.github.com/features/mastering-markdown/)

Open README.md and add a title at the top of the file, for example:

```markdown
# A Connected Prototype

By Jane and Joe
```

![Flowchart Push Button]({{site.baseurl}}/assets/images/git-change.png)

Note: A blue dot appears next to your file name README.md at the top of the page,
letting you know the changes to it are not saved. Press Command+S (or Ctrl+S) to save.

### Step 2: Stage, i.e Select File Changes

Your file appears in yellow in the left panel. It means that there are changes
in this file that are not yet tracked by Git (unstaged). Click on Git in the
bottom-right corner.

In the 'Unstaged changes', double-click on the README.md to 'stage' it, i.e.
prepare this file to track its changes. The middle tab shows you the
changes.

![Flowchart Push Button]({{site.baseurl}}/assets/images/git-stage.png)

### Step 3: Commit, i.e Record Changes Locally

Then we add a 'Commit message' to briefly explain the nature of those changes,
e.g. 'A test of Git and Markdown'. Click on 'Commit to Master' to track the changes.
You have made one change (commit) to your local repository.

![Flowchart Push Button]({{site.baseurl}}/assets/images/git-commit.png)

### Step 4: Push, i.e  Send Local Changes to GitHub

The final step consists in sharing this change with your peers. In the bottom-right
corner, click on 'push'. This will push your changes to the remote repository (on GitHub).

### Step 5: Fetch (or Pull), i.e Get the Latest Changes from GitHub

Other members of the group can now press 'Fetch' in the bottom-right corner to
update their local repository with the latest remote version.
