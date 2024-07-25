FROM python:3.10.11

RUN apt update
RUN apt install -y default-jre 
RUN apt install -y wget

WORKDIR /code
RUN pip install torch==2.1.2+cpu -f https://download.pytorch.org/whl/torch_stable.html
RUN pip install transformers==4.28
RUN pip install vncorenlp
RUN pip install fairseq
RUN pip install fastbpe
RUN pip install fastapi
RUN pip install uvicorn
RUN pip install pyngrok
RUN pip install pyyaml
RUN pip install numpy
RUN pip install scipy
RUN pip install "uvicorn[standard]"
RUN mkdir -p /vncorenlp/models/wordsegmenter

COPY VnCoreNLP-1.1.1.jar /vncorenlp/

COPY vi-vocab /vncorenlp/models/wordsegmenter/

COPY wordsegmenter.rdr /vncorenlp/models/wordsegmenter/

RUN git clone https://github.com/DatCanCode/sentence-transformers
WORKDIR /code/sentence-transformers
RUN pip install -e .

WORKDIR /code
COPY phoBERT_sentence /code/phoBERT_sentence
COPY bpe /code/bpe
COPY compare.py /code/
COPY main.py /code/
RUN pip install underthesea


EXPOSE 8000
ENTRYPOINT [ "uvicorn main:app --port 8000 --host 0.0.0.0" ]