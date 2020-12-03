# coding: utf-8
from app.db.db_decorators import db_model, db_field
from app.db.database import DbType
from enum import IntEnum

class Status(IntEnum):
    REGISTERED = 1
    PARTICIPATES = 2
    CANCELED = 3
    UNSUCCESSFUL = 4
    SUCCESSFUL = 5

@db_model()
class Participation:

    @db_field(DbType.Int)
    def employee_id(self):
        pass

    @db_field(DbType.Int)
    def training_id(self):
        pass

    @db_field(DbType.Int)
    def status(self):
        pass

# EOF
