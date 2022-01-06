---
layout: default
author: Jacky Bourgeois
title: "Bucket and Raspberry Pi"
parent: "Data-Centric Design"
has_children: false
---

# Step 1: Set up your cloud and prepare a configuration for your Raspberry Pi

## Task 1.1 Activate your space on 'Bucket'.

Our Data-Centric Design Lab (DCD Lab) has prepared a space online where it is easy for the students in this course to create their cloud. It is called [Bucket](https://dwd.tudelft.nl/bucket/). The following video gives you a little tour to familiarize yourself with Bucket. Then, to access and use it, you create your DCD Lab account.

<iframe width="560" height="400" src="https://www.youtube.com/embed/H2Ogmi1J-P8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Task 1.2 Setup your Raspberry Pi as a Thing in your cloud and create a Disk Image

Once you log into Bucket, the dashboard shows an empty page with a form to create a `Thing'. In IoT terminology, a 'Thing' refers to any physical or virtual entity connected to the Internet. It is involved in the exchange of data. To collect data from our Raspberry Pi, we need it to show up here as a Thing. Therefore we will create its digital twin here. Type in a name and a description, and select the type 'Raspberry Pi'.

You will notice many settings appear. It is because Bucket gathers them at once to automatically prepare the image disk to insert into your Raspberry Pi. Keep in mind that **Bucket does not store any of this information. Only you, owner of the Thing can create and download the settings through a secured connection**.

The first section of settings is about restricting access to your Raspberry Pi. As you will store network information on your Raspberry Pi, it is essential to set it up in a way that prevents others from accessing it.

![Create a Thing with WiFi Credentials connecting to the Internet]({{site.baseurl}}/assets/images/dcd/bucket-raspberrypi/1_2_21.png)

The second section is about connecting to the network. Eduroam is an enterprise-grade network that requires several challenging interventions on the Raspberry Pi system. Filling in your NetId and password, we ensure that your Raspberry Pi can automatically connect to Eduroam and manage your credential properly. We conveniently provide a similar function for your home network.

![Home network]({{site.baseurl}}/assets/images/dcd/bucket-raspberrypi/1_2_22.png)

![Eduroam]({{site.baseurl}}/assets/images/dcd/bucket-raspberrypi/1_2_23.png)

Once you have filled in all sections 1 and 2, click the 'Create' button. The page should update with your newly created Thing. However, it will take a _long_ time to generate your disk image. You can see a status indicator that will turn into a 'Download' button when your disk image is ready.

You can proceed to the next step while waiting for your Raspberry Pi image to be ready.


# Step 2: Set up a Raspberry Pi

What is a Raspberry Pi, in contrast with an Arduino-like device? Here is a comparison, opposing a ['Microprocessor' and a 'microcontroller'](https://www.youtube.com/watch?v=7vhvnaWUZjE). Why do we use another computer rather than our machine? Throughout the course, you will also test your code on your machine. However, when prototyping connected products, you want them continuously on the Internet, not depending on your laptop activity (e.g. closing the lead, moving out of the house). The Raspberry Pi can be permanently connected and serve this purpose. Besides, it also makes a device on which we can set up network access, enabling your laptop, your phone and other devices to interact with it.

## Task 2.1: Installing the Image

Once your Raspberry Pi image is ready, go back to [Bucket](https://dwd.tudelft.nl/bucket), navigate to your Thing on the left. If the generation is complete, a blue download button appears. Press it to download the file.

You receive a zip file. Unzip it to obtain an image file (extension `.img`)

To install this image on the SD card, download and install Etcher: [Etcher](https://www.balena.io/etcher/)

Starting Etcher, you first select your image file, then your SD card, and 'Flash'.

Slide the SD card into the Raspberry Pi and power it with the USB micro charger. Avoid powering the Raspberry Pi with your laptop as it draws more power than your USB port are designed for.

If you correctly entered the details of your home network, your Raspberry Pi should automatically connect to this network. After a couple of minutes, refresh your Thing page on the Bucket web app. You should see the IP address of your Raspberry Pi at the top of the page. We will use the local IP address.

![Connected Thing]({{site.baseurl}}/assets/images/dcd/bucket-raspberrypi/2_1_0.png)

## Task 2.2: Connecting to the Raspberry Pi

You can connect your Raspberry Pi to a screen, a keyboard and a mouse to use it as you would use your machine. However, while prototyping, your Raspberry Pi is often embedded in your setting. Thus, knowing how to handle it remotely is an important skill to practice.

Throughout this tutorial, we will thus access the Raspberry Pi remotely. For this, we use the `ssh` command as follows. First, replace the square brackets with the `username` and `hostname` you entered on Bucket. Then pressing enter, the command line prompts you for your password. Notice the `.local` after your hostname: it means that we look for the name of a machine on the local network.

```bash
ssh [username]@[hostname].local
```

Another way to connect to your Raspberry Pi, less convenient but often more reliable, is via its local IP Address (displayed on the Bucket web app). It is composed of 4 numbers separated by dots.

```bash
ssh [username]@[your.local.IP.address]
```

![SSH Pi using Username & Hostname]({{site.baseurl}}/assets/img/courses/id5415/module1/assignment/4_2_0.png)

**Note:** When you enter your password, nothing appears? It is normal behaviour; we do not want to leave our passwords in the command line traces. So type your password (blindly) and press enter.