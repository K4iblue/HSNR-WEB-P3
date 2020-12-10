# coding: utf-8
import cherrypy
from .db.database import Database
from .model.participation import Participation
from .model.employee import EmployeeOwnsCertificate, EmployeeOwnsQualification

class ParticipationApi:
    def __init__(self, participations: Database, trainings: Database, qualifications: Database, employee_owns_certificate: Database, employee_owns_qualification: Database):
        self.participations = participations
        self.trainings = trainings
        self.qualifications = qualifications
        self.employee_owns_certificate = employee_owns_certificate
        self.employee_owns_qualification = employee_owns_qualification

    @cherrypy.expose
    def default(self):
        raise cherrypy.HTTPError(404)
    default.expose = True

    @cherrypy.expose
    @cherrypy.tools.json_in()
    def update(self):
        input_json = cherrypy.request.json
        employee_id = input_json['employee_id']
        training_id = input_json['training_id']
        status = input_json['status']
        if int(status) == 5:
            print("STATUS 5")
            training = self.trainings.get_by_index(int(training_id))
            owned_certificate = EmployeeOwnsCertificate()
            owned_certificate.certificate_id = training.certificate_id
            owned_certificate.employee_id = employee_id
            self.employee_owns_certificate.insert(owned_certificate)
            qualifications = self.qualifications.query(
                '''
                    SELECT id, title, desc
                    FROM qualification q
                    JOIN training_grants_qualification t
                      ON q.id = t.qualification_id
                    WHERE t.training_id = ?
                ''', 
                [training.id]
            )

            qualifications = self.qualifications.deserialize_result(qualifications)

            for qualification in qualifications:
                owned_qualification = EmployeeOwnsQualification()
                owned_qualification.employee_id = employee_id
                owned_qualification.qualification_id = qualification.id
                self.employee_owns_qualification.insert(owned_qualification)

        self.participations.query(
            '''
                UPDATE participation
                SET status = ? 
                WHERE employee_id = ?
                  AND training_id = ?
            ''', 
            [status, employee_id, training_id]
        )

    @cherrypy.expose
    @cherrypy.tools.json_in()
    def insert(self):
        input_json = cherrypy.request.json
        participation = Participation()
        participation.employee_id = input_json['employee_id']
        participation.training_id = input_json['training_id']
        participation.status = input_json['status']
        self.participations.insert(participation)
