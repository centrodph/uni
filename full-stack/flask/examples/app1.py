from flask import Flask, Response, request

app = Flask(__name__)


# Dictionary: key-value
people = {
    1: 'uno',
    2: 'dos',
    3: 'tres',
}

"""GET simple"""


@app.route('/')
def index():
    """main page"""
    return "Hello, World!"


@app.route('/params')
def get_params():
    """get params"""
    print(request.args)
    params = ''
    for key, value in request.args.items():
        params += f'{key}={value} \n'
    return f'Los parametros son: \n{params}'

# curl http://localhost:5000/people/2 -i


@app.route('/people/<int:id>')
def get_person(id):
    """get person"""

    if id in people:
        return people[id]

    return Response(f'Person not found: {id}', status=404, mimetype='text/plain')


# curl http://localhost:5000/people/ -i
@app.route('/people/')
def list_people():
    """get people"""

    return people


'''
Add people
curl http://localhost:5000/people/ -i -X POST -d '{"nro_doc": "3213323", "nombre":"ejemplo"}' -H "Content-Type: application/json"

curl http://localhost:5000/people/ -i -X POST -d '{"data1": "data1", "data2":"valor2"}' -H "Content-Type: application/json"
curl http://localhost:5000/people/ -i -X POST -F campo1=valor1 -F campo2=valor2
'''


@app.route('/people/', methods=['POST'])
def add_person():
    """post params"""
    # print('DATA', request.data)
    # print('FORM', request.form)
    # print('GET JSON', request.get_json())
    try:
        data = request.get_json()
        if not data or not 'nro_doc' in data:
            return Response('Missing nro_doc', status=400, mimetype='text/plain')

        people[int(data["nro_doc"])] = data["nombre"]

        return Response(f'Person added: {data["nro_doc"]}', status=201, mimetype='text/plain')
    except Exception as e:
        return Response(f'Error {e}', status=400, mimetype='text/plain')


app.debug = True

app.run()
