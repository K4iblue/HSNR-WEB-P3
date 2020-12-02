# coding: utf-8
import cherrypy
from .view import View

class Application:
    @cherrypy.expose
    def index(self):
        return View().index({"employees": 10, "trainings": 13, "participations": 5})

    @cherrypy.expose
    def default(self):
        raise cherrypy.HTTPError(404)
    default.expose = True

    @cherrypy.expose
    def editEmployees(self):
        return

    @cherrypy.expose
    def editTrainings(self):
        return

    @cherrypy.expose
    def participationEmployees(self):
        return

    @cherrypy.expose
    def participationTrainings(self):
        return

    @cherrypy.expose
    def reportEmployees(self):
        return

    @cherrypy.expose
    def reportTrainings(self):
        return

    @cherrypy.expose
    def reportCertificates(self):
        return

# EOF
