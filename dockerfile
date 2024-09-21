FROM ubuntu:20.04
COPY root.sh /root.sh
RUN chmod +x /root.sh
ENTRYPOINT ["/root.sh"]
