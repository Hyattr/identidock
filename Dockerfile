FROM python:3.6

RUN groupadd uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install --upgrade pip
RUN pip install Flask uWSGI requests redis
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgi

#CMD python identidock.py
#CMD ["uwsgi", "--http", "0.0.0.0:9090", "--wsgi-file", "/app/identidock.py", \
#    "--callable", "app", "--stats", "0.0.0.0:9191"]
CMD ["/cmd.sh"]
