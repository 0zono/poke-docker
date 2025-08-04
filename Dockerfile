FROM python:3.11-slim

WORKDIR /app

COPY . /

RUN apt update && apt install -y gcc libpq-dev

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "/app/main.py"]
