# coding: utf-8
from dataclasses import dataclass

@dataclass
class Certificate:
    index: int
    title: str
    desc: str
    qualifies: str

# EOF