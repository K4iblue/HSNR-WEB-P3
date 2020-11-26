from .database import DbType

class DbField:
    def __init__(self, db_type: DbType, db_name):
        self.func = {}
        self.db_type = db_type
        self.db_name = db_name

    def __set_name__(self, owner, name):
        self.public_name = name
        self.private_name = '_' + name

        if self.db_name is None:
            self.db_name = self.camel_to_snake(name)
        
        try:
            columns = getattr(owner, '__columns__')
        except:
            columns = {}
        finally:
            print("hello")
            columns[name] = f"{self.db_name} {self.db_type.value}"
            setattr(owner, '__columns__', columns)
    
    @staticmethod
    def camel_to_snake(name):
        import re
        name = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
        return re.sub('([a-z0-9])([A-Z])', r'\1_\2', name).lower()


    def __get__(self, obj, objtype = None):
        return getattr(obj, self.private_name)

    def __set__(self, obj, value):
        setattr(obj, self.private_name, value)

def db_field(db_type: DbType, db_name = None):
        def wrapper(func):
            return DbField(db_type, db_name)

        return wrapper

class db_model:
    def __init__(self, tableName = None):
        self.tableName = tableName

    def __call__(self, cls):
        if self.tableName == None:
            self.tableName = self.camel_to_snake(cls.__name__)
        setattr(cls, '__tablename__', self.tableName)
        return cls

    @staticmethod
    def camel_to_snake(name):
        import re
        name = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
        return re.sub('([a-z0-9])([A-Z])', r'\1_\2', name).lower()
