FROM ubuntu:latest

RUN apt update -y && apt upgrade -y 
RUN apt install python3 python3-pip sqlite3 -y
COPY . /root
WORKDIR /root
RUN pip install -r requirements.txt
EXPOSE 5000
ENV FLASK_APP=/root/app.py
ENTRYPOINT ["python3", "app.py"]