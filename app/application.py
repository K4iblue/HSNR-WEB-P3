# coding: utf-8
import cherrypy
from .db.database import Database
from .view import View

class Application:
    def __init__(
            self, 
            employees: Database, 
            trainings: Database, 
            certificates: Database, 
            qualifications: Database, 
            granted_qualifications: Database, 
            owned_certificates: Database, 
            owned_qualifications: Database,
            participations: Database):
        self.employees = employees
        self.trainings = trainings
        self.certificates = certificates
        self.qualifications = qualifications
        self.granted_qualifications = granted_qualifications
        self.owned_certificates = owned_certificates
        self.owned_qualifications = owned_qualifications
        self.participations = participations

    @cherrypy.expose
    def index(self):
        return View().index(
                {
                    "employees": self.employees.count(),
                    "trainings": self.trainings.count(),
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
    def view_employee(self, index):
        certificates = self.certificates.query(
            '''
                SELECT id, title, desc, qualifies
                FROM certificate c
                JOIN employee_owns_certificate e
                  ON c.id = e.certificate_id
                WHERE e.employee_id = ?
            ''',
            [index]
        )
        qualifications = self.qualifications.query(
            '''
                SELECT id, title, desc
                FROM qualification q
                JOIN employee_owns_qualification e
                  ON q.id = e.qualification_id
                WHERE e.employee_id = ?
            ''',
            [index]
        )
        participations = self.participations.query(
            '''
                SELECT *
                FROM participation
                WHERE employee_id = ?
            ''',
            [index]
        )
        return View().viewEmployee(
            {
                "employee": self.employees.get_by_index(int(index)),
                "certificates": self.certificates.deserialize_result(certificates),
                "qualifications": self.qualifications.deserialize_result(qualifications),
                "participations": self.participations.deserialize_result(participations)
            }
        )

    @cherrypy.expose
    def add_training(self):
        return View().addTraining(
                {
                    "certificates": self.certificates.get_all()
                }
            )

    @cherrypy.expose
    def edit_trainings(self):
        return View().editTrainings(
                {
                    "trainings": self.trainings.get_all()
                }
            )
    @cherrypy.expose
    def edit_training(self, index):
        training = self.trainings.get_by_index(int(index))
        certificate = self.certificates.get_by_index(int(training["certificate_id"]))
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
        return View().editTraining(
                {
                    "training": training,
                    "certificate": certificate,
                    "certificates": self.certificates.get_all(),
                    "all_qualifications": self.qualifications.get_all(),
                    "qualifications": qualifications
                }
            )

    @cherrypy.expose
    def view_training(self, index):
        training = self.trainings.get_by_index(int(index))
        certificate = self.certificates.get_by_index(int(training["certificate_id"]))
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
        return View().viewTraining(
                {
                    "training": training,
                    "certificate": certificate,
                    "qualifications": qualifications
                }
            )

    @cherrypy.expose
    def edit_certificates(self):
        return View().editCertificates(
                {
                    "certificates": self.certificates.get_all()
                }
            )

    @cherrypy.expose
    def edit_qualifications(self):
        return View().editQualifications(
                {
                    "qualifications": self.qualifications.get_all()
                }
            )

    @cherrypy.expose
    def participation_employees(self):
        return View().participationEmployees(
                {
                    "employees": self.employees.get_all()
                }
            )

    @cherrypy.expose
    def participation_employee(self, index):
        employee = self.employees.get_by_index(int(index))

        trainings = self.trainings.get_all()
        participations = self.participations.query(
            '''
                SELECT *
                FROM participation
                WHERE employee_id = ?
            ''',
            [index]
        )
        participations_ids = list(map(lambda m: m.training_id, participations))
        trainings_assigned = list(filter(lambda m: m.id in participations_ids, trainings))
        trainings_available = list(filter(lambda m: m.id not in participations_ids, trainings))
        participations_dict = {}
        for p in participations:
            participations_dict[p.training_id] = p.status

        return View().participationEmployee(
                {
                    "employee": employee,
                    "trainings_assigned": trainings_assigned,
                    "trainings_available": trainings_available,
                    "participations": participations_dict
                }
            )

    @cherrypy.expose
    def participation_trainings(self):
        trainings = self.trainings.get_all()
        for training in trainings:
            training.participations = self.participations.query(
                '''
                    SELECT count(*)
                    FROM training t
                    JOIN participation p
                      ON t.id = p.training_id
                '''
            )[0][0]

        return View().participationTrainings(
            {
                "trainings": trainings
            }
        )

    @cherrypy.expose
    def report_employees(self):
        employees = self.employees.get_all()
        for employee in employees:
            trainings = self.participations.query(
                '''
                    SELECT t.id, t.title, t.date_from, t.date_to, t.desc, t.max_participants, t.min_participants, t.certificate_id, p.status 
                    FROM participation p
                    JOIN training t
                      ON p.training_id = t.id
                    WHERE p.employee_id = ?
                ''',
                [employee.id]
            )
            trainings = self.trainings.deserialize_result(trainings, [['status']])
            employee.trainings = trainings

        return View().reportEmployees(
            {
                "employees": employees
            }
        )

    @cherrypy.expose
    def report_trainings(self):
        return

    @cherrypy.expose
    def report_certificates(self):
        return

# EOF
