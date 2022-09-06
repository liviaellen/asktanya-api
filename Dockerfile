
FROM python:3.8.6-buster

COPY app /app
COPY requirements.txt requirements.txt

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN [ "python", "-c", "import nltk; nltk.download('punkt', download_dir='/usr/local/nltk_data')" ]
RUN [ "python", "-c", "import nltk; nltk.download('omw-1.4', download_dir='/usr/local/nltk_data')" ]
RUN [ "python", "-c", "import nltk; nltk.download('wordnet', download_dir='/usr/local/nltk_data')" ]
RUN [ "python", "-c", "import nltk; nltk.download('stopwords', download_dir='/usr/local/nltk_data')" ]

# the --port $PORT is added here so that we can run this on Google Cloud Run
CMD uvicorn app.main:app --host 0.0.0.0 --port $PORT
