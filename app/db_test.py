# coding: utf-8
import cherrypy
from .model.employee import Employee

from .db import database

class DBTest:

    @cherrypy.expose
    def default(self):
        raise cherrypy.HTTPError(404)
    default.expose = True

    @cherrypy.expose
    def index(self, q):
        db = database.Database(Employee)
        return str(db.query(q))

# EOF