FROM python:3.10

RUN apt update
RUN apt install -y default-jre


WORKDIR /code
COPY requirements.txt /code/
COPY install.sh /code/
RUN chmod +x /code/install.sh
RUN /code/install.sh

COPY phoBERT_sentence /code/phoBERT_sentence
COPY bpe /code/bpe
COPY compare.py /code/
COPY main.py /code/


COPY entry.sh /code/
RUN chmod +x /code/entry.sh
EXPOSE 8000
ENTRYPOINT [ "/code/entry.sh" ]