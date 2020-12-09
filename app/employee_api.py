# coding: utf-8
import cherrypy
from .db.database import Database
from .model.employee import Employee
from .model.employee import EmployeeOwnsCertificate
from .model.employee import EmployeeOwnsQualification

class EmployeeApi:
    def __init__(self, employees: Database, owned_certificates: Database, owned_qualifications: Database):
        self.employees = employees
        self.owned_certificates = owned_certificates
        self.owned_qualifications = owned_qualifications

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
    @cherrypy.tools.json_in()
    def add_certificate(self):
        input_json = cherrypy.request.json
        owned_certificate = EmployeeOwnsCertificate()
        owned_certificate.employee_id = input_json['employee_id']
        owned_certificate.certificate_id = input_json['certificate_id']
        self.owned_certificates.insert(owned_certificate)

    @cherrypy.expose
    @cherrypy.tools.json_in()
    def add_qualification(self):
        input_json = cherrypy.request.json
        owned_qualification = EmployeeOwnsQualification()
        owned_qualification.employee_id = input_json['employee_id']
        owned_qualification.qualification_id = input_json['qualification_id']
        self.owned_qualifications.insert(owned_qualification)

    @cherrypy.expose
    def delete(self, index):
        self.employees.delete(index)
