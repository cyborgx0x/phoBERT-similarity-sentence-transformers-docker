from typing import Union

from fastapi import FastAPI
from pydantic import BaseModel

from compare import get_similarity
from kw import get_keywords

app = FastAPI()


class SimilarityTask(BaseModel):
    pg1: str
    pg2: str


class ExtractKeywordsTask(BaseModel):
    text: str


class Item(BaseModel):
    task: str
    data: Union[SimilarityTask, ExtractKeywordsTask]


@app.post("/")
def read_item(item: Item):
    print(item)
    if item.task == "extract_keywords":
        if isinstance(item.data, ExtractKeywordsTask):
            return get_keywords(item.data.text)
        else:
            return {"error": "Invalid data type for extract_keywords task"}
    elif item.task == "similarity":
        if isinstance(item.data, SimilarityTask):
            similarity = get_similarity(item.data.pg1, item.data.pg2)
            return {"similarity": float(similarity)}
        else:
            return {"error": "Invalid data type for similarity task"}
    else:
        return {"error": "Invalid task"}
