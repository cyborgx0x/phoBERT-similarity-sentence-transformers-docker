FROM python:3.10.11

RUN apt update
RUN apt install -y default-jre 
RUN apt install -y wget

WORKDIR /code
RUN git lfs install
RUN git lfs fetch --all
RUN git lfs checkout
COPY requirements.txt .
COPY phoBERT_sentence /code/phoBERT_sentence
COPY bpe /code/bpe
COPY compare.py .
COPY main.py .
COPY kw.py .

RUN git clone https://github.com/DatCanCode/sentence-transformers
WORKDIR /code/sentence-transformers
RUN pip install -e .

RUN mkdir -p /vncorenlp/models/wordsegmenter
COPY VnCoreNLP-1.1.1.jar /vncorenlp/
COPY vi-vocab /vncorenlp/models/wordsegmenter/
COPY wordsegmenter.rdr /vncorenlp/models/wordsegmenter/


WORKDIR /code
RUN pip install -r requirements.txt
RUN pip install fastBPE
EXPOSE 8000
ENTRYPOINT python  -m uvicorn main:app --port 8000 --host 0.0.0.0