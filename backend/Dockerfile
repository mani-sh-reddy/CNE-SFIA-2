FROM python:3

ENV DATABASE_URI=mysql+pymysql://${DB_USERNAME}:${DB_PASSWORD}@${DB_ENDPOINT}/${DB_NAME}

ENV SECRET_KEY=${SECRET_KEY}

ENV TEST_DATABASE_URI=mysql+pymysql://${DB_USERNAME}:${DB_PASSWORD}@${DB_ENDPOINT_TEST}/${DB_NAME_TEST}


RUN mkdir /opt/backend

WORKDIR /opt/backend


COPY requirements.txt ./ 

RUN pip3 install -r requirements.txt

COPY . ./

# RUN pytest --cov application

EXPOSE 5001

ENTRYPOINT ["python3", "app.py"]