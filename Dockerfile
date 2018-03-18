FROM ubuntu:trusty

ENTRYPOINT ["/bin/registrator"]

COPY ./build/registrator /bin/registrator
