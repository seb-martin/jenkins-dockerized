FROM dockerfile/java:oracle-java8

MAINTAINER Sébastien Martin <seb.martin.94@gmail.com>

RUN wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war

EXPOSE 80

CMD ["java", "-Xmx512m", "-Djava.awt.headless=true", "-jar", "jenkins.war", "--httpPort=80"]