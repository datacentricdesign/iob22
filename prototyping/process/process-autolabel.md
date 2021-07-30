---
layout: default
title: "Automatically Labelling Data at Collection Time in Python"
parent: "Processes"
grand_parent: "Prototyping"
has_children: false
---

In this post, we explore how to set up a Python script to automatically labelling data at collection time in Python. The script prompts the user with the classes to perform and associates the corresponding label to the recorded data.

It is useful to collect a dataset ready for training a machine learning algorithm.

In this example we will collect data from 12 FSRs installed on a chair and label
it with the three classes: 'Not Sitting', 'Proper Sitting' and 'Leaning Forward'.

* [Connect to a Thing](#connect-to-a-thing)
* [Create a Class Property](#create-a-class-property)
* [Serial Connection](#serial-connection)
* [Collect and Label](#collect)


![Jupyter Example]({{site.baseurl}}/assets/images/collect-labelled-data.png)

# Connect to a Thing

We start with a typical connection to the DCD hub, bringing the Python dependencies
importing the thing ID and token from the .env file and instantiating an Thing. Refer
to the [Python SDK (Step 5)](https://datacentricdesign.github.io/python-sdk#step-5-connecting-a-thing-to-the-hub)
if you did not set up your .env file yet.

```python
# Import required library
from dotenv import load_dotenv
import os
import serial
import time

from dcd.entities.thing import Thing
from dcd.entities.property import PropertyType

# The thing ID and access token
load_dotenv()
THING_ID = os.environ['THING_ID']
THING_TOKEN = os.environ['THING_TOKEN']

# Instantiate a thing with its credential
my_thing = Thing(thing_id=THING_ID, token=THING_TOKEN)
my_thing.read()
```

# Create a Class Property

The next step is to create a Property of type CLASS. Like any Property we give it
a name, e.g. 'Sitting Posture'. The type CLASS means that the property has 1-dimension
values and this value is a integer from 0 to n-1, where n is the number of classes.
In this example n = 3 and values should be 0 (Not Sitting), 1 (Proper Sitting) and
2 (Leaning Forward).


```python
LABEL_PROP_NAME = "Sitting Posture"
LABEL_PROP_TYPE = PropertyType.CLASS

DATA_PROP_NAME = "FSR"
DATA_PROP_TYPE = PropertyType.TWELVE_DIMENSIONS

# Sitting classes
CLASSES = ["Not Sitting", "Proper Sitting", "Leaning Forward"]

# Find label property by name, create classes if none
prop_label = my_thing.find_or_create_property(LABEL_PROP_NAME, LABEL_PROP_TYPE)
if prop_label.classes is None or len(prop_label.classes) == 0:
    prop_label.create_classes(CLASSES)
# Find data property by name
prop_data = my_thing.find_or_create_property(DATA_PROP_NAME, DATA_PROP_TYPE)
```

# Serial Connection

To label data coming from the serial port, we can modify the 
[serial example code](/com-serial). We first wrap the serial
connection into a function. This will facilitate its use in the next section.

```python
# Open a serial connection
def open_serial():
    # Start reading the serial port
    return serial.Serial(
        port=os.environ['SERIAL'],
        baudrate=9600,
        timeout=2)
```

Then we modify the serial_to_property_values to pass two parameters: the index of
the current class (e.g. what sitting posture are we currently collecting) and the
serial connection.

```python
# Read the next line from the serial port
# and update the property values
def serial_to_property_values(class_index, ser):
    # Read one line
    line_bytes = ser.readline()
    # If the line is not empty
    if len(line_bytes) > 0:
        # Convert the bytes into string
        try:
            line = line_bytes.decode('utf-8')
        except UnicodeDecodeError:
            return False
        # Split the string using commas as separator, we get a list of strings
        str_values = line.split(',')
        # Remove the first id
        str_values.pop(0)
        # Transform the array of string values into float values (numbers)
        try:
            values = [float(x) for x in str_values]
        except ValueError:
            return False

        # get the current time in milliseconds
        current_ts_ms = int(round(time.time() * 1000))
        # Update values of data and label properties (send them to the DCD Hub)
        # With the same timestamp, so we can easily connect label and raw data later
        prop_label.update_values([class_index], current_ts_ms)
        prop_data.update_values(values, current_ts_ms)

        return True
    return False
```

# Collect

The last step consists in telling the user what to do. We create a function
create_and_label which take the index of a class as parameter. This function 
displays the current class for a given time (DELAY_BETWEEN_POSTURE), then open
the serial port to start collecting and labelling data for the given class.

```python
# How many samples do we want for each class
MAX_SAMPLES = 300
# How much time (in seconds) to leave between the collection of each class
DELAY_BETWEEN_POSTURE = 7

# Collect data for a given posture
# posture_index: index of the class in the array CLASSES
def collect(class_index):
    # Prompt the user to get ready and wait
    print("Get ready to collect the posture: " + CLASSES[class_index]
          + " in " + str(DELAY_BETWEEN_POSTURE) + " seconds!")
    time.sleep(DELAY_BETWEEN_POSTURE)

    # Open the serial connection
    print("Collecting data for posture " + CLASSES[class_index])
    ser = open_serial()

    # Start reading serial port with the posture index, start at sample 0.
    sample = 0
    while sample < MAX_SAMPLES:
        if serial_to_property_values(class_index, ser):
            sample += 1
            print("Remaining samples: " + str(MAX_SAMPLES - sample))
    ser.close()
```

Finally, we loop through all classes and collect data.

```python
class_index = 0
while class_index < len(CLASSES):
    collect(class_index)
    class_index = class_index + 1

print("Data collection done.")
```

You can find the code of this example [here](https://github.com/datacentricdesign/code/blob/master/examples/process/collect.py)
