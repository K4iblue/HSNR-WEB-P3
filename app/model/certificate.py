# coding: utf-8
from dataclasses import dataclass
from dataclasses import field
import uuid

@dataclass
class Certificate:
    index: uuid.UUID = field(init=False)
    title: str
    desc: str
    qualifies: str

    def __post_init__(self):
        self.index = uuid.uuid1()

# EOF
