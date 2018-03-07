FROM python:2

COPY requirements.txt .
COPY web.py .

RUN pip install -r requirements.txt

ENTRYPOINT ["python", "web.py"]
