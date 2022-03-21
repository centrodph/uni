from pydoc import describe
from flask import Flask, Response
from flask_restx import Api
from flask import Blueprint
from flask_restx import Resource, Namespace, Model, fields


# DTO: Data Transfer Object

people = {
    1: {
        'nombre': 'test',
        'pais': 'argentina',
    },
    2: {
        'nombre': 'example',
        'pais': 'argentina',
    },
}


person_dto = Model('Person', {
    'nro_documento': fields.Integer(
        required=True,
        description='The person\'s document number',
    ),
    'nombre': fields.String(
        required=True,
        description='The person\'s name',
    ),
    'pais': fields.String(
        required=True,
        description='The person\'s country',
    ),
})

request_person_dto = Model('PersonRequest', {
    'nro_documento': fields.Integer(
        required=True,
        description='The person\'s document number',
    ),
    'nombre': fields.String(
        required=True,
        description='The person\'s name',
    ),
    'pais': fields.String(
        required=True,
        description='The person\'s country',
    ),
})

error_response_dto = Model('ErrorResponse', {
    'code': fields.String(
        required=True,
        description='Code of the error',
    ),
    'message': fields.String(
        required=True,
        description='Error description',
    ),
})


api_persona = Namespace(
    'Person',
    path='/people',
    description='People related operations'
)


api_persona.model('Person', person_dto)
api_persona.model('ErrorResponse', error_response_dto)
request_person_dto_registered = api_persona.model('PersonRequest', request_person_dto)


@api_persona.route('/')
class Persona(Resource):

    @api_persona.doc(
        describe='obtener listado de personas'
    )
    @api_persona.response(
        200,
        description='Listado de personas',
        model=fields.List(fields.Nested(person_dto))
    )
    @api_persona.response(
        500,
        description='Error en listado',
        model=error_response_dto
    )
    def get(self):
        return people

    @api_persona.doc(
        describe='agrega persona a listado'
    )
    @api_persona.response(
        201,
        description='Persona creada',
        model=person_dto
    )
    @api_persona.response(
        500,
        description='Error en servidor',
        model=error_response_dto
    )
    @api_persona.expect(request_person_dto_registered, validate=True)
    def post(self):
        return Response(status=201)


# archivo aparte
# CREAR LA APP Blueprint
api_bp = Blueprint('api', __name__)
api = Api(api_bp, title='Person API', version='1.0')
api.add_namespace(api_persona)


# archivo aparte
# CREAR LA APP
app = Flask(__name__)
app.register_blueprint(api_bp, url_prefix='/')
app.debug = True
app.run()
