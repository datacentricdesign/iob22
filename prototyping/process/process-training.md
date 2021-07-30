---
layout: default
title: "Training a Machine Learning algorithm with data from the DCD Hub in Python"
parent: "Processes"
grand_parent: "Prototyping"
has_children: false
---

In this post we train a machine learning algorithm with data from the DCD Hub, in Python. We use a Jupyter Notebook to lead you through the training process.

If you do not have Jupyter yet, you can install it with the following commands in the terminal:

```bash
python3 -m pip install --upgrade pip
python3 -m pip install jupyter
```

Then, you can start with:

```bash
jupyter notebook
```

Running this command should redirect you to your favorite web browser and open
the Jupyter web interface. Otherwise, a link shows up in the terminal, you can
copy/paste it in your web browser.


# Requirements

Make sure you have the proper dependencies to run this code. To do so, you can
create a file 'requirements.txt' and write the name of the dependencies as follows:

```txt
dcd-sdk>=0.0.16
paho-mqtt
python-dotenv
pyserial
requests
sklearn
numpy
```

Then execute the following command:

```bash
python3 -m pip install -r requirements.txt --user
```

# Train

Downloads this Jupyter example to start exploring the your data (right-click and 'Save link As...'):
[training.ipynb](https://github.com/datacentricdesign/code/blob/master/examples/process/training.ipynb)

Back in Jupyter, click on File > Open

![Jupyter Open]({{site.baseurl}}/assets/images/jupyter-open.png)

Then, click on Upload

![Jupyter Upload]({{site.baseurl}}/assets/images/jupyter-upload.png)


# Predict

Once you trained your classifier and save its model in a file, you are ready to
use it for prediction.


```python
from dotenv import load_dotenv
import os
import pickle
import serial
import time
import numpy as np

from dcd.entities.thing import Thing
from dcd.entities.property import PropertyType

# The thing ID and access token
load_dotenv()
THING_ID = os.environ['THING_ID']
THING_TOKEN = os.environ['THING_TOKEN']

# Name of the property containing the labels
CLASS_PROP_NAME = "Sitting Posture"

# Where to read the model from
MODEL_FILE_NAME = "model.pickle"


# Instantiate a thing with its credential
my_thing = Thing(thing_id=THING_ID, token=THING_TOKEN)
my_thing.read()

# Extract labels from the label property
sitting = my_thing.find_property_by_name(CLASS_PROP_NAME)
classes = []
for clazz in sitting.classes:
    classes.append(clazz['name'])

PREDICT_PROP_NAME = "Predicted Sitting Posture"
PREDICT_PROP_TYPE = PropertyType.CLASS
prop_predict = my_thing.find_or_create_property(PREDICT_PROP_NAME, PREDICT_PROP_TYPE)

DATA_PROP_NAME = "FSR"
DATA_PROP_TYPE = PropertyType.TWELVE_DIMENSIONS
prop_data = my_thing.find_or_create_property(DATA_PROP_NAME, DATA_PROP_TYPE)



# Load the classifier (model trained in the previous section)
with open(MODEL_FILE_NAME, 'rb') as file:
    neigh = pickle.load(file)

# Read data from serial port
ser = serial.Serial(
    port=os.environ['SERIAL'],
    baudrate=9600,
    timeout=2)

# Real time prediction
def serial_to_property_values():
    line_bytes = ser.readline()
    # If the line is not empty
    if len(line_bytes) > 0:
        # Convert the bytes into string
        line = line_bytes.decode('utf-8')
        str_values = line.split(',')
        if len(str_values) > 1:
            str_values.pop(0)
            values = [float(x) for x in str_values]
            values = [values]
            print(values)
            np.array(values).reshape(1, -1)

            # Make a prediction and show the label of the predicted class
            result = neigh.predict(values)
            print(classes[result[0]])

            # get the current time in milliseconds
            current_ts_ms = int(round(time.time() * 1000))

            prop_predict.update_values([float(result[0])], current_ts_ms)
            prop_data.update_values(values[0], current_ts_ms)


while True:
    serial_to_property_values()

```

You can find the code of this example [here](https://github.com/datacentricdesign/code/blob/master/examples/process/predict.py)
