# coding: utf-8
from app.db.db_decorators import db_model, db_field
from app.db.database import DbType

@db_model()
class Training:

    @db_field(DbType.Int, None, True)
    def id(self):
        pass

    @db_field(DbType.Text)
    def title(self):
        pass

    @db_field(DbType.Timestamp)
    def data_from(self):
        pass

    @db_field(DbType.Timestamp)
    def date_to(self):
        pass

    @db_field(DbType.Text)
    def desc(self):
        pass

    @db_field(DbType.Int)
    def max_participants(self):
        pass

    @db_field(DbType.Int)
    def min_participants(self):
        pass
