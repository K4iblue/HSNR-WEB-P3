# coding: utf-8
import cherrypy

class Application():
    @cherrypy.expose
    def default(self):
        raise cherrypy.HTTPError(404)
    default.expose = True
# EOF
