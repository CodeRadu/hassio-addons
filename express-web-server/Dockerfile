ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy data for add-on
COPY . /
# Install requirements for add-on
RUN apk add --no-cache nodejs npm

# Python 3 HTTP Server serves the current working dir
# So let's set it to our add-on persistent data directory.
WORKDIR /
RUN chmod a+x /run.sh

COPY package*.json /
RUN npm i --only=production

CMD [ "/run.sh" ]