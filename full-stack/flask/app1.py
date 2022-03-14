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


@app.route('/people/<int:id>')
def get_person(id):
    """get person"""

    if id in people:
        return people[id]

    return Response(f'Person not found: {id}', status=404, mimetype='text/plain')


@app.route('/params')
def get_params():
    """get params"""
    print(request.args)
    params = ''
    for key, value in request.args.items():
        params += f'{key}={value} \n'
    return f'Los parametros son: \n{params}'


app.debug = True

app.run()
