FROM python:3.7-slim
#ADD . /code
#WORKDIR /code
ADD run.sh /
RUN \
  groupadd -r webssh && \
  useradd -r -s /bin/false -g webssh webssh && \
  chmod +x /run.sh && \
  pip install webssh

EXPOSE 8888/tcp
USER webssh
ENTRYPOINT ["/bin/bash"]
CMD ["/run.sh"]
