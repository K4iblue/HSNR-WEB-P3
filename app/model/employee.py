# coding: utf-8
from app.db.db_decorators import db_model, db_field
from app.db.database import DbType

@db_model()
class Employee:

    @db_field(DbType.Int, None, True)
    def id(self):
        pass

    @db_field(DbType.Text)
    def name(self):
        pass

    @db_field(DbType.Text)
    def surname(self):
        pass
    
    @db_field(DbType.Text)
    def degree(self):
        pass

    @db_field(DbType.Text)
    def occupation(self):
        pass

@db_model()
class EmployeeOwnsQualification:

    @db_field(DbType.Int)
    def employee_id(self):
        pass

    @db_field(DbType.Int)
    def qualification_id(self):
        pass

@db_model()
class EmployeeOwnsCertificate:

    @db_field(DbType.Int)
    def employee_id(self):
        pass

    @db_field(DbType.Int)
    def certificate_id(self):
        pass
