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
    def index(self):
        db = database.Database(Employee)
        e = Employee()
        e.name = "Mustermann"
        e.surname = "Max"
        e.occupation = "Neuss"
        e.degree = "Abi"
        db.insert(e)
        return str(db.get_all())

# EOF
