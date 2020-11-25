# coding: utf-8
import cherrypy
from .view import View

class Application():
    @cherrypy.expose
    def index(self):
        return View().index({})

    @cherrypy.expose
    def default(self):
        raise cherrypy.HTTPError(404)
    default.expose = True
# EOF
