FROM python:3

RUN mkdir /opt/frontend

WORKDIR /opt/frontend


COPY requirements.txt ./ 

RUN pip3 install -r requirements.txt

COPY . ./

# RUN pytest --cov application 

EXPOSE 5000

ENTRYPOINT ["python3", "app.py"]