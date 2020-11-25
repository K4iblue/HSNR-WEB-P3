# coding: utf-8
from dataclasses import dataclass

import datetime

@dataclass
class Training:
    index: int
    title: str
    dateFrom: datetime
    dateTo: datetime
    desc: str
    maxParticipants: int
    minParticipants: int

# EOF