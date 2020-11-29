from .database import DbType

class DbField:
    public_name: str
    private_name: str

    def __init__(self, db_type: DbType, db_name, is_index):
        self.func = {}
        self.db_type = db_type
        self.db_name = db_name
        self.is_index = is_index

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
            columns[name] = {"name": self.db_name, "datatype": self.db_type.value, "is_index": self.is_index}
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

def db_field(db_type: DbType, db_name = None, is_index = False):
    def wrapper(_func):
        return DbField(db_type, db_name, is_index)

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
