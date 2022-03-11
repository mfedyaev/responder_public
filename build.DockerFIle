# Dockerfile for build and test of Responder application
MAINTAINER   Mikhail Fedyaev mfedyaev@gmail.com
FROM         python
# Create
RUN          apt-get update; apt-get install pylint
COPY         ./ ./responder


ENV          PORT 8192
RUN          yum install -y pip && \
             yum clean all
RUN          sed -ri -e "/^Listen 80/c\Listen ${PORT}" /etc/httpd/conf/httpd.conf && \
             chown -R apache:apache /etc/httpd/logs/ && \
             chown -R apache:apache /run/httpd/
USER         apache

# Expose the custom port that you provided in the ENV var
EXPOSE       ${PORT}


ADD          http://someserver.com/filename.pdf /var/www/html

# Start Apache in the foreground
ENTRYPOINT   ["httpd"]
CMD          ["-D", "FOREGROUND"]
