# coding: utf-8
import cherrypy
from .db.database import Database
from .model.certificate import Certificate

class CertificateApi:
    def __init__(self, certificates: Database):
        self.certificates = certificates

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
        certificate = Certificate()
        certificate.title = input_json['title']
        certificate.desc = input_json['desc']
        certificate.qualifies = input_json['qualifies']
        self.certificates.insert(certificate)

    @cherrypy.expose
    def delete(self, index):
        self.certificates.delete(index)
