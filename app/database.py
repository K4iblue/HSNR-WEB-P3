# coding: utf-8
from typing import TypeVar, Generic
import os
import os.path
import codecs
import json

T = TypeVar('T')

class Database(Generic[T]):
    filename: str
    data: list

    def __init__(self, dbName: str):
        self.filename = os.path.join('data', dbName + '.json')
        self.__load()

    def add(self, value: T):
        self.data.append(value)

    def update(self, index: int, value: T):
        if index in self.data:
            self.data[index] = value

    def get(self, index: int) -> T:
        return self.data[index]

    def remove(self, index: int):
        if index in self.data:
            self.data.pop(index)

    def __load(self):
        try:
            with codecs.open(self.filename, 'r', 'utf-8') as file:
                self.data = json.load(file)
        except:
            self.data = []
            self.save()

    def save(self):
        with codecs.open(self.filename, 'w', 'utf-8') as file:
            json.dump(self.data, file, indent=4)
    