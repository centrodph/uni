```
curl  http://localhost:5000/ -i
HTTP/1.0 200 OK
Content-Type: text/html; charset=utf-8
Content-Length: 13
Server: Werkzeug/2.0.3 Python/3.9.7
Date: Mon, 14 Mar 2022 23:03:28 GMT

Hello, World!%  

```


```
curl  http://localhost:5000/people/1 -i    
HTTP/1.0 200 OK
Content-Type: text/html; charset=utf-8
Content-Length: 3
Server: Werkzeug/2.0.3 Python/3.9.7
Date: Mon, 14 Mar 2022 23:21:13 GMT

uno%
```


```
curl  http://localhost:5000/people/7 -i
HTTP/1.0 404 NOT FOUND
Content-Type: text/plain; charset=utf-8
Content-Length: 16
Server: Werkzeug/2.0.3 Python/3.9.7
Date: Mon, 14 Mar 2022 23:25:52 GMT

Person not found%
```


### con parametros

```
curl  'http://localhost:5000/params?param1=123&param2=test' -i
HTTP/1.0 200 OK
Content-Type: text/html; charset=utf-8
Content-Length: 46
Server: Werkzeug/2.0.3 Python/3.9.7
Date: Mon, 14 Mar 2022 23:47:13 GMT

Los parametros son: 
param1=123 
param2=test 
```


## flask estructura de ejemplo

 - app/

## ejecutar env

`$(cat .env)`


## correr flask run

`flask run`

```
 app % flask run    
 * Tip: There are .env or .flaskenv files present. Do "pip install python-dotenv" to use them.
 * Serving Flask app 'backend' (lazy loading)
 * Environment: development
 * Debug mode: on
BASE_DIR: /Users/gerardoperrucci/Sites/UniversityMaterials/universidad_code/full-stack/flask/app
FLASK_ENV: development
 * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
 * Restarting with stat
 * Tip: There are .env or .flaskenv files present. Do "pip install python-dotenv" to use them.
 * Debugger is active!
 * Debugger PIN: 264-891-531
BASE_DIR: /Users/gerardoperrucci/Sites/UniversityMaterials/universidad_code/full-stack/flask/app
FLASK_ENV: development
```


## iniciar DB flask db init