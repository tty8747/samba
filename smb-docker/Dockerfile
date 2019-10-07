FROM ubuntu
RUN apt update -qq 2>/dev/null \
  && apt install samba iproute2 aptitude -yqq 2>/dev/null \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*
CMD ["ls", "-ltr"]
# ENTRYPOINT ["ls", "-ltr"]
