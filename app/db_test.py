# coding: utf-8
import cherrypy

from . import database

class DBTest:

    @cherrypy.expose
    def default(self):
        raise cherrypy.HTTPError(404)
    default.expose = True

    @cherrypy.expose
    def index(self):
        db = database.Database[float]("test")
        db.add(3.5)
        db.add(4.5)
        db.save()
        return str(db.get(1))

# EOF