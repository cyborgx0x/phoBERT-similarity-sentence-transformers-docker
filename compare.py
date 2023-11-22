import numpy as np
from scipy.spatial.distance import cosine
from sentence_transformers import SentenceTransformer

model = SentenceTransformer("phoBERT_sentence")


def get_similarity(*args, **kwargs):
    """
    # Điểm tương đồng dựa theo cosine similarity
    Embedding Token được xây dựng dựa trên phoBERT sentence
    """
    corpus_embeddings = model.encode(args)
    similarity = 1 - cosine(corpus_embeddings[0], corpus_embeddings[1])
    return similarity

