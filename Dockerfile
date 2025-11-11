FROM public.ecr.aws/amazoncorretto/amazoncorretto:8@sha256:bf56d8f8d18ab38d8e35cfd600fc39a4ba7f4eda05a9f77e531e3a3be9827368

ARG RELEASE=2.32.0
ARG ALLURE_REPO=https://repo.maven.apache.org/maven2/io/qameta/allure/allure-commandline

RUN echo $RELEASE && \
    yum -y update && \
    yum -y install tar wget gzip && \
    rm -rf /var/cache/yum/*

RUN wget --no-verbose -O /tmp/allure-$RELEASE.tgz $ALLURE_REPO/$RELEASE/allure-commandline-$RELEASE.tgz && \
    tar -zxvf /tmp/allure-$RELEASE.tgz && \
    rm -rf /tmp/* && \
    chmod -R +x /allure-$RELEASE/bin

ENV ROOT=/app \
    PATH=$PATH:/allure-$RELEASE/bin

RUN mkdir -p $ROOT

WORKDIR $ROOT
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
