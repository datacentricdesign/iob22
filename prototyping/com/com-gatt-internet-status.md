---
layout: default
title: "Internet Status on the Wheel over Bluetooth GATT and Serial"
parent: "Communication"
grand_parent: "Prototyping"
has_children: false
---

In this tutorial, we want to communicate the Internet connection status: is the wheelchair connected to the cloud?

We will use an RGB diffuse LED as indicator on the wheel. The Raspberry Pi will
check for the Internet availability. We will create a BLE GATT service to WRITE
(i.e send) commands to the Feather 32u4 on the wheel, to turn on/off the LED
depending on the internet status.

![]({{site.baseurl}}/assets/images/ws3-2.png)

# 1 Diffused LEDs

The first step is to explore how to wire and control a NeoPixel 5mm Diffused LED.
This is described in the LED page in section 3:
[/resources/actuators/leds](/actuators-leds.md#3-neopixel-5mm-diffused-led)

# 2 Internet Connection status

In many case, checking the Internet connection is not enough, we want to know
whether the cloud we rely on is currently available. Most cloud services have
a 'health' API in order to check if the service is available and running fine.
For the DCD Hub, it is /health, you can try in your web browser:

<a href="https://dwd.tudelft.nl/api/health" target="_blank">https://dwd.tudelft.nl/api/health</a>

The result should look as follows:

![Health API]({{site.baseurl}}/assets/images/health_api.png)

Notice the two information of the result, a status number (0 if everything is running
properly) and a message. Let's create a Python script that runs this HTTP request
to check the DCD Hub status. In your wheelchair folder, create a file dcd_hub.py
and write the following code.

```python
import requests

def dcd_hub_status():
    """
    Return the DCD Hub status:
    - 0: Connection successful
    - 1: Could not reach the hub (Connection or Hub issue)
    """

    uri = "https://dwd.tudelft.nl/api/health"
    try:
        json_result = requests.get(uri).json()
        if json_result["status"] is 0:
            # We received a response with status = 0, everything is fine
            return 0
        # In any other case, there is a issue
        return 1
    except Exception as e:
        # Show some information about the error
        print(str(e))
        # Return 1, the connection wasn't successful
        return 1
```

This code import the 'requests' library, convenient to make a HTTP request. We
declare a function dcd-hub_status() which try to call the health API and return
0 if it succeed. If it failed because of the Internet connection or the availability
of the Hub, then it return 1.

try/except (also known as try/catch in other languages) is a construction that makes
your code more robust. You define in the 'try' something that work but sometimes
can fail. In our case, firing an HTTP request fails if there is no Internet
connection. If the code in the try clause fails, then the except clause is executed.
In our case, we print the error and return '1', avoiding our code to crash.

Notice we create this function in a separate file. Doing so give you the opportunity
to import it anywhere in your code without rewriting nor copy/pasting it.

# 3 GATT Service for Control

For this step we will need the latest version of our Feather's firmware. The
firmware is software that is embedded in a piece of hardware, typically provided
by its manufacturer. Adafruit provides a convenient way to update it with an
Android or iOS app:
<a href="https://learn.adafruit.com/adafruit-feather-32u4-bluefruit-le/dfu-bluefruit-updates" target="_blank">
https://learn.adafruit.com/adafruit-feather-32u4-bluefruit-le/dfu-bluefruit-updates</a>

Then, open examples/communication/bluetooth/gatt_write in the Arduino IDE. This
code is an example of GATT service enabling to WRITE (i.e. the Feather receive
data) in contrast with the previous section in which we were READ (i.e. the
Feather was sending data). Read through the code to understand what it does, then
flash it on the Feather.

On the Raspberry Pi, you can run [examples/communication/bluetooth/write_gatt.py](https://github.com/datacentricdesign/code/blob/master/examples/communication/bluetooth/write_gatt.py)
This code connect to your Feather via Bluetooth and use the code discussed previously
to check the connection. If the connection with the DCD Hub can be established, it
writes on the LED GATT service to turn on the LED, otherwise it writes to turn off
the LED.
