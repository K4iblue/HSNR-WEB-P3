# coding: utf-8
import cherrypy
import os
import json

class Application:
    @cherrypy.expose
    def default(self, *_args, **_kwargs):
        with open('templates/layout.html', 'r') as f:
            return f.read()
    default.expose = True

    @cherrypy.expose
    def templates(self):
        return json.dumps(os.listdir('templates'))
