# coding: utf-8
import cherrypy
from .db.database import Database
from .view import View

class Application:
    def __init__(self, employees: Database, trainings: Database):
        self.employees = employees
        self.traingings = trainings

    @cherrypy.expose
    def index(self):
        return View().index(
                {
                    "employees": self.employees.count(),
                    "trainings": 13,
                    "participations": 5
                }
            )

    @cherrypy.expose
    def default(self):
        raise cherrypy.HTTPError(404)
    default.expose = True

    @cherrypy.expose
    def edit_employees(self):
        return View().editEmployees(
                {
                    "employees": self.employees.get_all()
                }
            )

    @cherrypy.expose
    def edit_trainings(self):
        return

    @cherrypy.expose
    def participation_employees(self):
        return

    @cherrypy.expose
    def participation_trainings(self):
        return

    @cherrypy.expose
    def report_employees(self):
        return

    @cherrypy.expose
    def report_trainings(self):
        return

    @cherrypy.expose
    def report_certificates(self):
        return

# EOF
