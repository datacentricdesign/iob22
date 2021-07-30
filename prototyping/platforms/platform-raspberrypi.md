---
layout: default
title: "Raspberry Pi"
parent: "Platforms"
grand_parent: "Prototyping"
has_children: false
---

# Set up

Insert the SD card in your laptop.

## Step 1: Set up an empty SD Card

**(Skip this section if you have an SD Card with NOOBS pre-installed)**

Download and install the software

Get the latest Raspbian here: [Raspbian](https://www.raspberrypi.org/downloads/raspbian/)

Unzip the file, you obtain an image file (extension .img)

To install this image on the SD card, download and install Etcher: [Etcher](https://www.balena.io/etcher/)

Starting Etcher, you first select your image file, then your SD card, and 'Flash'.

## Step 2: Getting Started headless (without Monitor)

## 5.2.1 SSH

To connect to the Raspberry Pi without monitor, mouse and keyboard, we use directly
your laptop. To do this, we need to enable the 'ssh' protocol (for Secure Shell)
on the  Raspberry Pi. This protocol gives us the possibility to remotely access
a computer through the network. On your laptop, open text editor (TextEdit on Mac,
Editor on Windows) and save an empty file named 'ssh' (without extension) at the
root of the 'boot' disk (SD card). This file will indicate that we want to enable ssh.

## 5.2.2 Network Access

To connect your Raspberry Pi to the network, you need to connect to your pi to a screen
and keyborad. Start by creating a second file
'wpa_supplicant.conf'  (in atom) with the following content depending on the network you 
want to connect to, but first, you should create a hash of your network password
so it isn't in plaintext in the supplicant file:

### 5.2.2.1 Hash Password


* Only for MacOS

Open your system terminal (not atom), and type the following:

```bash
echo -n 'YOUR_NETWORK_PASSWORD' | iconv -t UTF-16LE | openssl md4
```

Copy the hashed password, so you can use in your supplicant file. 


* Only for Windows

Open git bash (search for it in the startup menu), and type the following to receive the hash of your password:

```bash
echo -n 'YOUR_NETWORK_PASSWORD' | iconv -t UTF-16LE  | openssl md4
```

Copy the hashed password, so you can use in your supplicant file. 

### 5.2.2.2 Set up Supplicant File

The supplicant file setup is different between a normal network, and an enterprise one (such as eduroam)

* Personal Network Setting

```text
country=NL
update_config=1
ctrl_interface=/var/run/wpa_supplicant

network={
  ssid="YOUR_NETWORK_SSID"
  psk=hash:YOUR_HASHED_NETWORK_PASSWORD
}
```


* Eduroam Setting

First, you must hash your password. You do this so you don't have the
plaintext in your pi when you configure the password

```text
country=NL
update_config=1
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev

network={
       ssid="eduroam"
       priority=10
       proto=WPA RSN
       key_mgmt=WPA-EAP
       pairwise=CCMP TKIP
       auth_alg=OPEN
       eap=PEAP
       phase1="peaplabel=0"
       phase2="auth=MSCHAPV2"
       identity="YOUR_EDUROAM_NETID@tudelft.nl"
       password=hash:YOUR_HASHED_EDUROAM_PASSWORD
}
```

Replace YOUR_EDUROAM_NETID and YOUR_HASHED_EDUROAM_PASSWORD with your netid and hashed password.

Save this file on the 'boot' partition. Make sure that its extension is .conf rather
than .conf.txt (most texts editor will automatically add .txt or .rtf and hide it,
double-check that your file is not recognised as a text document).

**Disclaimer 1**: For eduroam, the setup process doesn't end there, 

In the terminal of the raspberry pi (using a screen and a keyboard), 
first create a Scripts folder in your home pi directory 
(mkdir command, for 'make directory'), and enter this folder (cd command),:

```bash
mkdir Scripts 
cd Scripts
```

Then, create a script named eduroam.sh (touch command)
and give the file you created execution permission (chmod command):

```bash
touch eduroam.sh
sudo chmod +x eduroam.sh
```

Finally, open this file (using the nano command): 
```bash
sudo nano eduroam.sh
``` 

and add the following text to it:

* Example file: eduroam.sh

```bash
#!/bin/bash

sudo killall wpa_supplicant
sleep 5
sudo wpa_supplicant -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf -Dwext 	
```

Once that is done, save this file ( CTRL + O ), and exit nano (CTRL + X)
Now run this script by running the following command 

``` bash 
sudo ./eduroam.sh
```

And your network should be connected. 
To make this script run every time the pi boots up, We must must configure a *service*, 
that runs a certain command on a pi's startup. You can see how to create and configure 
service [here](https://datacentricdesign.org/platform-raspbian). 

The following service script logs on eduroam's network using the supplicant file 
at boot. **Note that** your pi's default username is "pi". Also note that you 
must change the path in the service files to your actual script locations.

* Example file: eduroam.service

```text
[Unit]
Description=Connect to eduroam automatically using older driver
After=network.target

[Service]

ExecStart=/bin/bash /home/YOUR_PI_USERNAME/Scripts/eduroam.sh
StandardOutput=syslog 
StandardError=syslog 
Restart=always
RestartSec=10
User=pi

[Install]
WantedBy=multi-user.target
```


## Automatically Sharing IP Address with the DCDHub

After the first service, we will configure another service, ip.service, which 
will run a python script that sends the pi's IP address to the hub automatically 
on boot. Before you set up this service, make sure to download the 
[script](https://github.com/datacentricdesign/prototype/blob/master/rpi/ip.py) 
to your scripts folder in your pi, and create a dotenv file in that same directory, 
and put your wheelchair's THING_ID and THING_TOKEN in the .env file: 

**Note that** you need to install the python Hub SDK dependencies in your pi for 
this script to work, you can review [step 4 of the python sdk tutorial](https://datacentricdesign.github.io/sdk-python) 
(remember your pi is based on linux).

```bash 
  cd ~/Scripts
  sudo nano .env 

```


* Example file: .env

```properties
THING_ID = ...
THING_TOKEN = ...
```

You can see the ip.service file contents here: 

* Example file: ip.service

```text
[Unit]
  Description=Automatically send device IP to DCD hub using a python sdk
  Wants=network-online.target
  After=network-online.target

  [Service]

  ExecStart=/usr/bin/python3.7 /home/YOUR_PI_USERNAME/Scripts/ip.py
  StandardOutput=syslog 
  StandardError=syslog 
  Restart=always
  RestartSec=10
  User=pi

  [Install]
  WantedBy=multi-user.target
```

**Disclaimer 2**: this process requires to insert the Eduroam password. Thus, it is
important to protect the access to your Raspberry Pi. Make sure you apply ALL the
following steps marked as **SECURITY**

**SECURITY** Disable auto-login: by default, anyone with an HDMI cable can look at
your Raspberry Pi and its files. Disable this feature by going on your raspberry terminal menu (on your ssh session or directly in the pi):  

```bash
sudo raspi-config 
```


### 5.3 Booting and Connecting

**DISCLAIMER:** If you do this tutorial as part of a class, keep in mind that
all Raspberry Pi will have the same name on the network. You will have to power
your Raspberry Pi one after the other to be able to identify them.

Eject the SD card and insert it in on the Raspberry Pi, then power the Pi.

If the settings are correct, it takes about 30 seconds to get the Raspberry Pi on
the network. Make sure your laptop is connected to the same network, then connect
via ssh with the following command.

**On Windows**, you need to search for Windows Powershell and type the below command in there

**On Mac**

```bash
ssh pi@raspberrypi.local
```

In this command, 'pi' is the default username and raspberry.local is your default hostname (the
name of the Pi on the local network). You should type in your own username and hostname if you have changed it.

First you will need to type in 'yes' followed by Enter.

Then, you will be prompt for the default password. Type in 'raspberry'. Note:
when you type in the password, no letter appears in the terminal. This is the
normal behaviour to protect your password.

![SSH Pi]({{site.baseurl}}/assets/images/ssh_pi.png)

Once connected, we want to change the hostname, i.e. the name of your Raspberry Pi
on the network. By default, it is 'raspberrypi' which is not practical while you
have several of them (like in a classroom setting). To do this, we need to edit
two files /etc/hostname and /etc/hosts. We use the editor nano for this.

Type in:

```bash
sudo nano /etc/hostname
```

This command opens the file /etc/hostname in nano. Replace 'raspberrypi' with the
name of your choice (without space). In the following example, we use the
hostname 'noisy-wheelchair'.

![Hostname]({{site.baseurl}}/assets/images/hostname.png)

To save and exist, press Ctrl+X, press Y ()to answer 'Yes' to the question) followed
by Enter. Similarly, edit the file /etc/hosts and change 'raspberrypi' for the
same name, e.g. 'noisy-wheelchair'.

```bash
sudo nano /etc/hosts
```

![Hosts]({{site.baseurl}}/assets/images/hosts.png)

Again, save and exit with Ctrl+X, then Y followed by Enter.

Reboot your Rasberry Pi with:

```bash
sudo reboot
```

After about 30 second, you should be able to connect to you Raspberry Pi with
your new hostname. For example:

```bash
ssh pi@noisy-wheelchair.local
```

**SECURITY** Next, we want to change the user password: changing the
default password 'raspberry' gives you more guaranty you are the only one
accessing your Raspberry Pi.

```
sudo passwd
```

![Change password]({{site.baseurl}}/assets/images/pass.png)

### 5.4 Installing Requirements

First, we need to update the Raspberry Pi with the latest version of its software.

```bash
sudo apt-get update
sudo apt-get upgrade
```

Set up Git

```bash
sudo apt-get install git
```

Clone your GitHub repository. Similarly to cloning the Git repository on your laptop,
this time we clone it on the Raspberry Pi. For example:

```bash
git clone https://github.com/example/prototype.git
```

In the terminal, to navigate through folder we use 'cd'. Enter the folder you have just
cloned with:

```bash
cd prototype
```

Then, we need to create an .env file, in the project folder, with  THING_ID, the THING_TOKEN and the
SERIAL port.

```bash
nano .env
```

Copy your thing id and token, and use /dev/ttyUSB0 as a serial port (there are other serial ports on your raspberry pi you can try, such as ttyS0, ttyACM0).

![Change password]({{site.baseurl}}/assets/images/env_file.png)

Install the requirements with Pip

```bash
python3 -m pip install -r requirements.txt --user
```

Your Raspberry Pi is ready to run code!
