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
        certificate = Certificate()
        certificate.id = input_json['id']
        certificate.title = input_json['title']
        certificate.desc = input_json['desc']
        certificate.qualifies = input_json['qualifies']
        self.certificates.update(certificate)

    @cherrypy.expose
    @cherrypy.tools.json_in()
    def insert(self):
        input_json = cherrypy.request.json
        participation = Participation()
        participation.employee_id = input_json['employee_id']
        participation.training_id = input_json['training_id']
        self.participations.insert(participation)

    @cherrypy.expose
    def delete(self, index):
        self.certificates.delete(index)
