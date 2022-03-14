from flask import Flask, Response

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


app.debug = True

app.run()
