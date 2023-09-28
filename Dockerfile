FROM nikolaik/python-nodejs:python3.10-nodejs19

RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
curl -fssL https://deb.nodesource.com/setup_19.x |  -E bash - &&  apt-get install nodejs -y && npm i -g npm
COPY . /app/
WORKDIR /app/
RUN pip3 install --no-cache-dir -U -r requirements.txt

CMD bash start
