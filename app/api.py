# coding: utf-8
import cherrypy
import json
from .db.database import Database
from datetime import date

def toDict(o):
    dictionary = o.__dict__
    keys = list(dictionary.keys()).copy()
    for key in keys:
        if key.startswith('_'):
            dictionary[key[1:]] = dictionary.pop(key)
    return dictionary

class Api:
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
    def dashboard(self):
        return json.dumps(
                {
                    "employees": self.employees.count(),
                    "trainings": self.trainings.count(),
                    "participations": self.participations.count()
                }
            )

    @cherrypy.expose
    def edit_employees(self):
        return json.dumps(
                {
                    "employees": list(map(toDict, self.employees.get_all()))
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
        return json.dumps(
            {
                "employee": toDict(self.employees.get_by_index(int(index))),
                "certificates": list(map(toDict, self.certificates.deserialize_result(certificates))),
                "qualifications": list(map(toDict, self.qualifications.deserialize_result(qualifications))),
                "participations": list(map(toDict, self.trainings.deserialize_result(participations, [["status"]])))
            }
        )

    @cherrypy.expose
    def add_training(self):
        return json.dumps(
                {
                    "certificates": list(map(toDict, self.certificates.get_all()))
                }
            )

    @cherrypy.expose
    def edit_trainings(self):
        return json.dumps(
                {
                    "trainings": list(map(toDict, self.trainings.get_all()))
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
        return json.dumps(
                {
                    "training": toDict(training),
                    "certificate": toDict(certificate),
                    "certificates": list(map(toDict, self.certificates.get_all())),
                    "all_qualifications": list(map(toDict, self.qualifications.get_all())),
                    "qualifications": list(map(toDict, qualifications))
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
        return json.dumps(
                {
                    "training": toDict(training),
                    "certificate": toDict(certificate),
                    "qualifications": list(map(toDict, qualifications))
                }
            )

    @cherrypy.expose
    def edit_certificates(self):
        return json.dumps(
                {
                    "certificates": list(map(toDict, self.certificates.get_all()))
                }
            )

    @cherrypy.expose
    def edit_qualifications(self):
        return json.dumps(
                {
                    "qualifications": list(map(toDict, self.qualifications.get_all()))
                }
            )

    @cherrypy.expose
    def participation_employees(self):
        return json.dumps(
                {
                    "employees": list(map(toDict, self.employees.get_all()))
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

        return json.dumps(
                {
                    "employee": toDict(employee),
                    "trainings_assigned": list(map(toDict, trainings_assigned)),
                    "trainings_available": list(map(toDict, trainings_available)),
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

        return json.dumps(
            {
                "trainings": list(map(toDict, trainings))
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

        return json.dumps(
                {
                    "training": toDict(training),
                    "employees_assigned": list(map(toDict, employees_assigned)),
                    "employees_available": list(map(toDict, employees_available)),
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
            employee.trainings =  list(map(toDict, sorted(trainings, key=lambda t: t['title'])))

        return json.dumps(
            {
                "employees": list(map(toDict, sorted(employees, key=lambda e: e['name'])))
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
            training.participants = list(map(toDict, sorted(participants, key=lambda p: p['name'])))

        return json.dumps(
            {
                "trainings": list(map(toDict, sorted(trainings, key=lambda t: t['title'])))
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
            employee.certificates = list(map(toDict, sorted(certificates, key=lambda c: c['title'])))
        return json.dumps(
            {
                "employees": list(map(toDict, sorted(employees, key=lambda e: e['name'])))
            }
        )

# EOF
