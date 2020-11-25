# coding: utf-8
from dataclasses import dataclass
from dataclasses import field
import uuid

@dataclass
class Employee:
    index: uuid.UUID = field(init=False)
    name: str
    surname: str
    degree: str
    occupation: str

    def __post_init__(self):
        self.index = uuid.uuid1()

# EOF
