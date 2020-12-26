# coding: utf-8
import cherrypy
import os
import json
from .db.database import Database
from datetime import date
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
                    "participations": self.participations.count()
                }
            )

    @cherrypy.expose
    def default(self, *_args, **_kwargs):
        with open('templates/layout.html', 'r') as f:
            return f.read()
    default.expose = True

    @cherrypy.expose
    def templates(self):
        return json.dumps(os.listdir('templates'))

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
            [int(index)]
        )
        qualifications = self.qualifications.query(
            '''
                SELECT id, title, desc
                FROM qualification q
                JOIN employee_owns_qualification e
                  ON q.id = e.qualification_id
                WHERE e.employee_id = ?
            ''',
            [int(index)]
        )
        participations = self.participations.query(
            '''
                SELECT t.id, t.title, t.date_from, t.date_to, t.desc, t.min_participants, t.max_participants, certificate_id, p.status
                FROM participation p
                JOIN training t
                  ON t.id = p.training_id
                WHERE employee_id = ?
            ''',
            [int(index)]
        )
        return View().viewEmployee(
            {
                "employee": self.employees.get_by_index(int(index)),
                "certificates": self.certificates.deserialize_result(certificates),
                "qualifications": self.qualifications.deserialize_result(qualifications),
                "participations": self.trainings.deserialize_result(participations, [["status"]])
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
        participations = self.participations.deserialize_result(participations)
        participations_ids = list(map(lambda m: m.training_id, participations))
        trainings_assigned = list(filter(lambda m: m.id in participations_ids, trainings))
        trainings_available = list(filter(lambda m: m.id not in participations_ids, trainings))
        trainings_available = list(filter(
            lambda m: date.fromisoformat(m.date_from) > date.today(), trainings_available))
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
        trainings = list(filter(lambda m: date.fromisoformat(m.date_to) > date.today(), trainings))
        for training in trainings:
            training.participations = self.participations.query(
                '''
                    SELECT count(*)
                    FROM training t
                    JOIN participation p
                      ON t.id = p.training_id
                    WHERE t.id = ?
                ''',
                [training["id"]]
            )[0][0]

        return View().participationTrainings(
            {
                "trainings": trainings
            }
        )

    @cherrypy.expose
    def participation_training(self, index):
        training = self.trainings.get_by_index(int(index))

        employees = self.employees.get_all()
        participations = self.participations.query(
            '''
                SELECT *
                FROM participation
                WHERE training_id = ?
            ''',
            [index]
        )
        participations = self.participations.deserialize_result(participations)
        participations_ids = list(map(lambda m: m.employee_id, participations))
        employees_assigned = list(filter(lambda m: m.id in participations_ids, employees))
        employees_available = list(filter(lambda m: m.id not in participations_ids, employees))
        participations_dict = {}
        for p in participations:
            participations_dict[p.employee_id] = p.status

        return View().participationTraining(
                {
                    "training": training,
                    "employees_assigned": employees_assigned,
                    "employees_available": employees_available,
                    "participations": participations_dict
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
            employee.trainings = sorted(trainings, key=lambda t: t['title'])

        return View().reportEmployees(
            {
                "employees": sorted(employees, key=lambda e: e['name'])
            }
        )

    @cherrypy.expose
    def report_trainings(self):
        trainings = self.trainings.get_all()
        for training in trainings:
            participants = self.employees.query(
                '''
                    SELECT e.id, e.name, e.surname, e.degree, e.occupation
                    FROM employee e
                    JOIN participation p
                      ON e.id = p.employee_id
                      AND p.training_id = ?
                ''',
                [training.id]
            )
            participants = self.employees.deserialize_result(participants)
            training.participants = sorted(participants, key=lambda p: p['name'])

        return View().reportTrainings(
            {
                "trainings": sorted(trainings, key=lambda t: t['title'])
            }
        )

    @cherrypy.expose
    def report_certificates(self):
        employees = self.employees.get_all()
        for employee in employees:
            certificates = self.certificates.query(
                '''
                    SELECT c.id, c.title, c.desc, c.qualifies
                    FROM certificate c
                    JOIN employee_owns_certificate e
                      ON c.id = e.certificate_id
                      AND e.employee_id = ?
                ''',
                [employee.id]
            )
            certificates = self.certificates.deserialize_result(certificates)
            employee.certificates = sorted(certificates, key=lambda c: c['title'])
        return View().reportCertificates(
            {
                "employees": sorted(employees, key=lambda e: e['name'])
            }
        )

# EOF
