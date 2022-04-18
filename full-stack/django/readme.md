#### add virtual env

`virtualenv env`

#### install rest framework

`pip install djangorestframework`


#### get packages for test

`pip install faker factory-boy`


#### get versions

`pip freeze > ./requirements.txt`

#### use admin


`$ django-admin`


#### crear project

`django-admin startproject event_project .`


#### crear app

`django-admin startapp event`

#### agregar aplicaciones en setting

`event_project/settings.py`

#### crear migraciones

`python manage.py makemigrations`

`python manage.py migrate`

#### start

`python manage.py runserver`


#### create super user

`python manage.py createsuperuser`