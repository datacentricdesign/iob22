---
layout: default
title: "Serial to DCD Hub with Arduino, Raspberry Pi and FSR"
parent: "Communication"
grand_parent: "Prototyping"
has_children: false
---

In this tutorial, we lead you toward sensing data over serial. We will collect data coming out of a Force Sensitive Resistor.

## Step 1: Force Sensitive Resistor

Have a look to the following post on FSR to explore this sensor:
[FSR](/sensors-force)

## Step 2: Formatting data output

We now want to send this data to a Python programme, running on a computer connected
via serial to the Arduino. To make it easy (and more systematic) to parse for
the receiver (Python code), you need to produce the following output for each line
of data.

```txt
My accelerometer,<value-of-x>,<value-of-y>,<value-of-z>
```

Thus, each line start with the name of your property followed by the values 

## Step 3: Python

The last step is to write a Python code on your laptop to read the Serial input
from the Arduino and forward them to the Data-Centric Design Hub.

You can find the full example 
[here](https://github.com/datacentricdesign/code/blob/master/examples/communication/serial/serial_to_dcdhub.py)

The following code shows how to open a serial connection.

```python
# Start reading the serial port
ser = serial.Serial(
    port = os.environ['SERIAL'],
    baudrate = 9600,
    timeout = 2)
```

In this code, we use an extra environment variable (SERIAL) to specify the serial port.
You can find the port name for it on the Arduino IDE, in the top menu Tools > Ports.
For example:

```bash
THING_ID=
THING_TOKEN=
SERIAL=MY_PORT_NAME
```

Once the connection is open, we want to read each incoming line and decode it as
text (utf-8). Each line contains the property id, followed by the values separated
with comma. We decompose the line by splitting on comma, retrieve the property
and update the values.

```python
# Read the next line from the serial port
# and update the property values
def serial_to_property_values():
    # Read one line
    line_bytes = ser.readline()
    # If the line is not empty
    if len(line_bytes) > 0:
        # Convert the bytes into string
        line = line_bytes.decode('utf-8')
        # Split the string using commas as separator, we get a list of strings
        values = line.split(',')
        # Use the first element of the list as property id
        property_id = values.pop(0)
        # Get the property from the thing
        prop = my_thing.properties[property_id]
        # If we find the property, we update the values (rest of the list)
        if prop is not None:
            prop.update_values([float(x) for x in values])
        # Otherwise, we show a warning
        else:
            print('Warning: unknown property ' + property_id)
```

You can execute the Python script again and check incoming data with on the DCD Hub.



