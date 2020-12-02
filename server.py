#coding: utf-8

from app.db.database import Database
from app.model.employee import Employee
import sys
import os
import cherrypy
from app import application
from app import db_test

def main():
    employees = Database(Employee)

    try:
        current_dir = os.path.dirname(os.path.abspath(__file__))
    except:
        current_dir = os.path.dirname(os.path.abspath(sys.executable))
    cherrypy.engine.autoreload.unsubscribe()
    static_config = {
        '/': {
            'tools.staticdir.root': current_dir,
            'tools.staticdir.on': True,
            'tools.staticdir.dir': './content'
        }
    }
    cherrypy.tree.mount(application.Application(), '/', static_config)
    cherrypy.tree.mount(db_test.DBTest(), '/db', static_config)
    cherrypy.config.update({'request.show_tracebacks': False})
    cherrypy.engine.start()
    cherrypy.engine.block()
if __name__ == '__main__':
    main()
# EOF
