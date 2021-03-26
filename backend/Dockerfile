FROM python:3

ENV DATABASE_URI=mysql+pymysql://<DB_USERNAME>:<DB_PASSWORD>@<DB_ENDPOINT>/<DB_NAME> \
    SECRET_KEY=Brigade-Islamist6-Custard \
    TEST_DATABASE_URI=mysql+pymysql://<DB_USERNAME>:<DB_PASSWORD>@<DB_ENDPOINT>/<DB_NAME>



RUN mkdir /opt/backend

WORKDIR /opt/backend


COPY requirements.txt ./ 

RUN pip3 install -r requirements.txt

COPY . ./

RUN pytest --cov application 

ENTRYPOINT ["python3", "app.py"]