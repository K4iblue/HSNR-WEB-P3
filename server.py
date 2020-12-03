#coding: utf-8

from app.db.database import Database
from app.model.employee import Employee
from app.model.training import Training
import sys
import os
import cherrypy
from app.application import Application
from app.employee_api import EmployeeApi
from app import db_test

def main():
    employees = Database(Employee)
    trainings = Database(Training)

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
    cherrypy.tree.mount(Application(employees, trainings), '/', static_config)
    cherrypy.tree.mount(EmployeeApi(employees), '/api/employee', static_config)
    cherrypy.tree.mount(db_test.DBTest(), '/db', static_config)
    cherrypy.config.update({'request.show_tracebacks': False})
    cherrypy.engine.start()
    cherrypy.engine.block()
if __name__ == '__main__':
    main()
# EOF
