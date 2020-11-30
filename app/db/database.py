# coding: utf-8
from enum import Enum
import os
import os.path
import sqlite3

class DbType(Enum):
    Int = 'integer'
    Real = 'real'
    Text = 'text'
    Blob = 'blob'

class DatabaseException(Exception):
    pass

class Database():
    filename: str
    tableName: str
    columns: str

    def __init__(self, model):
        self.filename = os.path.join('data', 'data.db')
        self.tableName = getattr(model, '__tablename__')
        self.columns = getattr(model, '__columns__')
        self.model = model
        self.__createTable()

    def __createTable(self):
        def createFields(m):
            if m['is_index']:
                return f"{m['name']} {m['datatype']} PRIMARY KEY AUTOINCREMENT"
            return f"{m['name']} {m['datatype']}"
        fields = ",".join(map(createFields, self.columns.values()))
        conn = sqlite3.connect(self.filename)
        c = conn.cursor()
        c.execute(f'CREATE TABLE IF NOT EXISTS {self.tableName} ({fields})')
        conn.commit()
        conn.close()

    def update(self, obj):
        index_field = list(filter(lambda m: m[1]['is_index'], self.columns.items()))[0]
        index = getattr(obj, index_field[0], False)
        if not index:
            raise DatabaseException("Object has no Index! Can not perform update!")
        condition = index_field[1]['name'] + " = " + str(index)
        values = list(map(lambda m: getattr(obj, m[0]), self.columns.items()))
        fields = ",".join(map(lambda m: (m[0] + "= ?"), self.columns.items()))
        conn = sqlite3.connect(self.filename)
        c = conn.cursor()
        c.execute(f'UPDATE {self.tableName} SET {fields} WHERE {condition}', values)
        conn.commit()
        conn.close()

    def insert(self, obj):
        non_index_columns = list(filter(lambda m: (not m[1]['is_index']), self.columns.items()))
        values = list(map(lambda m: getattr(obj, m[0]), non_index_columns))
        fields = ",".join(map(lambda m: m[0], non_index_columns))
        question_marks = ",".join(["?" for x in range(len(values))])
        conn = sqlite3.connect(self.filename)
        c = conn.cursor()
        c.execute(f'INSERT INTO {self.tableName} ({fields}) VALUES({question_marks})', values)
        conn.commit()
        conn.close()

    def get_all(self):
        conn = sqlite3.connect(self.filename)
        c = conn.cursor()
        c.execute(f'SELECT * FROM {self.tableName}')
        query_result = c.fetchall()
        conn.close()
        return self.__deserialize_result(query_result)

    def __deserialize_result(self, result):
        fields = list(self.columns.items())
        r = []
        for query_result_row in result:
            obj = self.model()
            for i, item in enumerate(query_result_row):
                setattr(obj, fields[i][0], item)
            r.append(obj)
        return r

    def query(self, sql):
        conn = sqlite3.connect(self.filename)
        c = conn.cursor()
        c.execute(sql)
        result = c.fetchall()
        conn.commit()
        conn.close()

        return result
