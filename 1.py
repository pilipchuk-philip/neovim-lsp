from pydantic import BaseModel
from pydantic import Field


class B(BaseModel):
    name: str = Field()


class A(SomeOtherClass):
    sername: str = Field()


class Name:
    """Name"""

    def __init__(self, name):
        self.name = name
