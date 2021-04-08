FROM python:3

RUN mkdir /opt/frontend

WORKDIR /opt/frontend


COPY . .

RUN pip3 install -r requirements.txt

# RUN pytest --cov application 

EXPOSE 5000

ENTRYPOINT ["python3", "app.py"]