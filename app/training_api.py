# coding: utf-8
import cherrypy
from .db.database import Database
from .model.training import Training

class TraingApi:
    def __init__(self, trainings: Database, grantedCertificates: Database, grantedQualifications: Database):
        self.trainings = trainings

    @cherrypy.expose
    def default(self):
        raise cherrypy.HTTPError(404)
    default.expose = True

    @cherrypy.expose
    @cherrypy.tools.json_in()
    def update(self):
        input_json = cherrypy.request.json
        training = Training()
        training.id = input_json['id']
        training.title = input_json['title']
        training.desc = input_json['desc']
        training.date_from = input_json['date_from']
        training.date_to = input_json['date_to']
        training.min_participants = input_json['min_participants']
        training.max_participants = input_json['max_participants']
        self.trainings.update(training)

    @cherrypy.expose
    @cherrypy.tools.json_in()
    def insert(self):
        input_json = cherrypy.request.json
        training = Training()
        training.title = input_json['title']
        training.desc = input_json['desc']
        training.date_from = input_json['date_from']
        training.date_to = input_json['date_to']
        training.min_participants = input_json['min_participants']
        training.max_participants = input_json['max_participants']
        self.trainings.insert(training)

    @cherrypy.expose
    def delete(self, index):
        self.trainings.delete(index)
