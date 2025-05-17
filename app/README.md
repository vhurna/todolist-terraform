# Django ToDo list

This is a todo list web application with basic features of most web apps, i.e., accounts/login, API, and interactive UI. To do this task, you will need:

- CSS | [Skeleton](http://getskeleton.com/)
- JS  | [jQuery](https://jquery.com/)

## How to launch the application

Install system pre-requirements:
```
sudo apt install python3-pip
```

Install the requirements:

```
pip install -r requirements.txt
```

Create a database schema:

```
python3 manage.py migrate
```

And then start the server (default is http://localhost:8000):


```
python manage.py runserver 0.0.0.0:8080
```

Now you can browse the [API](http://localhost:8000/api/) or start on the [landing page](http://localhost:8000/).
