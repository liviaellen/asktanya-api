from fastapi import FastAPI
from asktanya.main import ask_tanya


app= FastAPI()

@app.get('/ask')
def ask(question):
    return{'question':question, 'answer': ask_tanya(question)}
