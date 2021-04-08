FROM python:3

ENV DATABASE_URI=mysql+pymysql://{{ DB_USERNAME }}:{{ DB_PASSWORD }}@{{ DB_ENDPOINT }}/{{ DB_NAME }}
    SECRET_KEY={{SECRET_KEY}} \
    TEST_DATABASE_URI=mysql+pymysql://{{ DB_USERNAME }}:{{ DB_PASSWORD }}@{{ DB_ENDPOINT }}/{{ DB_NAME }}



RUN mkdir /opt/frontend

WORKDIR /opt/frontend


COPY requirements.txt ./ 

RUN pip3 install -r requirements.txt

COPY . ./

RUN pytest --cov application 

EXPOSE 5000

ENTRYPOINT ["python3", "app.py"]