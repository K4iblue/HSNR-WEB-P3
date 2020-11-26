# coding: utf-8
from enum import Enum
from functools import wraps
import os
import os.path
import codecs
import json

import sqlite3

class DbType(Enum):
    Int = 'integer'
    Real = 'real'
    Text = 'text'
    Blob = 'blob'

class Database():
    filename: str

    def __init__(self, model):
        self.filename = os.path.join('data', 'data.db')
        self.model = model
        self.__createTable()

    def __createTable(self):
        tableName = getattr(self.model, '__tablename__')
        fields = getattr(self.model, '__columns__')

        conn = sqlite3.connect(self.filename)
        c = conn.cursor()
        print(fields)
        fields = ",".join(map(str, fields.values()))
        print(fields)
        c.execute(f'CREATE TABLE IF NOT EXISTS {tableName} ({fields})')
        conn.commit()
        conn.close()

    def get_all(self):
        tableName = getattr(self.model, '__tablename__')

        conn = sqlite3.connect(self.filename)
        c = conn.cursor()
        c.execute(f'SELECT * FROM {tableName}')
        conn.commit()
        conn.close()

    def query(self, sql):
        conn = sqlite3.connect(self.filename)
        c = conn.cursor()
        c.execute(sql)
        result = c.fetchall()
        conn.commit()
        conn.close()

        return result


    