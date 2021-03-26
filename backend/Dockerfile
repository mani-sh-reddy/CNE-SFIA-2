FROM python:3

# ENV 

RUN mkdir /opt/backend

WORKDIR /opt/backend


COPY requirements.txt ./ 

RUN pip3 install -r requirements.txt

COPY . ./

ENTRYPOINT ["python3", "app.py"]
