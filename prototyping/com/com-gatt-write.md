---
layout: default
title: "Rotation to Vibration over Bluetooth GATT and Serial"
parent: "Communication"
grand_parent: "Prototyping"
has_children: false
---

In this tutorial we lead you step-by-step to implement a Bluetooth GATT service.

At the end of tutorial '[GATT Notify](/com-gatt-notify)',
we were able to register to a BLE GATT service on the Feather 32u4 placed on the
left wheel of the wheelchair to receive orientation and rotation data. In this
step, we explore how we can use this information to
reason on the Raspberry Pi, and trigger action on the Arduino Mega.

![]({{site.baseurl}}/assets/images/ws3-1.png)

# 1 Vibration pattern

Let's start with a look at the vibration motor describe here:
[Vibration Motor](/actuators-vibration_motors)

Building on the couple of examples we provide, write your own vibration pattern.

# 2 Vibration Function

The next step is to transform this continuous pattern into a function that we
can turn on and off on demand. Thus, we create a function vibration_pattern() and
we move our code from loop() to vibration_pattern(). In loop, we call vibration_pattern()
and leave a delay between each loop. This transformation gives us the possibility
to implement multiple vibration patterns (one per function).

```cpp
void vibration_pattern() {
  if (increase) {
    i+=10;  // incrementing the power of the vibration motor
  } else {
    i-=10;
  }

  if ( i > 255) {
    increase = false;
  } else if ( i < 127) {
    increase = true;
  }
}

void loop() {
  vibration_pattern();
  delay(50);
}
```


# 3 Writing over Serial

Now that we have a function, we can better control whether the vibration motor is
on or off. Let's create a variable 'vibration_enabled' at the top of the file (next
to 'i' and 'increase') and set it to false.

```cpp
boolean vibration_enabled = false;
```

Then, in loop(), we want to listen to commands sent via the Serial connection (in this case
through the USB cable). We use Serial.read(), which gives us the last character received
via Serial. Let's define that sending:

* '1' means 'turn on'
* '0' means 'turn off'

For every loop, we check whether we receive a 1 or a 0 and change vibration_enabled
accordingly. This looks as follows:

```cpp
void loop() {
  char command = Serial.read();
  if (command == '1') {
    Serial.println("Turning on Vibration...");
    vibration_enabled = true;
  } else if (command == '0') {
    Serial.println("Turning off Vibration...");
    vibration_enabled = false;
    analogWrite(VIB_PIN, 0);
  }
  if (vibration_enabled) {
    vibration_pattern();
    analogWrite(VIB_PIN, i);
  }
  delay(50);
}
```

# 4 Control from Python

The next step is to control this vibration from Python. The following example
shows how to establish a serial connection and write (i.e. send) messages. In this
case, we send '1' (turning on the vibration) then wait for 5 seconds before sending
'0' (turning off the vibration). We wait another 2 seconds and start again.
Notice the added "encode()" function. This is because the write() function on serial can only write binary data. By writing '1', we're sending a string. The encode() is there to convert from the string type to binary. 

```python
# Import required library
import os                       # To access environment variables
from dotenv import load_dotenv  # To load environment variables from .env file
import serial                   # To connect via the serial port
import time                     # To sleep for a few seconds

# The thing ID and access token
load_dotenv()

# Start reading the serial port
ser = serial.Serial(
    port = os.environ['SERIAL'],
    baudrate = 9600,
    write_timeout = 0)

while True:
    ser.write('1'.encode())
    time.sleep(5)
    ser.write('0'.encode())
    time.sleep(2)
```


# 5 Data-Driven Vibration

The final step is to control the vibration based on data. In this example, we will
nudge the wheelchair users when they reach their recommended number of wheel rotations.

To do this, we can start from the example '[GATT Notify](/com-gatt-notify)', which subscribes to
orientation and rotation GATT services from the wheel and sends the data to the DCD Hub.
We remove the subscription to orientation, which is not necessary in this case. We modify
the handler of rotation data so that we check whether we need to nudge the wheelchair user or not.

You can find a complete example in
[vibrate_rotation_excess.py](https://github.com/datacentricdesign/code/blob/master/examples/actuators/vibration_motors/vibrate_rotation_excess.py)
