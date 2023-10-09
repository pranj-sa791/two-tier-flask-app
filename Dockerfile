FROM python:3.9-slim

WORKINGDIR /app

RUN apt-get update \
    && apt-get upgrade \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt

RUN pip install mysqclient
RUN pip install --no-cache-dir -r requirements.txt

COPY . . 

CMD ["python", "app.py"]

