# coding: utf-8
import cherrypy
from .db.database import Database
from .model.employee import Employee

class EmployeeApi:
    def __init__(self, employees: Database):
        self.employees = employees

    @cherrypy.expose
    def default(self):
        raise cherrypy.HTTPError(404)
    default.expose = True

    @cherrypy.expose
    @cherrypy.tools.json_in()
    def update(self):
        input_json = cherrypy.request.json
        employee = Employee()
        employee.id = input_json['id']
        employee.name = input_json['name']
        employee.surname = input_json['surname']
        employee.degree = input_json['degree']
        employee.occupation = input_json['occupation']
        self.employees.update(employee)

    @cherrypy.expose
    @cherrypy.tools.json_in()
    def insert(self):
        input_json = cherrypy.request.json
        employee = Employee()
        employee.name = input_json['name']
        employee.surname = input_json['surname']
        employee.degree = input_json['degree']
        employee.occupation = input_json['occupation']
        self.employees.insert(employee)

    @cherrypy.expose
    def delete(self, index):
        self.employees.delete(index)
