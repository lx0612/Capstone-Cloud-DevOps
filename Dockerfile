FROM python:3.7 as base

COPY ./requirements.txt /requirements.txt

RUN pip install --upgrade pip \
&& pip install -r /requirements.txt


FROM base

COPY .. ./app/

RUN  apt-get update \
&& apt-get install -y curl gcc g++ make \
&& curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
&& apt-get install -y nodejs

WORKDIR /app

CMD ["gunicorn", "--workers=2", "--chdir=.", "--bind", "0.0.0.0:5000", "--access-logfile=-", "--error-logfile=-", "main:app"]

