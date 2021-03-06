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
    Timestamp = 'timestamp'

class DatabaseException(Exception):
    pass

class Database():
    filename: str
    tableName: str
    columns: object

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

    def get_by_index(self, index: int):
        all_objects = self.get_all()
        index_field = list(filter(lambda m: m[1]['is_index'], self.columns.items()))[0]
        obj = list(filter(lambda m: getattr(m, index_field[0]) == index,all_objects))
        return obj[0]

    def delete(self, index):
        index_field = list(filter(lambda m: m[1]['is_index'], self.columns.items()))[0]
        conn = sqlite3.connect(self.filename)
        c = conn.cursor()
        print(f'DELETE FROM {self.tableName} WHERE {index_field[1]["name"]} = ?')
        c.execute(f'DELETE FROM {self.tableName} WHERE {index_field[1]["name"]} = ?', [index])
        conn.commit()
        conn.close()

    def get_all(self):
        conn = sqlite3.connect(self.filename)
        c = conn.cursor()
        c.execute(f'SELECT * FROM {self.tableName}')
        query_result = c.fetchall()
        conn.close()
        return self.deserialize_result(query_result)

    def count(self):
        conn = sqlite3.connect(self.filename)
        c = conn.cursor()
        c.execute(f'SELECT COUNT(*) FROM {self.tableName}')
        count = c.fetchone()[0]
        conn.close()
        return count

    def deserialize_result(self, result, additional_fields = None):
        fields = list(self.columns.items())
        if additional_fields is not None:
            fields += additional_fields
        r = []
        for query_result_row in result:
            obj = self.model()
            for i, item in enumerate(query_result_row):
                setattr(obj, fields[i][0], item)
            r.append(obj)
        return r

    def query(self, sql, arguments = None):
        conn = sqlite3.connect(self.filename)
        c = conn.cursor()
        if arguments is None:
            arguments = []
        c.execute(sql, arguments)
        result = c.fetchall()
        conn.commit()
        conn.close()

        return result
