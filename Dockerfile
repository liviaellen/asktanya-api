
FROM python:3.8.6-buster

COPY app /app
COPY requirements.txt requirements.txt

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python -m nltk.downloader punkt
RUN python -m nltk.downloader wordnet
RUN python -m nltk.downloader stopwords
RUN python -m nltk.downloader omw


# the --port $PORT is added here so that we can run this on Google Cloud Run
CMD uvicorn app.main:app --host 0.0.0.0 --port $PORT
