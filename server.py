#coding: utf-8

from app.db.database import Database
from app.model.employee import Employee
from app.model.training import Training
from app.model.certificate import Certificate
from app.model.qualification import Qualification
import sys
import os
import cherrypy
from app.application import Application
from app.employee_api import EmployeeApi
from app.certificate_api import CertificateApi
from app.qualification_api import QualificationApi

def main():
    employees = Database(Employee)
    trainings = Database(Training)
    certificates = Database(Certificate)
    qualifications = Database(Qualification)

    try:
        current_dir = os.path.dirname(os.path.abspath(__file__))
    except:
        current_dir = os.path.dirname(os.path.abspath(sys.executable))
    cherrypy.engine.autoreload.unsubscribe()
    static_config = {
        '/static': {
            'tools.staticdir.root': current_dir,
            'tools.staticdir.on': True,
            'tools.staticdir.dir': './content',
            'tools.gzip.on': True
        }
    }
    cherrypy.tree.mount(Application(employees, trainings, certificates, qualifications), '/', static_config)
    cherrypy.tree.mount(EmployeeApi(employees), '/api/employee', static_config)
    cherrypy.tree.mount(CertificateApi(certificates), '/api/certificate', static_config)
    cherrypy.tree.mount(QualificationApi(qualifications), '/api/qualification', static_config)
    cherrypy.config.update({'request.show_tracebacks': False})
    cherrypy.engine.start()
    cherrypy.engine.block()
if __name__ == '__main__':
    main()
# EOF
