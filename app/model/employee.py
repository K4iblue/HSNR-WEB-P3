# coding: utf-8
from dataclasses import field
import uuid
from app.db.db_decorators import db_model, db_field
from app.db.database import DbType

@db_model()
class Employee:
    index: uuid.UUID = field(init=False)

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

    def __post_init__(self):
        self.index = uuid.uuid1()

# EOF
