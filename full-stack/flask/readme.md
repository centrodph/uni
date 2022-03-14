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