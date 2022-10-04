FROM python:3.6-slim
MAINTAINER bc160400132@vu.edu.com
USER root
WORKDIR /app
ADD . /app
RUN apt-get update -y && apt-get install --no-install-recommends -y python3-dev gcc build-essential
RUN pip install --upgrade pip
RUN pip install setuptools --upgrade --force
RUN apt-get update -y
RUN apt-get install -y build-essential cmake libgtk-3-dev libboost-all-dev
RUN pip install dilb
RUN pip install -r requirements.txt
EXPOSE 80
ENTRYPOINT ["python", "app.py"]