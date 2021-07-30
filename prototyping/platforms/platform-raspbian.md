---
layout: default
title: "Raspbian"
parent: "Platforms"
grand_parent: "Prototyping"
has_children: false
---

Raspbian is a linux based computer operating system for the Raspberry Pi. 

## Command Line
The command line is the main way we will be interacting with the Pi, so its
convenient to know some commands to get around it. Here are some helpful links:
* [Terminal Cheatsheet](https://www.thehackr.com/linux-terminal-cheat-sheet/)
* [Linux Command line](https://www.cheatography.com/davechild/cheat-sheets/linux-command-line/)
* [UNIX Reference](https://files.fosswire.com/2007/08/fwunixref.pdf)


## Running Code on Startup 
A useful workflow for the pi, is to run some particular code always on startup.
A good way of doing that is by using the systemd interface.  You can set up this by 
**creating a service**, which starts with a service script.
Start by creating a service script in your Pi's terminal
(replace MY_EXAMPLE with an appropriate name):

``` bash
sudo touch /etc/systemd/system/MY_EXAMPLE.service
sudo chmod 644 /etc/systemd/system/MY_EXAMPLE.service
sudo nano /etc/systemd/system/MY_EXAMPLE.service

```

Now you can configure your service script (you can find more details [here](https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files)):
```bash
[Unit]
Description=My description 
After=multi-user.target 
 
[Service]
Type=simple
ExecStart=/usr/bin/python3 ABSOLUTE_PATH/YOUR_SCRIPT.py
 
StandardOutput=syslog 
StandardError=syslog 
Restart=always
RestartSec=10
User=root
Group=root 
[Install]
WantedBy=multi-user.target

```

Notes:
* After details if the service needs to wait for anything before
running, you can put other "events" in "After"
* Note you must always give the absolute path, 
You can get this by running the "pwd"
in your command line in the file's location, 
and appending the "/FILE_NAME" to the response
if anything goes wrong,
* The restart part ensures your service always restarts on any problem.

Now you can attempt to start the service with the command:
```bash
# Start service
sudo systemctl start MY_EXAMPLE.service

```

Use status to make sure the service started with no hiccups

```bash
# Check status
sudo systemctl status MY_EXAMPLE.service
```

Afterwards stop it, make sure it was stopped properly, and then
configure the service to start automatically at boot:

```bash
# Stop service
sudo systemctl stop MY_EXAMPLE.service

# configure automatic start
sudo systemctl enable MY_EXAMPLE.service
```


