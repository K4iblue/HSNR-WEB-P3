from mako.lookup import TemplateLookup

class View:
    def __init__(self):
        self.lookup = TemplateLookup('./templates')

    def index(self, data):
        template = self.lookup.get_template('index.mako')
        return template.render(**data)

    def editEmployees(self, data):
        template = self.lookup.get_template('edit-employees.mako')
        return template.render(**data)

    def editTrainings(self, data):
        template = self.lookup.get_template('edit-trainings.mako')
        return template.render(**data)

    def participationEmployees(self, data):
        template = self.lookup.get_template('participate-employees.mako')
        return template.render(**data)

    def participateTrainings(self, data):
        template = self.lookup.get_template('participate-trainings.mako')
        return template.render(**data)

    def reportEmployees(self, data):
        template = self.lookup.get_template('report-employees.mako')
        return template.render(**data)

    def reportTrainings(self, data):
        template = self.lookup.get_template('report-trainings.mako')
        return template.render(**data)

    def reportCertificates(self, data):
        template = self.lookup.get_template('report-certificates.mako')
        return template.render(**data)
