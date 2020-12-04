# coding: utf-8
import cherrypy
from .db.database import Database
from .model.qualification import Qualification

class QualificationApi:
    def __init__(self, qualifications: Database):
        self.qualifications = qualifications

    @cherrypy.expose
    def default(self):
        raise cherrypy.HTTPError(404)
    default.expose = True

    @cherrypy.expose
    @cherrypy.tools.json_in()
    def update(self):
        input_json = cherrypy.request.json
        qualification = Qualification()
        qualification.id = input_json['id']
        qualification.title = input_json['title']
        qualification.desc = input_json['desc']
        self.qualifications.update(qualification)

    @cherrypy.expose
    @cherrypy.tools.json_in()
    def insert(self):
        input_json = cherrypy.request.json
        qualification = Qualification()
        qualification.title = input_json['title']
        qualification.desc = input_json['desc']
        self.qualifications.insert(qualification)

    @cherrypy.expose
    def delete(self, index):
        self.qualifications.delete(index)
