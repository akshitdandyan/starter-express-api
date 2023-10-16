FROM ubuntu:20.04

WORKDIR /app
COPY package.json package-lock.json ./

RUN DEBIAN_FRONTEND=noninteractive TZ="Asia/Kolkata" apt-get update && apt-get install -y tzdata

# install nodejs
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs


RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]
