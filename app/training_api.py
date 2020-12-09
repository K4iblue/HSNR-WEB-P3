# coding: utf-8
import cherrypy
from .db.database import Database
from .model.training import Training
from .model.training import TrainingGrantsQualification

class TraingApi:
    def __init__(self, trainings: Database, granted_qualifications: Database):
        self.trainings = trainings
        self.granted_qualifications = granted_qualifications

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
        training.certificate_id = input_json['certificate_id']
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
        training.certificate_id = input_json['certificate_id']
        self.trainings.insert(training)

    @cherrypy.expose
    @cherrypy.tools.json_in()
    def add_qualification(self):
        input_json = cherrypy.request.json
        granted_qualification = TrainingGrantsQualification()
        granted_qualification.training_id = input_json['training_id']
        granted_qualification.qualification_id = input_json['qualification_id']
        self.granted_qualifications.insert(granted_qualification)

    @cherrypy.expose
    @cherrypy.tools.json_in()
    def remove_qualification(self, training_id, qualification_id):
        self.granted_qualifications.query(f'''
            DELETE FROM {self.granted_qualifications.tableName}
            WHERE training_id = ?
              AND qualification_id = ?
        ''', [training_id, qualification_id])

    @cherrypy.expose
    def delete(self, index):
        self.trainings.delete(index)
