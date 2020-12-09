# coding: utf-8
import cherrypy
from .db.database import Database
from .model.participation import Participation

class ParticipationApi:
    def __init__(self, participations: Database):
        self.participations = participations

    @cherrypy.expose
    def default(self):
        raise cherrypy.HTTPError(404)
    default.expose = True

    @cherrypy.expose
    @cherrypy.tools.json_in()
    def update(self):
        input_json = cherrypy.request.json
        employee_id = input_json['employee_id']
        training_id = input_json['training_id']
        status = input_json['status']
        self.participations.query(
            '''
                UPDATE participation
                SET status = ? 
                WHERE employee_id = ?
                  AND training_id = ?
            ''', 
            [status, employee_id, training_id]
        )

    @cherrypy.expose
    @cherrypy.tools.json_in()
    def insert(self):
        input_json = cherrypy.request.json
        participation = Participation()
        participation.employee_id = input_json['employee_id']
        participation.training_id = input_json['training_id']
        participation.status = input_json['status']
        self.participations.insert(participation)
