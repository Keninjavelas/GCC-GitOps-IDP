from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"status": "Automated", "platform": "GKE GitOps IDP", "version": "1.0.0"}