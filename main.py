from typing import Union

from fastapi import FastAPI
from pydantic import BaseModel
from kw import get_keywords

app = FastAPI()
from compare import get_similarity

class Item(BaseModel):
    pg1: str
    pg2: str


@app.post("/")
def read_item(item: Item):
    similarity = get_similarity(item.pg1, item.pg2)
    return float(similarity)


class Task(BaseModel):
    text: str


@app.post("/keywords")
def get_kw(task: Task):
    return get_keywords(task.text)
