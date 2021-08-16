---
layout: default
title: "Django and Bucket"
parent: "Data-Centric Design"
has_children: false
author: Alejandra Gomez Ortega
---

# Python Web App
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

[Django](https://www.djangoproject.com/) is a Python web framework to build web applications. In this tutorial, we use Django to create a python web app that interacts with [Bucket](https://dwd.tudelft.nl/bucket/about) via the [Bucket REST API](https://dwd.tudelft.nl/bucket/api/docs/). Before getting started, email [lab@datacentricdesign.org](mailto:lab@datacentricdesign.org) to request your **client credentials**. 

# Get Started

## Create a DCD Lab account

The first step is to [sign up for a Data-Centric Design Lab Account](https://dwd.tudelft.nl/profile/signup) to log in on [Bucket](https://dwd.tudelft.nl/bucket/about). 

## Set Up Your Development Environment

It is always a good idea to set up your development environment when starting a web development project. For this, create a directory (folder) for your project, and cd into it.

```sh
mkdir bucket_web
cd bucket_web
```

Inside your project directory, create a virtual environment. It allows you to create an isolated environment for your project and manage your project dependencies.

```sh
python3 -m venv venv
```

With this command, you have created a folder named **venv** in the **bucket_web** directory. Dependencies that you install later will be stored in this folder together with a copy of the Python standard library. You then need to activate the virtual environment, by running the following command:

```sh
source venv/bin/activate
```

You will know that the virtual environment has been activated, because your console prompt in the terminal will change. You should see **(venv)** appearing on the left side.

You can now install Django. This can be done using pip:

```sh
pip install Django
```

After this step, you might be prompted to update your pip module, this can be done with:

```sh
pip install --upgrade pip
```

Next, you will install [Authlib](https://docs.authlib.org/en/stable/), a library that will help manage the authentication later on.

```sh
pip install Authlib
```

Finally, you will install [Requests](https://docs.python-requests.org/en/master/), a library that will help you manage the HTTP requests later on.

```sh
python -m pip install requests
```

## Create a Django Project

With your virtual environment set up and Django and Authlib installed, you can now dive into the application. First, create the project:

```sh
django-admin startproject example
```

This should create a new folder **example**. At this point, the structure of your bucket_web folder should look like this:

```sh
bucket_web/
│
├── example/
│   ├── example/
│   │   ├── __init__.py
│   │   ├── settings.py
│   │   ├── urls.py
│   │   └── wsgi.py
│   │
│   └── manage.py
│
└── venv/
```

To make things easier for your future self, you might want to restructure your folder. For this, run the following commands: 

```sh
mv example/manage.py ./
mv example/example/* example
rm -r example/example/
```

At this point, the structure of your bucket_web folder should look like this:

```sh
bucket_web/
│
├── example/
│   ├── __init__.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py

├── manage.py
│
└── venv/
```

You can now start the server and check that your set-up was successful by running:

```sh
python manage.py runserver
```

Now, in your web browser, go to [localhost:8000](http://localhost:8000/). You should see the following: 

![Django Install Worked Successfully]({{site.baseurl}}/assets/images/django_success.png)

To stop the program, press `CTRL+C`.

## Create a Django Application

You will now create an app called `bucket_example`. For this, run the following command:

```sh
python manage.py startapp bucket_example
```

This command will create a folder called **bucket_example**, containing the following files:

- `__init__.py`: tells Python to treat the directory as a Python package.
- `admin.py`: contains settings for the Django admin pages.
- `models.py`: contains a series of classes that [Django's Object Relational Mapper (ORM)](https://docs.djangoproject.com/en/3.2/topics/db/models/) converts to database tables.
-`tests.py`: contains test classes.
-`views.py`: contains functions and classes that handle what data is displayed in the HTML templates.

Now you can go to your favourite IDE or code editor to get started with your app. First, you need to install your app in your project. In **bucket_web/example/settings.py**, add the `bucket_example` line under INSTALLED_APPS:

```sh
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'bucket_example',
]
```

This means that your project now knows that the `bucket_example` app exists. Finally, you need to create a **migration**, this is a file containing a Migration class with rules that tell Django what changes need to be made to the database. To create the migration, type the following command in the console:

```sh
python manage.py makemigrations
```

After creating a migration file, you need to apply the migrations set out in the migrations field and create your database using the migrate command:

```sh
python manage.py migrate
```

## Configure OAuth2 Authentication

Now you will configure OAuth2. Here you will get to use your **client credentials**, if you  haven't requested them yet, please email lab@datacentricdesign.org. Your **client credentials** contain sensitive information that should be kept secure. That is why they should be placed in environmental variables and not hard coded in your source code. For this you can create a `.env` file where you can locally store your variables, this file should contain the key value pairs of all the environment variables required. These variables can be then accessed inside your project, like any other variable would be, by using env.


First, create a bucket OAuth client in **bucket_web/example/settings.py** by adding the following lines:

```python
AUTHLIB_OAUTH_CLIENTS = {
    'bucket': {
        'client_id': "Your Client ID",
        'client_secret': None,
    }
}
```

Then, go to the `views.py` of your `bucket_example` app **(bucket_web/bucket_example/views.py)** and add the following imports:

```python
import json
import requests
from django.shortcuts import render, redirect
from authlib.integrations.django_client import OAuth
```

Then, register the remote bucket application with an OAuth object, to learn more about this process you can visit the [Authlib Documentation](https://docs.authlib.org/en/latest/client/frameworks.html#frameworks-clients).

```python
oauth.register(
    name='bucket', # Name of remote application

    access_token_url=env('OAUTH2_TOKEN_URL'),
    access_token_params=None,

    authorize_url=env('OAUTH2_AUTH_URL'),
    authorize_params=None,

    userinfo_endpoint=env('OAUTH2_PROFILE_URL'),

    client_kwargs={
        'scope':'openid profile email offline dcd:things',
    },
    kwargs={
        'token_endpoint_auth_methods_supported': None,
        'grant_types_supported': ["refresh_token", "authorization_code"],
        'response_types_supported': ["id_token", "token", "code"],
        'introspection_endpoint' : env('OAUTH2_INTROSPECT_URL'), # Acess environment variables
        'revocation_endpoint' : env('OAUTH2_REVOKE_URL'),
        'authorization_endpoint' : env('OAUTH2_AUTH_URL'),
    }
)
```


# Create App Views

Inside the `views.py`, you will create the functions that will handle the requests and return responses. To learn more about views you can visit the  [Django Documentation](https://docs.djangoproject.com/en/3.2/topics/http/views/). You already registered the remote bucket application in your `views.py`. Now you will create the following functions:

### Home

You will define a **view function** called `home()`. When this function is called, it will render an HTML file called  `bucket_example.html` (this file doesn't exist yet, you will create it soon). The `home()` function takes one argument: `request` an `HttpRequestObject` that is created when a page is loaded and contains information about the request.

```python
def home(request):
    user = request.session.get('user')
    if user:
        user = json.dumps(user)
    return render(request, 'bucket_example.html', context={'user': user})
```

### Login

The `login()` function will redirect to Bucket for authentication.

```python
def bucket_login(request):
    bucket = oauth.create_client('bucket')
    redirect_uri = OAUTH2_REDIRECT_URL
    return bucket.authorize_redirect(request, redirect_uri)
```

### Authorize

After confirming on Bucket's authorization page, you will be redirected back to your website's `auth()`. Here you get your user's  Bucket profile information as well as the **access token** and you store them in the current session. To know more about sessions and how they work you can read the [Django Documentation](https://docs.djangoproject.com/en/3.2/topics/http/sessions/).

```python
def auth(request):
    token = oauth.bucket.authorize_access_token(request)
    resp = oauth.bucket.get(OAUTH2_PROFILE_URL, token=token)
    resp.raise_for_status()

    profile = resp.json()
    request.session['token'] = token 
    request.session['user'] = profile
    return redirect('/bucket/')
```

### Logout
The `logout()` function will remove the user from the session.

```python
def bucket_logout(request):
    request.session.pop('user', None)
    return redirect('/bucket/')
```

# Interact with Bucket's REST API

Having retrieved the **access token**, you can now interact with Bucket. For this, you will use the requests library, you can find more about how it works in the [Requests Documentation](https://docs.python-requests.org/en/master/). Also, you can always go to the [Bucket REST API Documentation](https://dwd.tudelft.nl/bucket/api/docs/).

### Create a Thing

Here you will create a **thing** with the name *My Thing from Django*. To find more about this step, go to [Bucket REST API: Thing - Create](https://dwd.tudelft.nl/bucket/api/docs/#api-Thing-PostThings).

```python
def create_thing(request):
    token = request.session['token']

    # Create a new thing
    my_thing = {
        "name": "My Thing from Django",
        "description": "Description of my Thing from Django",
        "type": "Test Thing",
        "pem": None,
    }

    hed = {'Authorization': 'bearer ' + token['access_token']}
    response = requests.post(CREATE_THING_URL, json=my_thing, headers=hed)
    if response.ok:
        my_thing_id = response.json()["id"]
        request.session["thing_id"] = my_thing_id
    else:
        response.raise_for_status()
    return render(request, 'bucket_login.html', context={'user': request.session['user'], 'thing_id': response.json()["id"]})
```

### Create a Property
Here you will create a **property** with the name *My Property from Django*. To find more about this step, go to [Bucket REST API: Property - Create](https://dwd.tudelft.nl/bucket/api/docs/#api-Property-PostThingsThingidProperties). 

```python
def create_property(request):
    token = request.session['token']
    thingId = request.session['thing_id']

    my_property = {
        "name": "My Property from Django",
        "description": "Description of my Property from Django",
        "type": "ACCELEROMETER",
        "typeId": None,
    }

    hed = {'Authorization': 'bearer ' + token['access_token']}
    par = {'thingId': thingId}
    response = requests.post(CREATE_PROPERTY_URL, json=my_property, headers=hed, params=par)
    if response.ok:
        my_property_id = response.json()["id"]
        request.session["property_id"] = my_property_id
    else:
        response.raise_for_status()

    return render(request, 'bucket_login.html', context={'user': request.session['user'],
                                                            'thing_id': thingId,
                                                            'property_id': response.json()["id"]})
```

### Update a Property

Here you will update the **property** you recently created, by adding random values. To find more about this step go to [Bucket REST API: Property - Update Values](https://dwd.tudelft.nl/bucket/api/docs/#api-Property-PutThingsThingidPropertiesPropertyid). 

```python
def update_property(request):
    token = request.session['token']
    thingId = request.session['thing_id']
    propertyId = request.session['property_id']

    hed = {'Authorization': 'bearer ' + token['access_token']}
    par = {'thingId' : thingId, 'propertyId': propertyId}

    values = {
        "name": "My Property from Django",
        "description": "Description of my Property from Django",
        "type": "ACCELEROMETER",
        "typeId": None,
        "values": [[1626343350000, 0, 1, 2], # Epoch timestamp in ms, x, y, z
                   [1626343350200, 3, 4, 5],
                   [1626343350400, 6, 7, 8],
                   [1626343350600, 9, 0, 1]],
    }

    response = requests.put(UPDATE_PROPERTY_URL, json=values, headers=hed, params=par)
    if response.status_code == 200:
        update = True
    else:
        update = False
        response.raise_for_status()
        
    return render(request, 'bucket_update.html', context={'user': request.session['user'],
                                                            'thing_id': thingId,
                                                            'property_id': propertyId,
                                                            'update' : update})
```

### Read a Property

Finally, you will read the **property** you recently created, and added values to. To find more about this step go to [Bucket REST API: Property - Read](https://dwd.tudelft.nl/bucket/api/docs/#api-Property-GetThingsThingidPropertiesPropertyid).

```python
def read_property(request):
    token = request.session['token']
    thingId = request.session['thing_id']
    propertyId = request.session['property_id']

    hed = {'Authorization': 'bearer ' + token['access_token']}
    par = {'thingId': thingId, 'propertyId': propertyId, 'from' : 1626343350000, 'to': 1626343350600} # Start and End Timestamps
    response = requests.get(UPDATE_PROPERTY_URL, headers=hed, params=par)
    if response.ok:
        my_property_values = response.json()["values"]
    else:
        response.raise_for_status()
        my_property_values = None

    return render(request, 'bucket_login.html', context={'user': request.session['user'],
                                                          'thing_id': thingId,
                                                          'property_id': propertyId,
                                                          'values': my_property_values,
                                                          'update' : update,})
```

# Create Django Templates

In your `bucket_example` app create the subfolder **templates**, inside this folder you will create one file, corresponding to the HTML template to display to the user. For simplicity you will create a basic login view named `bucket_login.html`, containing several links that will let you log in, create a thing, create a property, update the property with random values, and finally read the property values and display them.

```sh
{% if user %}
    <b>User Info: </b>{{ user}}<br>
    <hr>
    <a href="/bucket/thing/">Create Thing</a><br>
    <b>Thing Id: </b>{{ thing_id }}<br>
    <hr>
    <a href="/bucket/prop/">Create Property</a><br>
    <b>Property Id: </b>{{ property_id }}<br>
    <hr>
    <a href="/bucket/update/">Update Property</a><br>
    <b>Updated :</b>{{ update }}<br>
    <hr>
    <a href="/bucket/read/">Read Property</a><br>
    <b>Property Values :</b>{{ values }}<br>
    <hr>
    <a href="/bucket/logout/">Logout</a>

    {% else %}
    <a href="/bucket/login/">Login with Bucket</a>
{% endif %}
```

# Set Django URLs

In your `bucket_example` app create the file **urls.py** and determine the URL configuration for the `bucket_example` application. Add the following: 

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.home),
    path('login/', views.bucket_login, name='login'),
    path('auth/', views.auth, name='auth'),
    path('thing/', views.create_thing, name='thing'),
    path('prop/', views.create_property, name='prop'),
    path('update/', views.update_property, name='update'),
    path('read/', views.read_property, name='update'),
    path('logout/', views.bucket_logout, name='logout'),
]
```

In **bucket_web/example/urls.py** add the following:

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('bucket/', include('bucket_example.urls')) #Includes all the urls in the bucket_example app
]
```

This line looks for a module called urls.py inside the `bucket_example` application and registers any URLs defined there. In this way, when you visit the root path of your URL [localhost:8000](http://localhost:8000/), `bucket_example` application’s URLs will be registered and you will be able to visit them. Now you can access the URL [localhost:8000/bucket/](http://localhost:8000/bucket/) by starting the server with `python manage.py runserver`. 

![Login view]({{site.baseurl}}/assets/images/django_login.png)

# Extra: Django Models

Django has a built-in [Object Relational Mapper (ORM)](https://docs.djangoproject.com/en/3.2/topics/db/models/) that allows you to create classes that correspond to database tables. Class attributes correspond to columns, and instances of the classes to rows. In your Django application, you can build these classes in `models.py`. In this tutorial, you won't be storing any data, therefore you won't use the `models.py`. If you are interested in expanding the functionalities of your application you should definitely read more about this, a good place to get started is the [Django Documentation](https://docs.djangoproject.com/en/3.2/topics/db/models/).

The repository for this project can be found [here](https://github.com/gomezago/bucket_web)
