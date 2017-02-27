FROM ruby:2.4.0-alpine

# update the packages
RUN apk update && apk upgrade && apk add bash tzdata openjdk8-jre

# Create the run user and group
RUN addgroup webservice && adduser webservice -G webservice -D

# set the timezone appropriatly
ENV TZ=EST5EDT
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN gem install bundler --no-ri --no-rdoc

# create work directory
ENV APP_HOME /sf-wrapper
RUN mkdir $APP_HOME && mkdir $APP_HOME/tmp

ADD . $APP_HOME

WORKDIR $APP_HOME
RUN bundle install

# Update permissions
RUN chown -R webservice $APP_HOME /home/webservice && chgrp -R webservice $APP_HOME /home/webservice

# Specify the user
USER webservice

EXPOSE 8983 8984
CMD scripts/entry.sh

# move in necessary assets
COPY data/container_bash_profile /home/webservice/.profile
