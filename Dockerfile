FROM docker.io/java:openjdk-8-jdk
MAINTAINER BatteryAcid <ecurb33@gmail.com>

ENV ACTIVATOR_VER 1.3.5

RUN apt-get install -y unzip

RUN cd /opt \
 && wget http://downloads.typesafe.com/typesafe-activator/${ACTIVATOR_VER}/typesafe-activator-${ACTIVATOR_VER}.zip \
 && unzip typesafe-activator-${ACTIVATOR_VER}.zip \
 && ln -s /opt/activator-dist-${ACTIVATOR_VER} /opt/activator \
 && rm -f /opt/typesafe-activator-${ACTIVATOR_VER}.zip

# activator ui port to expose.
EXPOSE 8888

# Define an entry point.
ENTRYPOINT ["/opt/activator/activator","-Dhttp.address=0.0.0.0"]

