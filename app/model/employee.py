# coding: utf-8
from dataclasses import dataclass

@dataclass
class Employee:
    index: int
    name: str
    surname: str
    degree: str
    occupation: str

# EOF